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
# Plugin LiveVoting
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxapps/LiveVoting/archive/refs/tags/v6.0.2.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/LiveVoting
# Plugin SrContainerObjectTree
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxfw/SrContainerObjectTree/archive/refs/tags/v2.15.0.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/SrContainerObjectTree
# Plugin ViMP
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxapps/ViMP/archive/refs/tags/v1.8.2.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/ViMP
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxapps/VimpPageComponent/archive/refs/tags/v1.7.0.tar.gz /var/www/html/Customizing/global/plugins/Services/COPage/PageComponent/VimpPageComponent
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxapps/ViMPCron/archive/refs/tags/v2.0.0.tar.gz /var/www/html/Customizing/global/plugins/Services/Cron/CronHook/ViMPCron

# Plugin SrContainerObjectMenu
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxfw/SrContainerObjectMenu/archive/refs/tags/v2.6.1.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/SrContainerObjectMenu
# Plugin SrFileObjectTypeIcons
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxfw/SrFileObjectTypeIcons/archive/refs/tags/v1.3.0.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/SrFileObjectTypeIcons

# Skin
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/learn-medi-ch/skin_medi_ilias_7/archive/refs/tags/v2022-12-29-1.tar.gz /var/www/html/Customizing/global/skin/skin_medi_ilias_7

FROM fluxfw/flux-ilias-nginx-base:latest AS nginx
COPY --from=ilias /var/www/html /var/www/html
RUN /flux-ilias-nginx-base/bin/install-flux-ilias-rest-api.sh

FROM fluxfw/flux-ilias-ilserver-base:java8 AS ilserver
COPY --from=ilias /var/www/html /var/www/html
