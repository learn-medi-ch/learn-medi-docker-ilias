
#!/bin/bash
docker build . --target ilias -t learn-medi-docker-ilias/ilias:7.16-3
docker build . --target nginx -t learn-medi-docker-ilias/nginx:7.16-3
docker build . --target cron -t learn-medi-docker-ilias/cron:7.16-3
docker build . --target ilserver -t learn-medi-docker-ilias/ilserver:7.16-3