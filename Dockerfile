# Microsoft'un resmi Playwright image'ını base olarak kullan
# Bu image zaten Playwright, Chromium ve tüm bağımlılıkları içerir
FROM mcr.microsoft.com/playwright:v1.40.0-noble

# Root kullanıcısına geç
USER root

# n8n'i yükle
RUN npm install -g n8n@latest

# n8n için gerekli environment variables
ENV N8N_BASIC_AUTH_ACTIVE=false
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

# Çalışma dizini
WORKDIR /home/pwuser

# Playwright kullanıcısına geri dön (Microsoft image'ı pwuser kullanıyor)
USER pwuser

# Port
EXPOSE 5678

# n8n'i başlat
CMD ["n8n", "start"]

