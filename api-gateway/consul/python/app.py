from flask import Flask
import consul
import sys


HOST = sys.argv[1]
PORT = int(sys.argv[2])


app = Flask(__name__)

@app.route('/')
def entry_point():
    return 'Hello World!', 200


service = consul.Consul(host='consul', port=8500)
service.agent.service.register(service_id=f'{HOST}', name='ser', address=HOST, port=PORT,
            tags=[f"{HOST}", "v1"],
            check= {
                'service_id': f'{HOST}',
                'name': 'ser',
                'tcp': f'{HOST}:{PORT}',
                'Interval': '30s', 
                'timeout': '60s'
            })


if __name__ == '__main__':
    app.run(host=HOST, port=PORT, debug=False)
