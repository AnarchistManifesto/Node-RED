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

# Install verified popular Node-RED contrib nodes (battle-tested list)
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production \
    @flowfuse/node-red-dashboard \
    node-red-contrib-uibuilder \
    node-red-node-ui-table \
    node-red-node-ui-list \
    node-red-contrib-chartjs \
    node-red-node-mysql \
    node-red-node-sqlite \
    node-red-contrib-influxdb \
    node-red-contrib-mssql-plus \
    node-red-contrib-stackhero-influxdb-v2 \
    node-red-contrib-stackhero-mysql \
    node-red-contrib-telegrambot \
    node-red-node-email \
    node-red-node-twilio \
    node-red-contrib-discord-advanced \
    node-red-contrib-moment \
    node-red-contrib-cron-plus \
    node-red-contrib-string \
    node-red-contrib-json \
    node-red-contrib-http-request \
    node-red-contrib-web-worldmap \
    node-red-contrib-fs-ops \
    node-red-node-aws \
    node-red-contrib-home-assistant-websocket \
    node-red-contrib-homebridge-automation \
    node-red-contrib-zigbee2mqtt \
    node-red-contrib-tasmota \
    node-red-contrib-shelly \
    node-red-contrib-tuya-smart \
    node-red-contrib-sonos-plus \
    node-red-contrib-openai \
    node-red-contrib-chatgpt \
    node-red-contrib-loop-processing \
    node-red-contrib-queue-gate \
    node-red-contrib-state-machine \
    node-red-contrib-flow-manager \
    node-red-node-smooth \
    node-red-node-google \
    node-red-contrib-github \
    node-red-contrib-trello \
    node-red-contrib-airtable \
    node-red-contrib-puppeteer \
    node-red-node-ping \
    node-red-node-snmp \
    node-red-contrib-tcp-client \
    node-red-contrib-oauth2 \
    node-red-contrib-jwt \
    node-red-contrib-bcrypt \
    node-red-contrib-logger \
    node-red-contrib-redis \
    node-red-contrib-bigtimer \
    node-red-contrib-boolean-logic \
    node-red-contrib-counter \
    node-red-contrib-filter \
    node-red-contrib-crypto-js \
    node-red-contrib-paypal \
    node-red-contrib-image-tools \
    node-red-contrib-qrcode \
    node-red-contrib-advanced-ping \
    node-red-contrib-buffer-parser \
    node-red-contrib-calc \
    node-red-contrib-file-function \
    node-red-contrib-schedex

# Set environment variables
ENV NODE_RED_ENABLE_SAFE_MODE=false \
    NODE_RED_ENABLE_PROJECTS=true

# Expose Node-RED port
EXPOSE 1880

# Start Node-RED
CMD ["npm", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
