# simple_server

## Demo:
* Make sure docker-compose is installed
* run:
```
./rebar3 tar
sudo docker-compose up -d --build
sudo docker-compose scale web=3

curl -H "Host: page_view.local" <DOCKERS_IP>/page_views
```

## Todo:
* Deploy to a live environment with ansible
* Do integration tests in Jenkins
* add cool functionality (shoutcast? messaging? file upload/download?)
* rewrite Redis access as an api
