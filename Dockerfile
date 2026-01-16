# Dockerfile pour DVF Visual
FROM node:16-alpine

# Métadonnées
LABEL maintainer="DVF Visual"
LABEL description="Application DVF Visual avec API externe Etalab"

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm ci --only=production

# Copier le code source
COPY . .

# Créer un utilisateur non-root
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 && \
    chown -R nodejs:nodejs /app

# Utiliser l'utilisateur non-root
USER nodejs

# Exposer le port
EXPOSE 3008

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3008', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Démarrer l'application
CMD ["node", "server.js"]