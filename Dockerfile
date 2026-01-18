FROM n8nio/n8n:latest

# Root kullanıcısına geç (sistem paketleri yüklemek için)
USER root

# Chromium ve Playwright için gerekli sistem bağımlılıklarını yükle
RUN apt-get update && apt-get install -y \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpango-1.0-0 \
    libcairo2 \
    && rm -rf /var/lib/apt/lists/*

# Playwright'ı global olarak yükle
RUN npm install -g playwright

# Chromium browser'ı yükle
RUN npx playwright install chromium

# Chromium için sistem bağımlılıklarını yükle
RUN npx playwright install-deps chromium

# n8n kullanıcısına geri dön (güvenlik için)
USER node

