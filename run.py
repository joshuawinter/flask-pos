from pos.http import create_app

app = create_app()

app.run(host='10.180.0.17', port=5000, debug=True)


