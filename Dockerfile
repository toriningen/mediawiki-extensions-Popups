FROM node:14
ENV DEBIAN_FRONTEND=noninteractive
RUN { \
  echo 'deb http://archive.debian.org/debian buster main contrib non-free'; \
  echo 'deb http://archive.debian.org/debian-security buster/updates main contrib non-free'; \
} > /etc/apt/sources.list

#RUN echo 'Acquire::Check-Valid-Until "false";' >/etc/apt/apt.conf.d/99no-check-valid-until

RUN apt update

RUN apt install -y build-essential

RUN apt install -y mc

RUN apt install -y zstd

RUN npm install -g npm@8

WORKDIR /src
COPY *.json ./
COPY .nvmrc ./

RUN --mount=type=cache,target=/root/.npm npx browserslist@latest --update-db

RUN --mount=type=cache,target=/root/.npm npm ci

COPY . .

RUN --mount=type=cache,target=/root/.npm npm run build

WORKDIR /dist.tmp
RUN tar --zstd -cvf dist.tar.zst -C /src/ .

CMD ["bash", "-c", "cp -v dist.tar.zst /dist/"]
