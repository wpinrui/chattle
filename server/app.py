from flask import Flask, request, jsonify
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
import random
import numpy as np
from collections import deque
import logging

app = Flask(__name__)

# Set up logging
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

# Set a random seed for reproducibility
SEED = random.randint(1, 10000)  # You can set this to any integer you want
random.seed(SEED)
torch.manual_seed(SEED)
np.random.seed(SEED)

logging.debug(f"Random seed set to: {SEED}")

# Load DialoGPT model and tokenizer
tokenizer = AutoTokenizer.from_pretrained("microsoft/DialoGPT-large")
model = AutoModelForCausalLM.from_pretrained("microsoft/DialoGPT-large")

logging.debug("Model and tokenizer loaded successfully.")

# Initialize a deque to keep conversation history with a max length of 10
conversation_history = deque(maxlen=10)

@app.route('/generate', methods=['POST'])
def generate_text():
    global conversation_history
    
    # Get prompt from the request
    data = request.json
    prompt = data.get("prompt", "")
    logging.debug(f"Received prompt: {prompt}")
    
    # Append the user's prompt to the conversation history
    conversation_history.append(prompt)
    logging.debug(f"Updated conversation history: {list(conversation_history)}")
    
    # Encode the conversation history
    history_text = ' '.join(conversation_history)
    input_ids = tokenizer.encode(history_text + tokenizer.eos_token, return_tensors='pt')
    attention_mask = torch.ones(input_ids.shape, dtype=torch.long)
    logging.debug(f"Encoded input ids: {input_ids}")
    
    # Generate a response
    chat_history_ids = model.generate(
        input_ids,
        attention_mask=attention_mask,
        max_length=1000,
        pad_token_id=tokenizer.eos_token_id,
        do_sample=True,
        temperature=0.6,  # Lowered for more focused responses
        top_p=0.85,       # Adjusted to focus more on high-probability tokens
        top_k=40          # Reduced to limit the sample space
    )
    logging.debug(f"Generated chat history ids: {chat_history_ids}")

    # Decode the generated response
    gen_text = tokenizer.decode(chat_history_ids[:, input_ids.shape[-1]:][0], skip_special_tokens=True)
    logging.debug(f"Generated text: {gen_text.strip()}")

    # Append the model's response to the conversation history
    conversation_history.append(gen_text.strip())
    # Limit the conversation history to 6 items
    conversation_history = deque(list(conversation_history)[-6:], maxlen=10)
    logging.debug(f"Updated conversation history: {list(conversation_history)}")
    
    # Return the generated text
    return jsonify({"generated_text": gen_text.strip()})

@app.route('/health', methods=['GET'])
def health():
    logging.debug("Health check endpoint called.")
    return jsonify({"status": "ok"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
    logging.debug("Flask app started.")
