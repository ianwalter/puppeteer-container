# ianwalter/puppeteer
> A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API

## About

Forked from [buildkite/puppeteer][buildkiteUrl] and based on
[this troubleshooting guide][troubleshootingUrl].

## Usage

Puppeteer will need to be launched with:

```js
browser.launch({ args: ['--no-sandbox'] })
```

You may also have to configure `executablePath` to `'google-chrome-stable'` if
the `PUPPETEER_EXECUTABLE_PATH` environment variable is not correct for some
reason.

This is done by default in [@ianwalter/bff-puppeteer][bffPuppeteerUrl].

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
        # ianwalter/puppeteer@3.0.1
        uses: ianwalter/puppeteer@eac1a2f971c7e4668c3d4ef39873f8fe28859f2c
        with:
          args: yarn
      - name: Test
        uses: ianwalter/puppeteer@eac1a2f971c7e4668c3d4ef39873f8fe28859f2c
        with:
          args: yarn test
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/puppeteer:3.0.1
```

## Related

* [`@ianwalter/bff`][bffUrl] - Your friendly test runner/framework
* [`@ianwalter/bff-puppeteer`][bffPuppeteerUrl] - A bff plugin to enable
  Puppeteer-based testing

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://ianwalter.dev)

[buildkiteUrl]: https://github.com/buildkite/docker-puppeteer
[troubleshootingUrl]: https://github.com/GoogleChrome/puppeteer/blob/main/docs/troubleshooting.md
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/puppeteer
[bffUrl]: https://github.com/ianwalter/bff
[bffPuppeteerUrl]: https://github.com/ianwalter/bff-puppeteer
[licenseUrl]: https://github.com/ianwalter/docker-puppeteer/blob/master/LICENSE
