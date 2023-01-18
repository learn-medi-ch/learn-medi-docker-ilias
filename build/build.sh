#!/bin/bash
docker build . --pull --target ilias -t learn-medi-docker-ilias/ilias:2023-01-18-1
docker build . --pull --target nginx -t learn-medi-docker-ilias/nginx:2023-01-18-1
docker build . --pull --target ilserver -t learn-medi-docker-ilias/ilserver:2023-01-18-1
