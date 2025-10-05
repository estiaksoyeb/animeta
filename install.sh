#!/data/data/com.termux/files/usr/bin/bash

ANIMETA_URL="https://raw.githubusercontent.com/estiaksoyeb/animeta/main/animeta"
TARGET_DIR="/data/data/com.termux/files/usr/bin"
CONFIG_DIR="$HOME/.local/share/animeta"
CONFIG_FILE="$CONFIG_DIR/path.conf"

# Step 0: Check if animeta file exists, if not, download it
if [ ! -f "animeta" ]; then
    echo "ℹ️ animeta not found locally. Downloading from GitHub..."
    curl -L "$ANIMETA_URL" -o animeta || { echo "❌ Failed to download animeta."; exit 1; }
    echo "✅ animeta downloaded successfully."
fi

printf "\033[2J\033[H"

# Step 1: Copy animeta to Termux bin directory
echo "📦 Installing animeta to $TARGET_DIR ..."
cp animeta "$TARGET_DIR/animeta" || { echo "⚠ Failed to copy animeta."; exit 1; }

# Step 2: Make it executable
chmod +x "$TARGET_DIR/animeta"

# Step 3: Ask for Aniyomi storage location path
read -p "📂 Enter your Aniyomi storage path: " ANIYOMI_PATH

# Step 4: Ensure 'localanime' is at the end (no trailing slash)
ANIYOMI_PATH="${ANIYOMI_PATH%/}"  # Remove trailing slash if exists
if [[ "${ANIYOMI_PATH##*/}" != "localanime" ]]; then
    ANIYOMI_PATH="$ANIYOMI_PATH/localanime"
fi

# Step 5: Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Step 6: Save path to path.conf
echo "$ANIYOMI_PATH" > "$CONFIG_FILE"
echo "✅ Aniyomi path saved to $CONFIG_FILE"

# Step 7: Delete downloaded file to clean up
if [ -f "animeta" ]; then
    rm -f "animeta"
    echo "🗑️ Deleted temporary animeta file from current directory"
fi

# Step 8: Success message
echo "✅ animeta installed successfully!"
sleep 1

# Step 9: Colorful usage instructions
echo -e "\n\e[1;33m========== [animeta Usage] ==========\e[0m"

echo -e "\e[1;32m1️⃣ Open Termux and simply type:\e[0m"
echo -e "\e[36m    animeta\e[0m"
sleep 1

echo -e "\e[1;32m2️⃣ Follow the prompts to:\e[0m"
echo -e "\e[36m   - Search anime from AniList\e[0m"
echo -e "\e[36m   - Create JSON and cover files\e[0m"
echo -e "\e[36m   - Optionally create a folder named after the anime\e[0m"

echo -e "\e[1;32m3️⃣ Output:\e[0m"
echo -e "\e[36m   - JSON and cover.jpg will be placed either in a folder named after the anime or in the current directory.\e[0m"
sleep 1

echo -e "\e[1;32m4️⃣ Make sure required packages are installed:\e[0m"
echo -e "\e[36m   curl, jq, fzf\e[0m"
echo -e "\e[36m   (animeta will prompt to install them if missing)\e[0m"

echo -e "\n\e[1;33m=====================================\e[0m"
