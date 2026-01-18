FROM n8nio/n8n:latest

# Root kullanıcısına geç (sistem paketleri yüklemek için)
USER root

# Playwright için gerekli sistem bağımlılıklarını yükle
# n8nio/n8n Debian/Ubuntu tabanlıdır
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libgtk-3-0 \
    libnspr4 \
    libx11-xcb1 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Playwright'ı global olarak yükle
RUN npm install -g playwright@latest

# Chromium browser'ı yükle
RUN npx playwright install chromium

# Chromium için sistem bağımlılıklarını yükle (eğer gerekirse)
RUN npx playwright install-deps chromium || echo "Deps already installed or not needed"

# n8n kullanıcısına geri dön (güvenlik için)
USER node

