#!/bin/bash
docker build . --pull --target ilias -t learn-medi-docker-ilias/ilias:v2023-02-13-1
docker build . --pull --target nginx -t learn-medi-docker-ilias/nginx:v2023-02-13-1
