#!/bin/bash

cd deploy_notification
python3.10 -m venv my_virtual_env
source ./my_virtual_env/bin/activate

pip install -r requirements.txt
deactivate

cd my_virtual_env/lib/python3.10/site-packages/

zip -r ../../../../lambda_function_bot_telegram.zip .
cd ../../../../

zip lambda_function_bot_telegram.zip main.py