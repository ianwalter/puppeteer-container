# ianwalter/puppeteer-container
> A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API

## About

Forked from [buildkite/puppeteer][buildkiteUrl] and based on
[this troubleshooting guide][troubleshootingUrl].

## Usage

Puppeteer will need to be launched with:

```js
browser.launch({ args: ['--no-sandbox'] })
```

This is done by default in [@ianwalter/bff-puppeteer][bffUrl].

As a [GitHub Action][actionsUrl]:

```yml
name: CI
on:
  push:
    branches:
      - master
  pull_request:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Install
        # NOTE: this pins the action to a specific commit sha for security
        # reasons but you can also use a version tag if desired. For example:
        # ianwalter/puppeteer-container@v4.0.0
        uses: ianwalter/puppeteer-container@a41ba81d6c2a033597513fcd189801c512244b7e
        with:
          args: yarn
      - name: Test
        uses: ianwalter/puppeteer-container@a41ba81d6c2a033597513fcd189801c512244b7e
        with:
          args: yarn test
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/puppeteer:v4.0.0
```

## Related

* [`@ianwalter/bff`][bffUrl] - Your friendly test runner/framework
* [`ianwalter/playwright-container`][playwrightUrl] - A GitHub Action / Docker
  image for Playwright, the browser automation library

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://ianwalter.dev)

[buildkiteUrl]: https://github.com/buildkite/docker-puppeteer
[troubleshootingUrl]: https://github.com/GoogleChrome/puppeteer/blob/main/docs/troubleshooting.md
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/puppeteer
[bffUrl]: https://github.com/ianwalter/bff
[playwrightUrl]: https://github.com/ianwalter/playwright-container
[licenseUrl]: https://github.com/ianwalter/puppeteer-container/blob/master/LICENSE
