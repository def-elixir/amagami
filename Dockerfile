FROM elixir:1.16.1

ENV PHOENIX_VERSION 1.7.11
ENV TZ Asia/Tokyo

WORKDIR /usr/src/app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new ${PHOENIX_VERSION} --force

RUN apt-get update && apt-get install -y \
    sqlite3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# CMD ["mix", "phx.server"]