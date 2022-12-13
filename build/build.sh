
#!/bin/bash
docker build . --pull --target ilias -t learn-medi-docker-ilias/ilias:7.16-2
docker build . --pull --target nginx -t learn-medi-docker-ilias/nginx:7.16-2
docker build . --pull --target cron -t learn-medi-docker-ilias/cron:7.16-2
docker build . --pull --target ilserver -t learn-medi-docker-ilias/ilserver:7.16-2