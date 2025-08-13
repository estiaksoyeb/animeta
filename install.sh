#!/data/data/com.termux/files/usr/bin/bash

# Step 0: Check if animeta file exists
if [ ! -f "animeta" ]; then
    echo "❌ Error: animeta file not found in the current directory."
    exit 1
fi

# Step 1: Copy animeta to Termux bin directory
TARGET_DIR="/data/data/com.termux/files/usr/bin"
echo "📦 Installing animeta to $TARGET_DIR ..."
cp animeta "$TARGET_DIR/animeta" || { echo "⚠ Failed to copy animeta."; exit 1; }

# Step 2: Make it executable
chmod +x "$TARGET_DIR/animeta"

# Step 3: Success message
echo "✅ animeta installed successfully!"
sleep 1

# Step 4: Colorful usage instructions
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
