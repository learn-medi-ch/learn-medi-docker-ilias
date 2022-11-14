
#!/bin/bash
docker build . --pull --target ilias -t learn-medi-ilias/ilias:$(basename "$PWD")
docker build . --pull --target nginx -t learn-medi-ilias/nginx:$(basename "$PWD")
docker build . --pull --target cron -t learn-medi-ilias/cron:$(basename "$PWD")
docker build . --pull --target cron -t learn-medi-ilias/cron:$(basename "$PWD")
docker build . --pull --target ilserver -t learn-medi-ilias/ilserver:$(basename "$PWD")