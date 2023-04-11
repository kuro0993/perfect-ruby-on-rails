# Elasticsearch Docker Image

## Image build
```shell
docker build docker/elasticsearch/Dockerfile -t elasticsearch-with-analysis-kuromoji docker/elasticsearch
```
## Start container
```shell
docker run -d --rm -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "xpack.security.enabled=false" elasticsearch-with-analysis-kuromoji:latest
```
