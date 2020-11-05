FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder
#STAGE 1
ENV NODE_VERSION 12.16.2
ENV NODE_DOWNLOAD_SHA ffc92b8d9f53a10a2a734c93e78a3be74af7b0034bddd6f034a700c430eb94c1
RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs
