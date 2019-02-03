FROM node:11

LABEL "com.github.actions.name"="Puppeteer"
LABEL "com.github.actions.description"="A GitHub Action for the Headless Chrome Node API"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="#01D59F"

LABEL "repository"="http://github.com/ianwalter/puppeteer"
LABEL "homepage"="http://github.com/ianwalter/puppeteer"
LABEL "maintainer"="Ian Walter <public@iankwalter.com>"

RUN  apt-get update \
     # See https://crbug.com/795759
     && apt-get install -yq libgconf-2-4 \
     # Install latest chrome dev package, which installs the necessary libs to
     # make the bundled version of Chromium that Puppeteer installs work.
     && apt-get install -y wget --no-install-recommends \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y google-chrome-unstable --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

# Install Puppeteer under /node_modules so it's available system-wide
ADD package.json package-lock.json /
RUN npm install
