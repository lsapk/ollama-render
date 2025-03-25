# Utiliser une image de base légère
FROM ubuntu:latest

# Mettre à jour les paquets et installer les dépendances
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Télécharger et installer Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Démarrer Ollama en arrière-plan et attendre qu'il soit prêt avant de télécharger Mistral
RUN /usr/local/bin/ollama serve & sleep 20 && /usr/local/bin/ollama pull mistral

# Définir la variable d'environnement pour écouter sur toutes les IPs
ENV OLLAMA_HOST=0.0.0.0:11434

# Exposer le port 11434
EXPOSE 11434

# Démarrer Ollama au lancement du conteneur
CMD ["/usr/local/bin/ollama", "serve"]
