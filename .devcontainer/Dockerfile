FROM python:3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TZ=America/Sao_Paulo

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata vim bash bash-completion git procps curl iputils-ping wget gnupg apache2-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Instala o Node.js e o npm
# RUN apt-get update && apt-get install -y nodejs npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get install -y nodejs

# Atualiza o npm para a versão mais recente
RUN npm install -g npm

# Baixar e instalar o Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -ms /bin/bash app

USER app

# COPY --chown=app:app ./.devcontainer/pip.conf /home/app/.config/pip/pip.conf

VOLUME /app

WORKDIR /app

# EXPOSE 8000
