# #!/bin/sh

# set -e

# REPO_URL=git@github.com:RobBianco/RobBiancoBE.git
# TARGET_DIR=/app/repo

# echo "🚀 Avvio del processo di build..."

# # Configura SSH
# echo "🔐 Configurazione SSH..."
# mkdir -p ~/.ssh
# cp /app/ssh/id_ed25519 ~/.ssh/id_ed25519
# chmod 600 ~/.ssh/id_ed25519
# ssh-keyscan github.com >> ~/.ssh/known_hosts

# # Clone completo della repository
# echo "📥 Clone della repository..."
# if [ -d "$TARGET_DIR" ]; then
#   echo "🧹 Rimozione della directory esistente $TARGET_DIR..."
#   rm -rf "$TARGET_DIR"
# fi
# git clone "$REPO_URL" "$TARGET_DIR"
# cd "$TARGET_DIR"

# # Trova automaticamente il primo file .csproj
# echo "🔍 Ricerca del file di progetto..."
# CSPROJ_PATH=$(find . -name "*.csproj" -type f | head -1)

# if [ -z "$CSPROJ_PATH" ]; then
#     echo "❌ Nessun file .csproj trovato nella repository"
#     exit 1
# fi

# echo "✅ File .csproj trovato: $CSPROJ_PATH"
# PROJECT_DIR=$(dirname "$CSPROJ_PATH")
# cd "$PROJECT_DIR"

# # Pubblica il progetto
# echo "🔨 Build e pubblicazione del progetto..."
# dotnet publish -c Release -o /app/out

# # Trova il file DLL principale
# DLL_FILE=$(find /app/out -name "*.dll" -not -name "*.deps.dll" -not -name "*.runtimeconfig.dll" | head -1)

# if [ -z "$DLL_FILE" ]; then
#     echo "❌ Build fallita - nessun file DLL trovato"
#     exit 1
# fi

# echo "✅ Build completata con successo!"

# # Avvia l'app pubblicata
# echo "🚀 Avvio dell'applicazione..."
# dotnet "$DLL_FILE"