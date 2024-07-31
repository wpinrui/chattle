from logging import getLogger
from flask import Flask, request, jsonify, Response
from auth.auth import check_auth
from history.history_handler import HistoryHandler
from model.gptneo.model import generate_response
from model.gptneo.parser import remove_unexpected_punc

app = Flask(__name__)
logger = getLogger()
history_handler = HistoryHandler(max_length=10)

@app.route('/generate', methods=['POST'])
def generate_text() -> Response:
    user_id = request.headers.get("User-ID")
    logger.debug(f"Received request from user {user_id}")

    auth_header = request.headers.get("Authorization")
    if auth_header and auth_header.startswith("Bearer "):
        auth_token = auth_header[len("Bearer "):]
    else:
        auth_token = None
    logger.debug(f"Received auth token from user {user_id}: {auth_token}")
    
    if not user_id or not auth_token or not check_auth(auth_token):
        return jsonify({"error": "Unauthorized"}), 403

    data = request.json
    prompt = data.get("prompt", "")
    logger.debug(f"Received prompt from user {user_id}: {prompt}")
    
    history = history_handler.get_history(user_id)
    response = generate_response(prompt, history)
    logger.debug(f"Generated response for user {user_id}: {response}")
    cleaned_response: str = remove_unexpected_punc(response)
    history_handler.add_to_history(user_id, prompt, cleaned_response)
    
    return jsonify({"generated_text": response})

@app.route('/clear-history', methods=['POST'])
def clear_history() -> Response:
    # Get userId and auth token from the request headers
    user_id = request.headers.get("User-ID")
    auth_token = request.headers.get("Authorization")
    
    if not user_id or not auth_token or not check_auth(auth_token):
        return jsonify({"error": "Unauthorized"}), 403

    history_handler.clear_history(user_id)
    logger.debug(f"Cleared conversation history for user {user_id}")

    return jsonify({"message": "Conversation history cleared."})

@app.route('/health', methods=['GET'])
def health() -> Response:
    logger.debug("Health check endpoint called.")
    return jsonify({"status": "ok"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
    logger.debug("Flask app started.")
