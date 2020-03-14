#!/bin/bash

path="registry.cn-hangzhou.aliyuncs.com/lesscap/pageviver:latest"

docker build \
  --build-arg OSS_ACCESS_KEY_ID=$OSS_ACCESS_KEY_ID \
  --build-arg OSS_ACCESS_KEY_SECRET=$OSS_ACCESS_KEY_SECRET \
  -t pageviver . && \
docker tag pageviver:latest $path && \
docker push $path && \
ssh lesscap "cd apps; docker-compose up -d"