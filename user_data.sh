#!/bin/bash

# Update system
sudo apt-get update -y

# Install Python and Flask for Flask app
sudo apt-get install -y python3-pip
pip3 install flask

# Install Node.js and npm for Express app
sudo apt-get install -y nodejs npm

# Setup Express Application
mkdir /home/ubuntu/express_app
cd /home/ubuntu/express_app
npm init -y
npm install express --save

# Create Express app (listening on port 3000)
echo 'const express = require("express"); 
const app = express(); 
app.get("/", (req, res) => { res.send("Hello from Express!"); }); 
app.listen(3000, () => { console.log("Express server running on port 3000"); });' > /home/ubuntu/express_app/app.js

# Run Express app in the background
nohup node /home/ubuntu/express_app/app.js &

# Setup Flask Application
echo 'from flask import Flask
app = Flask(__name__)
@app.route("/")
def home():
    return "Hello from Flask!"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)' > /home/ubuntu/flask_app.py

# Run Flask app in the background
nohup python3 /home/ubuntu/flask_app.py &