# ianwalter/puppeteer
> A GitHub Action / Docker image for Puppeteer, the Headless Chrome Node API

## About

Forked from [buildkite/puppeteer][buildkiteUrl] and based on
[this troubleshooting guide][troubleshootingUrl].

## Usage

As a [GitHub Action][actionsUrl]:

```hcl
action "Test" {
  uses = "ianwalter/puppeteer@v1.0.0"
  needs = ["Install"]
  runs = "yarn"
  args = "test"
}
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/puppeteer:1.0.0
```

## Related

* [`@ianwalter/puppeteer-helper`][puppeteerHelperUrl] - An AVA helper that
  makes a Puppeteer page available to a test

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://iankwalter.com)

[buildkiteUrl]: https://github.com/buildkite/docker-puppeteer
[troubleshootingUrl]: https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/puppeteer
[puppeteerHelperUrl]: https://github.com/ianwalter/puppeteer-helper
[licenseUrl]: https://github.com/ianwalter/docker-puppeteer/blob/master/LICENSE
