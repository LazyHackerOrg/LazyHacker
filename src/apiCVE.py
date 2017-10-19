#!flask/bin/python3
# -*- coding: utf-8 -*-

from flask import Flask
from flask_restful import Resource,Api
from flask_pymongo import PyMongo


app = Flask(__name__)
api = Api(app)

#BBDD
app.config["MONGO_DBNAME"] = "vuln_db"
app.config["MONGO_USERNAME"] = "user"
app.config["MONGO_PASSWORD"] = "mypass"
app.config['MONGO_PORT'] = 27017



mongo = PyMongo(app, config_prefix='MONGO')
APP_URL = "http://127.0.0.1:28017"


### Fin config bbdd



#Manejador de insertar datos en la bbdd
class Insert(Resource):
    def post(self):

        return "Inserto_datos_en_bbdd"
    def get(self):
        mongo.db.vuln.insert({"name":"pepe"})
        return "Inserto_datos_en_bb"



#Manejador de busqueda en BBDD
class Search(Resource):

    def get(self, servicio,version):
        #Aqui buscar info  sobre el servicio y su version en BBDD
        data = search(servicio,version)
        return {servicio:version}




#Manejador de actualizar la bbdd
class Update(Resource):
    def post(self):
        return "Actualizo_toda_la_bbdd"
    def get(self):
        return "Actualizo_toda_la_bbdd"







api.add_resource(Search, '/api/<string:servicio>/<string:version>')
api.add_resource(Insert, '/api/insert')
api.add_resource(Update, '/api/update')

if __name__ == '__main__':
    app.run(debug=True)


