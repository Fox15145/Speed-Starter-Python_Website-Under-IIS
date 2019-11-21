# https://medium.com/@bilalbayasut/deploying-python-web-app-flask-in-windows-server-iis-using-fastcgi-6c1873ae0ad8
# http://bottlepy.org/docs/dev/tutorial.html#quickstart-hello-world
# https://wiki.python.org/moin/WindowsCompilers?source=post_page---------------------------

import bottle
from bottle import route, run

@route('/Dev/PythonTest')
def index():                                                                    
     return "Hello Simon!"

BottleApp = bottle.app()

## A Activer en mode console
#BottleApp.run(host='localhost', port=8080, debug=True)