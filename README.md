# Node-RED on Railway (All Nodes Pre-installed)

A comprehensive Node-RED deployment on Railway with 80+ popular contrib nodes pre-installed.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/new/template/node-red)

## What's Included

This template comes with a massive collection of pre-installed nodes:

### 🎨 Dashboard & UI
- @flowfuse/node-red-dashboard (modern dashboard replacement)
- node-red-contrib-uibuilder
- node-red-node-ui-table
- node-red-node-ui-list

### 🗄️ Databases
- MySQL, PostgreSQL, SQLite
- MongoDB, InfluxDB, MSSQL
- Redis

### 💬 Messaging & Communication
- Telegram, Discord, WhatsApp
- Email, Twilio, Slack

### 🤖 AI & Machine Learning
- OpenAI/ChatGPT integration
- TensorFlow
- Python function execution

### 🏠 IoT & Smart Home
- Home Assistant
- Zigbee2MQTT
- Tasmota, Shelly, Tuya
- Sonos

### 🌐 Web & APIs
- HTTP advanced requests
- OAuth2, JWT authentication
- Google, GitHub, Trello, Airtable, Notion

### 🔍 Web Scraping & Automation
- Playwright
- Puppeteer

### 📊 Data & Analytics
- Charts and visualizations
- Data manipulation tools
- Prometheus monitoring

### ⏰ Time & Scheduling
- Advanced cron
- Date/Time utilities with Moment.js
- Big Timer

### 💳 Payments
- Stripe
- PayPal

### 🛠️ Utilities
- QR code generator
- Image tools
- Crypto utilities
- Boolean logic
- File operations

## Environment Variables

Set these in Railway:

### Required
- `NODE_RED_CREDENTIAL_SECRET` - Secret for encrypting credentials (generate a random string)

### Optional Security
- `NODE_RED_USERNAME` - Username for admin interface
- `NODE_RED_PASSWORD` - Password for admin interface (hashed with bcrypt)

### Example Password Hash Generation
To generate a password hash for Node-RED:
```bash
node -e "console.log(require('bcryptjs').hashSync('your-password', 8));"
```

## Features

- ✅ 80+ pre-installed contrib nodes
- ✅ Persistent storage with Railway volumes
- ✅ Project support enabled
- ✅ Modern dashboard (FlowFuse)
- ✅ Database connectors ready
- ✅ AI/ML integrations
- ✅ Smart home & IoT ready
- ✅ Web scraping tools
- ✅ Payment gateway integrations

## Volume Configuration

Railway will automatically mount a volume to `/data` for persistent storage of:
- Your flows
- Node-RED settings
- Credentials
- Custom nodes you install later

## Quick Start

1. Click "Deploy on Railway"
2. Set `NODE_RED_CREDENTIAL_SECRET` to a random string
3. (Optional) Set username/password for security
4. Wait for deployment to complete (~5-10 minutes due to node installations)
5. Access your Node-RED instance at the Railway-provided URL

## Post-Deployment

### Secure Your Instance
After deployment, it's **highly recommended** to set up authentication:

1. Add these environment variables:
   - `NODE_RED_USERNAME=admin`
   - `NODE_RED_PASSWORD=<bcrypt-hash>`

2. Restart the service

### Installing Additional Nodes
While this template includes 80+ nodes, you can always install more:
- Use the Palette Manager in Node-RED UI
- Or add them to the Dockerfile and redeploy

## Performance Notes

- Initial startup may take 2-3 minutes as Node-RED loads all nodes
- Memory usage: ~300-500MB depending on active flows
- Recommended: Railway Hobby plan or higher

## Popular Use Cases

This template is perfect for:
- Home automation dashboards
- IoT data collection and processing
- API integrations and webhooks
- Social media bots (Telegram, Discord)
- Data pipeline automation
- AI-powered workflows
- E-commerce automation
- Smart home control centers
- Real-time monitoring dashboards

## Troubleshooting

### Long Initial Startup
The first deployment takes longer due to installing 80+ nodes. This is normal.

### Out of Memory
If you hit memory limits:
1. Upgrade Railway plan
2. Or create a custom Dockerfile with only the nodes you need

### Node Not Working
Some nodes require additional configuration:
- API keys
- Service credentials
- Proper environment variables

Check the node's documentation on [flows.nodered.org](https://flows.nodered.org)

## Contributing

Want to add more nodes to this template? Submit a PR!
