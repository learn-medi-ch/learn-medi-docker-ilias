
#!/bin/bash
docker build . --pull --no-cache --target ilias -t learn-medi-ilias/ilias:7.15-1
docker build . --pull --no-cache --target nginx -t learn-medi-ilias/nginx:7.15-1
docker build . --pull --no-cache --target cron -t learn-medi-ilias/cron:7.15-1
docker build . --pull --no-cache --target ilserver -t learn-medi-ilias/ilserver:7.15-1