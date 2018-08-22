from bottle import route, run, template, static_file, request, redirect

import requests

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='./static')

@route('/')
def index():
    r = requests.get('http://127.0.0.1:3000/api/Shipment/')
    shipments = r.json()

    return template('index', shipments=shipments)

@route('/newTemp', method='POST')
def setTemperatura():
    temp = request.forms.get('centigrades')
    shipmentId = request.forms.get('shipmentId')

    url = 'http://127.0.0.1:3000/api/TemperatureReading'
    payload = {'centigrade': temp, 'shipment': shipmentId}
    r = requests.post(url, json=payload)

    redirect("/")

@route('/cargoArrived', method='POST')
def cargoArrived():
    shipmentId = request.forms.get('shipmentId')

    url = 'http://127.0.0.1:3000/api/ShipmentReceived'
    payload = {'shipment': shipmentId}
    r = requests.post(url, json=payload)

    redirect("/")

@route('/cargoDetails/<shipmentId>')
def cargoDetails(shipmentId):
    r = requests.get('http://127.0.0.1:3000/api/Shipment/' + shipmentId)
    shipment = r.json()
    contractId = shipment['contract'].split('#')[-1]
    r = requests.get('http://127.0.0.1:3000/api/Contract/' + contractId)
    contract = r.json()
    penalty = 0.0
    unitPrice = float(contract['unitPrice'])
    unitCount = float(shipment['unitCount'])
    minTemperature = contract['minTemperature']
    maxTemperature = contract['maxTemperature']
    minPenaltyFactor = contract['minPenaltyFactor']
    maxPenaltyFactor = contract['maxPenaltyFactor']
    payOut = unitPrice * unitCount
    full_price = unitPrice * unitCount
    minPenalty = 0
    maxPenalty = 0
    print('Full price:' +str(payOut))
    temperatures = [i['centigrade'] for i in shipment['temperatureReadings']]
    temperatures.sort()
    print(temperatures)
    highest = temperatures[-1]
    lowest = temperatures[0]
    if (lowest < minTemperature):
        penalty += (minTemperature - lowest) * minPenaltyFactor
        print('Min temp penalty: ' + str(penalty))
        minPenalty = penalty

    if (highest > maxTemperature):
        penalty += (highest - maxTemperature) * maxPenaltyFactor
        print('Max temp penalty: ' + str(penalty))
        maxPenalty = penalty
    
    payOut -= (penalty * unitCount)

    if payOut < 0:
        payOut = 0.0
    print payOut

    return template('cargoDetails', shipment=shipment, contract=contract, full_price=full_price, minPenalty=minPenalty, maxPenalty=maxPenalty, payOut=payOut, unitCount=unitCount)

run(host='0.0.0.0', port=8081, debug=True, reloader=True)
