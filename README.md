# docker-polynote
https://polynote.org/

## Docker run
```bash
POLYNOTE_CONFIG='
listen:
  host: 0.0.0.0
  port: 8192
'
docker run -p 8192:8192 -e "POLYNOTE_CONFIG=$POLYNOTE_CONFIG" -v /myfolder/notebooks:/opt/polynote/notebooks lolhens/polynote
```

## Compose file
```yml
version: '3.7'

services:
  polynote:
    image: lolhens/polynote
    environment:
      POLYNOTE_CONFIG: |
        listen:
          host: 0.0.0.0
          port: 8192
    ports:
      - "8192:8192"
    volumes:
      - notebooks:/opt/polynote/notebooks
```
