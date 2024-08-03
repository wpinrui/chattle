from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

# Initialize global history variable
chat_history_ids = None
tokenizer = None
model = None


def load_tokenizer_and_model(model_name="microsoft/DialoGPT-large"):
    """
    Load tokenizer and model instance for some specific DialoGPT model.
    """
    global tokenizer, model
    # Initialize tokenizer and model
    print("Loading model...")
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(model_name)

    # Move model to GPU if available
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)


def generate_response(message, ignore):
    """
    Generate a response to a user input message.
    """
    global chat_history_ids
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    # Encode user input and End-of-String (EOS) token
    new_input_ids = tokenizer.encode(
        message + tokenizer.eos_token, return_tensors="pt"
    ).to(device)

    # Append tokens to chat history
    if chat_history_ids is not None:
        bot_input_ids = torch.cat([chat_history_ids, new_input_ids], dim=-1).to(device)
    else:
        bot_input_ids = new_input_ids

    # Generate response given maximum chat length history of 1250 tokens
    chat_history_ids = model.generate(
        bot_input_ids, max_length=1250, pad_token_id=tokenizer.eos_token_id
    ).to(device)

    # Decode and return response
    response = tokenizer.decode(
        chat_history_ids[:, bot_input_ids.shape[-1] :][0], skip_special_tokens=True
    )
    return response


# Initialize tokenizer and model once
load_tokenizer_and_model()
