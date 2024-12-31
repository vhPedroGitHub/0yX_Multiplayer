#!/bin/bash

virtualenv -p ${4} .terraform/${3}/create_lambda
source .terraform/${3}/create_lambda/bin/activate && \
rm -rf .terraform/${3}/python && \
mkdir .terraform/${3}/python && \
pip install pip-tools
python3 -m piptools compile -o ${1}/requirements.txt ${1}/pyproject.toml || true
pip install -r ${1}/requirements.txt -t .terraform/${3}/python/ && \
cp -r ${1}/* .terraform/${3}/python/ && \
cd .terraform/${3}/python/ && \
zip -qr9 ../${2} .