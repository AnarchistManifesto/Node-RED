FROM nodered/node-red:latest

# Switch to root to install packages
USER root

# Install system dependencies for certain nodes
RUN apk add --no-cache \
    python3 \
    py3-pip \
    make \
    g++ \
    gcc \
    libc-dev \
    linux-headers \
    git

# Switch back to node-red user
USER node-red

# Set working directory
WORKDIR /usr/src/node-red

# Install ALL popular Node-RED contrib nodes
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production \
    # Dashboard & UI
    @flowfuse/node-red-dashboard \
    node-red-contrib-uibuilder \
    node-red-node-ui-table \
    node-red-node-ui-list \
    # Database nodes
    node-red-node-mysql \
    node-red-contrib-postgres \
    node-red-node-sqlite \
    node-red-contrib-mongodb4 \
    node-red-contrib-influxdb \
    node-red-contrib-mssql-plus \
    node-red-contrib-stackhero-influxdb-v2 \
    node-red-contrib-stackhero-mysql \
    # Messaging & Communication
    node-red-contrib-telegrambot \
    node-red-node-email \
    node-red-node-twilio \
    node-red-contrib-discord-advanced \
    node-red-contrib-whatsapp-api \
    node-red-contrib-slack \
    # Date/Time utilities
    node-red-contrib-moment \
    node-red-contrib-cron-plus \
    # Data manipulation
    node-red-contrib-string \
    node-red-contrib-json \
    node-red-contrib-jsonata-extended \
    # HTTP & Web
    node-red-contrib-http-request \
    node-red-contrib-web-worldmap \
    # File operations
    node-red-contrib-fs-ops \
    node-red-node-aws \
    node-red-contrib-azure-iot-hub \
    # IoT & Smart Home
    node-red-contrib-home-assistant-websocket \
    node-red-contrib-homebridge-automation \
    node-red-contrib-zigbee2mqtt \
    node-red-contrib-tasmota \
    node-red-contrib-shelly \
    node-red-contrib-tuya-smart \
    node-red-contrib-sonos-plus \
    # AI & Machine Learning
    node-red-contrib-openai \
    node-red-contrib-chatgpt \
    node-red-contrib-tensorflow \
    node-red-contrib-python-function \
    # Automation & Workflow
    node-red-contrib-loop-processing \
    node-red-contrib-queue-gate \
    node-red-contrib-state-machine \
    node-red-contrib-flow-manager \
    # Data visualization & Charts
    node-red-contrib-charts \
    node-red-node-smooth \
    # API integrations
    node-red-node-google \
    node-red-contrib-github \
    node-red-contrib-trello \
    node-red-contrib-airtable \
    node-red-contrib-notion \
    # Web scraping & browser automation
    node-red-contrib-playwright \
    node-red-contrib-puppeteer \
    # Advanced networking
    node-red-node-ping \
    node-red-node-snmp \
    node-red-contrib-tcp-client \
    node-red-contrib-websocket-client \
    # Security & Authentication
    node-red-contrib-oauth2 \
    node-red-contrib-jwt \
    node-red-contrib-bcrypt \
    # Monitoring & Logging
    node-red-contrib-logger \
    node-red-contrib-prometheus-exporter \
    # Context & Storage
    node-red-contrib-context-nodes \
    node-red-contrib-redis \
    # Utilities
    node-red-contrib-bigtimer \
    node-red-contrib-boolean-logic \
    node-red-contrib-counter \
    node-red-contrib-filter \
    node-red-contrib-deduplicate \
    # Testing & Development
    node-red-contrib-npmjs \
    node-red-contrib-npm \
    # Crypto & Blockchain
    node-red-contrib-crypto \
    # Payment gateways
    node-red-contrib-stripe \
    node-red-contrib-paypal \
    # Additional popular nodes
    node-red-contrib-image-tools \
    node-red-contrib-qrcode \
    node-red-contrib-advanced-ping \
    node-red-contrib-buffer-parser \
    node-red-contrib-calc \
    node-red-contrib-file-function \
    node-red-contrib-fast-bandwidth \
    node-red-contrib-schedex

# Set environment variables
ENV NODE_RED_ENABLE_SAFE_MODE=false \
    NODE_RED_ENABLE_PROJECTS=true

# Expose Node-RED port
EXPOSE 1880

# Start Node-RED
CMD ["npm", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
