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
Build local `frontend` from source
```
docker build --build-arg URL_API=192.168.49.2:30080 -f prod.Dockerfile -t frontendprod:local .
```
OR
```
docker build --build-arg URL_API=192.168.49.2:30080 -f dev.Dockerfile -t frontenddev:local .
```

Run local `frontend`
```
docker run --net=host -v "Soundwaves:/Soundwaves" frontendprod:local
```
OR 
```
docker run --net=host -v "Soundwaves:/Soundwaves" frontenddev:local
```

Run official `frontend` image locally
```
docker run --net=host -v "Soundwaves:/Soundwaves" merteam/frontend:prod
```
OR
```
docker run --net=host -v "Soundwaves:/Soundwaves" merteam/frontend:dev
```