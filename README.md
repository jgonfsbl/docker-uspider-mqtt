# docker-uspider-mqtt
uSpider-MQTT ham radio cluster server client that ports telemetry data to MQTT


## Note: .env file format to Docker variables
When this app runs out of a container it uses .env file to load config. The file format is as follows:

```
export SERVERMQTT = '127.0.0.1'
export CALL = 'ec1zzz-666'
```

In Docker, the way to export variables is to define them on the ```docker run``` execution, on a execution line similar to this:

```
 
```

