FROM dockertaiga/front

RUN apk add --no-cache python3-dev subversion \
    && pip3 install --upgrade pip setuptools \
    && mkdir -p dist/plugins \
    && pip3 install taiga-contrib-gitlab-auth-official \
    && pip3 show taiga-contrib-gitlab-auth-official \
    && svn export "https://github.com/taigaio/taiga-contrib-gitlab-auth/tags/$(pip show taiga-contrib-gitlab-auth-official | awk '/^Version: /{print $2}')/front/dist" "plugins/gitlab-auth"
