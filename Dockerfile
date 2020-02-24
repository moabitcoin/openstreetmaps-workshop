FROM ubuntu:18.04 as build

WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
    wget unzip g++ cmake make ca-certificates libexpat1-dev zlib1g-dev libbz2-dev libboost-dev libboost-program-options-dev

RUN wget https://github.com/mapbox/protozero/archive/fadd024d49f72240bc43548907d51c2b0f2eaeca.zip     && \
    wget https://github.com/osmcode/libosmium/archive/5c06fbb607253a9989929f864811a129a9d5e49b.zip    && \
    wget https://github.com/osmcode/osmium-tool/archive/7b48223f8fe6305dd2fd15d65c90207ae9a889b4.zip  && \
    for f in *.zip; do unzip $f && rm $f; done                                                        && \
    mv protozero* protozero && mv libosmium* libosmium && mv osmium-tool* osmium-tool                 && \
    mkdir osmium-tool/build && cd osmium-tool/build                                                   && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && make && make install


FROM ubuntu:18.04

WORKDIR /usr/src/app

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" PATH="/opt/venv/bin:$PATH" PIP_NO_CACHE_DIR="false"

COPY --from=build /usr/local/bin/osmium /usr/local/bin/osmium

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
    wget python3 python3-pip python3-venv jq \
    libexpat1 libboost-program-options1.65.1 && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN python3 -m venv /opt/venv && \
    python3 -m pip install pip==19.3.1 pip-tools==4.2.0

RUN python3 -m piptools sync
