# syntax=docker/dockerfile:1
FROM fluxfw/flux-ilias-ilias-base:php7.4 AS ilias
RUN /flux-ilias-ilias-base/bin/install-ilias-core.sh 7.16

# Plugin UserTakeOver
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/srsolutionsag/UserTakeOver/archive/refs/heads/master.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/UserTakeOver
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-object-helper-plugin.sh v2022-11-17-1
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-helper-plugin.sh v2022-11-17-1
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-api.sh v2022-11-17-1

# Plugin UserTakeOver
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/srsolutionsag/UserTakeOver/archive/refs/heads/master.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/UserTakeOver
# Plugin External Content
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/ilifau/ExternalContent/archive/53bcb9075fcf4e92053ffa26b773706bd1ce219a.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/ExternalContent
# Skin
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/learn-medi-ch/skin_medi_ilias_7/archive/refs/heads/main.tar.gz /var/www/html/Customizing/global/skin/skin_medi_ilias_7

FROM fluxfw/flux-ilias-nginx-base:latest AS nginx
COPY --from=ilias /var/www/html /var/www/html
RUN /flux-ilias-nginx-base/bin/install-flux-ilias-rest-api.sh

FROM fluxfw/flux-ilias-cron-base:php7.4 AS cron
COPY --from=ilias /var/www/html /var/www/html

FROM fluxfw/flux-ilias-ilserver-base:java8 AS ilserver
COPY --from=ilias /var/www/html /var/www/html