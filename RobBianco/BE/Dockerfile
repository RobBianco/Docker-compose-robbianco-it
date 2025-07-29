# Usa l'immagine SDK per il build invece di aspnet-only
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Installa dipendenze necessarie
RUN apt-get update && apt-get install -y \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia lo script e la chiave SSH
COPY entrypoint.sh /entrypoint.sh
COPY ssh /app/ssh

# Imposta i permessi corretti
RUN chmod +x /entrypoint.sh && \
    chmod 600 /app/ssh/id_ed25519 && \
    chown -R root:root /app/ssh

# Esponi la porta dell'applicazione
EXPOSE 8080

# Configura le variabili d'ambiente per .NET
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

ENTRYPOINT ["/entrypoint.sh"]