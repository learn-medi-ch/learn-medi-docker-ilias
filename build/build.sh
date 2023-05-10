#!/bin/bash
docker build . --pull --target ilias -t learn-medi-docker-ilias/ilias:2023-05-10-3
docker build . --pull --target nginx -t learn-medi-docker-ilias/nginx:2023-05-10-3