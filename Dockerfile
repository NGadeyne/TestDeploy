# Utilise une image Python légère
FROM python:3.11-slim

# Crée le dossier de travail
WORKDIR /app

# Copie les dépendances
COPY requirements.txt .

# Installe les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copie le code de l'app
COPY . .

# Expose le port attendu par App Platform
EXPOSE 8080

# Lance l'app avec Gunicorn en production
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
