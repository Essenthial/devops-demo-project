from flask import Flask
import logging

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)

@app.route("/")
def hello():
    app.logger.info("Root endpoint called")
    return "Hello DevOps 🚀"

@app.route("/health")
def health():
    return {"status": "OK"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
