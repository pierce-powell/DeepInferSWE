#!/bin/sh

PYTHON_VERSION="3.12.3"

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate
source venv/bin/activate
python3 unseenPredictionDemo.py
