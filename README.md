## frontend
Frontend microservice based on React

### ARGS
`URL_API` - The API URL

### Port
`8000` - Frontend

### Docker build
```
docker build --build-arg URL_API=192.168.49.2:30080 -f prod.Dockerfile -t frontendprod:local .
```