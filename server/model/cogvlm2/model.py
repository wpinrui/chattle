import torch
from transformers import AutoModelForCausalLM, AutoTokenizer
from typing import List, Optional

from server.model.cogvlm2.cogvlm2_history import Cogvlm2History
from server.model.cogvlm2.cogvlm2_config import CogVLM2Config

MODEL_PATH = "THUDM/cogvlm2-llama3-chat-19B"
DEVICE = 'cuda' if torch.cuda.is_available() else 'cpu'
TORCH_TYPE = torch.bfloat16 if torch.cuda.is_available() and torch.cuda.get_device_capability()[0] >= 8 else torch.float16

tokenizer = AutoTokenizer.from_pretrained(
    MODEL_PATH,
    trust_remote_code=True
)
model = AutoModelForCausalLM.from_pretrained(
    MODEL_PATH,
    torch_dtype=TORCH_TYPE,
    trust_remote_code=True,
).to(DEVICE).eval()

def generate_response(query: str, history: Optional[List[Cogvlm2History]] = None) -> str:
    if history is None:
        history = []
        query = CogVLM2Config.TEMPLATE_STRING.format(query)
    else:
        old_prompt = ''
        for entry in history:
            old_prompt += str(entry) + "\n"
        query = old_prompt + f"{CogVLM2Config.USER_IDENTIFIER}: {query} {CogVLM2Config.ASSISTANT_IDENTIFIER}:"

    input_by_model = tokenizer(query, return_tensors="pt")
    inputs = {
        'input_ids': input_by_model['input_ids'].to(DEVICE),
        'attention_mask': input_by_model['attention_mask'].to(DEVICE),
    }
    gen_kwargs = {
        "max_new_tokens": 2048,
        "pad_token_id": tokenizer.pad_token_id,  # Use the pad token id from the tokenizer
    }
    with torch.no_grad():
        outputs = model.generate(**inputs, **gen_kwargs)
        outputs = outputs[:, inputs['input_ids'].shape[1]:]
        response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return response
