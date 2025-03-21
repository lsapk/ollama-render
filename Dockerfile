# Utilisation d'une image de base
FROM python:3.10

# Définition du répertoire de travail
WORKDIR /app

# Copie des fichiers
COPY . .

# Installation des dépendances
RUN pip install -r requirements.txt

# Exécution de la commande de démarrage
CMD ["bash", "start.sh"]
