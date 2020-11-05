FROM microsoft/dotnet:2.1-sdk AS builder
#STAGE 1
ENV NODE_VERSION 8.9.1
ENV NODE_DOWNLOAD_SHA 0e49da19cdf4c89b52656e858346775af21f1953c308efbc803b665d6069c15c
RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
