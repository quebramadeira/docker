FROM ubuntu:18.04
RUN apt-get update -y \
&& apt-get install -y nodejs \
&& rm -rf /var/lib/apt/lists/*
ENV NODE_ENV=production
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY ./src ./
ENTRYPOINT ["npm", "run"]
