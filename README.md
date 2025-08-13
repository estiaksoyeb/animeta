# animeta

**Aniyomi Local Source JSON Generator** – a Termux tool to quickly generate JSON and cover files for your favorite anime from AniList.

---

## Features

- Search anime directly from AniList.
- Fetch anime details: title, studio, description, genres, status.
- Download anime cover image.
- Optionally create a folder named after the anime and save JSON + cover inside.
- Automatically prompts to install required packages (`curl`, `jq`, `fzf`) if missing.

---

## Installation

**Directly from GitHub (Recommended):**

```bash
command -v curl >/dev/null 2>&1 || pkg install -y curl && bash <(curl -sL https://raw.githubusercontent.com/estiaksoyeb/animeta/main/install.sh)
```

**Manual installation:**

1. Clone the repository:


```bash
git clone https://github.com/estiaksoyeb/animeta.git
cd animeta
```

2. Run the install script:

```bash
bash install.sh
```

---

## Usage

- Open Termux and type:
animeta

- Follow the prompts to:
   - Search anime from AniList.
   - Create JSON and cover files.
   - Optionally create a folder named after the anime.


**Required packages:**

curl, jq, fzf

(animeta will prompt to install them if missing)



---

## License

This repository is licensed under the terms of the **MIT** license.