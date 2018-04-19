# Deep learning in production with Keras, Redis, Flask, and Apache
Ref: <https://www.pyimagesearch.com/2018/02/05/deep-learning-production-keras-redis-flask-apache/>

## Download the code
<https://www.getdrip.com/forms/15005528/submissions>

## Running
```bash
docker-compose up

docker exec -it workspace

# Already running inside container. See docker-compose workspace.command
python run_model_server.py
```

## Testing
```bash
curl -X POST -F image=@jemma.png 'http://localhost/predict'

# Run OK with NUM_REQUESTS = 100 in macOS High Sierra MacBook Pro (13-inch, Early 2011) / Mem 16 GB
python stress_test.py
```

## Without docker-compose (not recommended)
```bash
docker build -f Dockerfile-full -t adsantos/keras-complete-rest-api:0.0.1 .
docker run -it -p 80:80 -p 5000:5000 adsantos/keras-complete-rest-api:0.0.1
```