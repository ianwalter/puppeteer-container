# ianwalter/puppeteer
> A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API

## About

Forked from [buildkite/puppeteer][buildkiteUrl] and based on
[this troubleshooting guide][troubleshootingUrl].

## Usage

As a [GitHub Action][actionsUrl]:

```yml
name: Main
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master
      - name: Install
        uses: ianwalter/puppeteer@v2.0.0
        with:
          args: yarn
      - name: Test
        uses: ianwalter/puppeteer@v2.0.0
        with:
          args: yarn test
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/puppeteer:2.0.0
```

## Related

* [`@ianwalter/bff`][bffUrl] - Your friendly test runner/framework (a test
  runner that can run Puppeteer tests)

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://iankwalter.com)

[buildkiteUrl]: https://github.com/buildkite/docker-puppeteer
[troubleshootingUrl]: https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/puppeteer
[bffUrl]: https://github.com/ianwalter/bff
[licenseUrl]: https://github.com/ianwalter/docker-puppeteer/blob/master/LICENSE
