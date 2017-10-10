from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class CVE_API(Resource):
    def get(self, servicio,version):
        #Aqui buscar info  sobre el servicio y su version en BBDD
        return {servicio:version}

api.add_resource(CVE_API, '/<string:servicio>/<string:version>')

if __name__ == '__main__':
    app.run(debug=True)
