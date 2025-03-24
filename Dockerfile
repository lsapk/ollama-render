# Utiliser une image de base légère
FROM ubuntu:latest

# Mettre à jour les paquets et installer les dépendances
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Télécharger et installer Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Définir la variable d'environnement pour écouter sur toutes les IPs
ENV OLLAMA_HOST=0.0.0.0:11434

# Exposer le port 11434
EXPOSE 11434

# Démarrer Ollama
CMD ["/usr/local/bin/ollama", "serve"]
