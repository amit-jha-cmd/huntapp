from flask import Flask, request
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps
from flask import jsonify
from flask_cors import CORS
db_connect = create_engine("mysql+pymysql://amit:br7p6700@127.0.0.1:3306/hunt")
app = Flask(__name__)
api = Api(app)
CORS(app)

# print(db_connexct.table_names())


class login(Resource):
    def post(self):
        conn = db_connect.connect()
        data = request.get_json()
       	print(data)
        query = conn.execute("select * from user where srn='{}' and password='{}'".format(data["username"], data["password"])).fetchall()
        print(query)
        if(len(query) == 0):
            return({}, 400)
        else:
            return({"srn": "smne", "level": "1", "name": "amit"}, 200)


api.add_resource(login, '/login')
# api.add_resource(Employees_Name, '/employees/<employee_id>') # Route_3


if __name__ == '__main__':
     app.run(host='0.0.0.0', port='5000', debug=True)
