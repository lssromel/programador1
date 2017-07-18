import requests
from login_logout import *
import hashlib

session = requests.sessions.Session()
url_in='http://127.0.0.1:8000/login_user/'

payload = {'username': 'programador1', 'password': 'analista1'}

url_out='http://127.0.0.1:8000/logout_user'

session = login_fun(session,url_in,payload)

ruta = '/home/romel/programador1/run_container.sh'
f= open(ruta, 'rb')

token=session.cookies['csrftoken']

r =session.post('http://127.0.0.1:8000/inicio_tarea',files = {'file':f}, data={'csrfmiddlewaretoken': token,"name":"viajes"})
print r, r.text


session = logout_fun(session,url_out)
del session
