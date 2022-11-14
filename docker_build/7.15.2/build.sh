
#!/bin/bash
docker build . --pull --no-cache --target ilias -t learn-medi-ilias/ilias:$(basename "$PWD")
docker build . --pull --no-cache --target nginx -t learn-medi-ilias/nginx:$(basename "$PWD")
docker build . --pull --no-cache --target cron -t learn-medi-ilias/cron:$(basename "$PWD")
docker build . --pull --no-cache --target cron -t learn-medi-ilias/cron:$(basename "$PWD")
docker build . --pull --no-cache --target ilserver -t learn-medi-ilias/ilserver:$(basename "$PWD")