# Utilise une image Linux légère
FROM debian:bookworm-slim

# Installe Ollama
RUN apt update && apt install -y curl && \
    curl -fsSL https://ollama.com/install.sh | sh

# Expose le port 11434 (par défaut pour Ollama)
EXPOSE 11434

CMD ["/usr/local/bin/ollama", "serve", "--host", "0.0.0.0"]
