#Tutorial http://prettyprinted.com/creating-a-restful-api-with-flask-part-one-get-requests/

from flask import Flask, jsonify, request #import objects from the Flask model
import json

app = Flask(__name__) #define app using Flask


languages = [{'name' : 'JavaScript'}, {'name' : 'Python'}, {'name' : 'Ruby'}]

@app.route('/', methods=['GET'])
def test():
    return jsonify({'message' : 'It works!'})

@app.route('/lang', methods=['GET'])
def returnAll():
    return jsonify({'languages' : languages})



@app.route('/lang/<string:name>', methods=['GET'])
def returnOne(name):
	for item in range(0,len(languages)):
		if languages[item]['name'] == name:
			respuesta=jsonify({'language' : languages[item]['name']})
			break
		else:
			respuesta=jsonify({'language' : "Does not exist"})
	return respuesta

@app.route('/lang', methods=['POST'])
def addOne():
	language = {'name' : request.json['name']}
	languages.append(language)
	return jsonify({'languages' : languages})

@app.route('/lang/<string:name>', methods=['PUT'])
def editOne(name):
    #langs = [language for language in languages if language['name'] == name]
    for item in range(0,len(languages)):
		if languages[item]['name'] == name:
			languages[item]['name']= request.json['name']
			respuesta=jsonify({'language' : languages[item]['name']})
			break
		else:
			respuesta=jsonify({'language' : "Does not exist"})
    return respuesta

@app.route('/lang/<string:name>', methods=['DELETE'])
def removeOne(name):
	for item in range(0,len(languages)):
		if languages[item]['name'] == name:
			languages.remove(languages[item])
	return jsonify({'languages' : languages})

if __name__ == '__main__':
    app.run(debug=True, port=5000) #run app on port 8080 in debug mode
