# gunicorn_config.py
bind = "0.0.0.0:5000"
workers = 4
threads = 2
timeout = 120
loglevel = "info"
accesslog = "-"
errorlog = "-"
listen_addresses = '*'
