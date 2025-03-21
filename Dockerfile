FROM ubuntu:latest
RUN apt update && apt install -y curl
RUN curl -fsSL https://ollama.com/install.sh | sh
CMD ["ollama", "run", "llama2"]
