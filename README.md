## frontend
Frontend microservice based on React

### Build ARGS
These arguments are only used during build time and cannot be modified during the container run
The values are defined on the publish.yml file from the GitHub Actions
| Arg | Default | Description |
| --- | --- | --- |
| URL_API | 192.168.49.2:30080 | The API URL |

### Volumes
| Container Path | Description |
| --- | --- |
| `/Soundwaves` | Folder where the generated waveform images are saved |

### Ports
`3000` - Dev Frontend
`80` - Prod Frontend

### Run Local Microservice
Build local `frontend` PROD image from source
```
docker build --build-arg URL_API=192.168.49.2:30080 -f prod.Dockerfile -t frontendprod:local .
```
Build local `frontend` DEV image from source
```
docker build --build-arg URL_API=192.168.49.2:30080 -f dev.Dockerfile -t frontenddev:local .
```

Run local `frontend` PROD image
```
docker run --net=host -v "<Local DIR>:/Soundwaves" frontendprod:local
```
Run local `frontend` DEV image
```
docker run --net=host frontenddev:local
```

Run official `frontend` PROD image locally
```
docker run --net=host -v "<Local DIR>:/Soundwaves" merteam/frontend:prod
```
Run official `frontend` DEV image locally
```
docker run --net=host merteam/frontend:dev
```