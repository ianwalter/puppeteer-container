workflow "CD" {
  on = "release"
  resolves = ["Push Version Image"]
}

action "Build Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "build -t ianwalter/puppeteer ."
}

action "Docker Registry Login" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  env = {
    DOCKER_USERNAME = "ianwalter"
  }
  secrets = ["DOCKER_PASSWORD"]
}

action "Push Latest Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Build Image", "Docker Registry Login"]
  args = "push ianwalter/puppeteer:latest"
}

action "Set Version" {
  uses = "docker://node:11-alpine"
  runs = "export"
  args = "VERSION=$(yarn --silent run version)"
}

action "Create Version Tag" {
  uses = "actions/docker/tag@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Build Image", "Set Version"]
  args = "ianwalter/puppeteer ianwalter/puppeteer:$VERSION"
}

action "Push Version Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Push Latest Image", "Create Version Tag"]
  args = "push ianwalter/puppeteer:$VERSION"
}

workflow "CI" {
  on = "push"
  resolves = ["Test"]
}

action "Install" {
  uses = "./"
  runs = "yarn"
}

action "Test" {
  uses = "./"
  needs = ["Install"]
  runs = "yarn"
  args = "test"
}
