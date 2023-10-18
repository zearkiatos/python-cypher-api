# Sasaki Python Project

API REST - Python + Flask. basic API that brings two endpoints to cipher and decipher information with RC4 algorithm using in WEP.

# Description

This is an api project in python 🐍 for practice with docker 🐳 for deploy the project with this container 📦 technology ⚙️

# Made with
[![Python](https://img.shields.io/badge/python-2b5b84?style=for-the-badge&logo=python&logoColor=white&labelColor=000000)]()
[![Flask](https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white&labelColor=000000)]()

# Execution
For execute the application follow the next instructions:

## Crear un nuevo ambiente virtual
```sh
    $ python3 -m venv venv
```

```sh
    $ source venv/bin/activate
```

## Install the dependencies
```sh
    $ pip install flask
``` 
```sh
    $ pip install flask-restful
```
```sh
    $ pip install flask-marshmallow
```

## Configuration environment variables
```sh
    $ export FLASK_APP=app.py
```
```sh
    $ export FLASK_DEBUG=1
```
```sh
    $ export FLASK_ENV=development
```

## Execute
```sh
    $ flask run -h 0.0.0.0
```

## Consume the services
* Using Postman 👩🏻‍🚀 (or a similar tool) for make post request to the available endpoints.
* Route Endpoint 1 [POST]: 
```txt
    http://server_ip:5000/cipher
```
* Route Endpoint 2 [POST]: 
    ```txt
        http://server_ip:5000/decipher
    ```
* Both endpoints required a JSON with the next format:
```json
    {"message" : "Text for cipher", "key": "Key word for cipher and decipher"}
```

## Loading test (basic)
### Install apache benchmark
```sh
    $ sudo apt-get install apache2-utils
```  
### Create JSON File
* Create an example JSON file (In the found repository a pair of examples available): 
```json
    {"message" : "Text Cipher or decipher", "key": "Key word for cipher and decipher"}
```
### Execute the command
```sh
    $ ab -n 1000 -c 100 -p ab-files/data-cipher.json -T application/json -rk http://ip_servidor:5000/cipher
```
```$ ab -n 1000 -c 100 -p ab-files/data-decipher.json -T application/json -rk http://ip_servidor:5000/decipher```  

Where:
```sh
    # Make multiples requests inside a HTTP session, browser funcionality by natural.
    -k (keepAlive)
```

```sh
    # Indicate that the connection (socket) is not closing when received the errors
    -r (flag)
```

```sh
    # Total number of solutions for execute
    -n (requests)
```

```sh
    # Concurrence connection quantity
    -c (concurrency)
```
```sh
    # JSON that it send in the request body
    -p (file.json)
```
```sh
    # Specificate the structure of data body
    -T application/json
```

# Cipher RC4 based in the project:
* [https://github.com/g2jun/RC4-Python](https://github.com/g2jun/RC4-Python)