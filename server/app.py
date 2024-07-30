from flask import Flask, request, jsonify
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
import random
import numpy as np

app = Flask(__name__)

# Set a random seed for reproducibility
SEED = random.randint(1, 10000)  # You can set this to any integer you want
random.seed(SEED)
torch.manual_seed(SEED)
np.random.seed(SEED)

# Load DialoGPT model and tokenizer
tokenizer = AutoTokenizer.from_pretrained("microsoft/DialoGPT-large")
model = AutoModelForCausalLM.from_pretrained("microsoft/DialoGPT-large")

# Initialize chat history
chat_history = []  # List to keep track of the last two prompts and responses
MAX_HISTORY_LENGTH = 1000  # Maximum token length for history

@app.route('/generate', methods=['POST'])
def generate_text():
    global chat_history  # To update chat history across requests

    # Get prompt from the request
    data = request.json
    prompt = data.get("prompt", "")
    user_input = f"<human>: {prompt}\n<bot>:"

    # Append new prompt to chat history
    chat_history.append(user_input)

    # Keep only the last two exchanges
    if len(chat_history) > 4:
        chat_history = chat_history[-4:]

    # Concatenate chat history
    history_text = "\n".join(chat_history)
    
    # Encode the concatenated chat history
    input_ids = tokenizer.encode(history_text + tokenizer.eos_token, return_tensors='pt')
    attention_mask = torch.ones(input_ids.shape, dtype=torch.long)

    # Generate a response
    chat_history_ids = model.generate(
        input_ids,
        attention_mask=attention_mask,
        max_length=MAX_HISTORY_LENGTH,
        pad_token_id=tokenizer.eos_token_id,
        do_sample=True,
        temperature=0.7,
        top_p=0.9,
        top_k=50
    )

    # Decode the generated response
    gen_text = tokenizer.decode(chat_history_ids[:, input_ids.shape[-1]:][0], skip_special_tokens=True)

    # Append the generated response to chat history
    chat_history.append(f"<bot>: {gen_text.strip()}")

    # Return the generated text
    return jsonify({"generated_text": gen_text.strip()})

@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "ok"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
