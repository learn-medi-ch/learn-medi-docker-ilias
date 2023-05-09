# syntax=docker/dockerfile:1
FROM fluxfw/flux-ilias-ilias-base:php7.4 AS ilias
RUN /flux-ilias-ilias-base/bin/install-ilias-core.sh 7.21

#temporary fr language patch
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/mstuder/ILIAS/archive/edab07aa22a9cb32f62165230b98e52dd52973a5.tar.gz /var/www/html

# flux-ilias-rest
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-api.sh v2023-05-09-2
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-helper-plugin.sh v2023-04-03-1
RUN /flux-ilias-ilias-base/bin/install-flux-ilias-rest-object-helper-plugin.sh v2023-05-01-1

# Plugin UserTakeOver
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/srsolutionsag/UserTakeOver/archive/aefb7b18790e60e748bb4726ab116fe64b2a48cc.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/UserTakeOver
# Plugin External Content
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/ilifau/ExternalContent/archive/53bcb9075fcf4e92053ffa26b773706bd1ce219a.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/ExternalContent
# Plugin LiveVoting
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxapps/LiveVoting/archive/refs/tags/v2023.01.26.tar.gz /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/LiveVoting /var/www/html/Customizing/global/plugins/Services/Repository/RepositoryObject/LiveVoting
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

# User Enrolment / because of Excel-Import-To-Course
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/fluxfw/SrUserEnrolment/archive/refs/tags/v3.23.0.tar.gz /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/SrUserEnrolment
WORKDIR /var/www/html/Customizing/global/plugins/Services/UIComponent/UserInterfaceHook/SrUserEnrolment
RUN ./vendor/srag/dic/bin/ilias7_core_apply_ilctrl_patch.sh
WORKDIR /var/www/html

# Skin
RUN /flux-ilias-ilias-base/bin/install-archive.sh https://github.com/learn-medi-ch/skin_medi_ilias_7/archive/refs/tags/v2023-05-09-2.tar.gz /var/www/html/Customizing/global/skin/skin_medi_ilias_7

# PDF Generation
RUN /flux-ilias-ilias-base/bin/install-wkhtmltopdf.sh
COPY --from=surnet/alpine-wkhtmltopdf:3.16.2-0.12.6-small /bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

FROM fluxfw/flux-ilias-nginx-base:latest AS nginx
COPY --from=ilias /var/www/html /var/www/html
COPY nginx/show-ilias-login-as-default-page.conf /flux-ilias-nginx-base/src/custom/
COPY nginx/livevoting.conf /flux-ilias-nginx-base/src/custom/
COPY nginx/medi-eco-frontend.conf /flux-ilias-nginx-base/src/custom/
COPY nginx/medi-eco-book-stack-query-actions.conf /flux-ilias-nginx-base/src/custom/
COPY nginx/flux-eco-learnplaces-frontend.conf /flux-ilias-nginx-base/src/custom/


RUN /flux-ilias-nginx-base/bin/install-flux-ilias-rest-api.sh
