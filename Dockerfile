# syntax=docker/dockerfile:1
   
FROM node:18-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update --no-cache curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev
WORKDIR /app
COPY . .
RUN yarn config set registry https://mirrors.cloud.tencent.com/npm && yarn cache clean
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
