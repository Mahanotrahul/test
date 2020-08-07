# Instructions
* Install the required modules with `pip install -r requirements.txt`
* This installs the falcon library and the gunicorn webserver.
* Run the app with `gunicorn app:app`
* You can test if the app is running by `curl http://localhost:8000/things`