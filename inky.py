from flask import Flask, render_template

helloworld = Flask(__name__)
@helloworld.route("/")
def run():
    return render_template("index.html")

if __name__ == "__main__":
    helloworld.run(host="0.0.0.0", port=int("4000"))

