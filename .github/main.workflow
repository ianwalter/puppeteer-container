workflow "CD" {
  on = "release"
  resolves = ["Create Version Tag"]
}

action "Docker Registry Login" {
  uses = "actions/docker/login@c08a5fc9e0286844156fefff2c141072048141f6"
  env = {
    DOCKER_USERNAME = "ianwalter"
  }
  secrets = ["DOCKER_PASSWORD"]
}

action "Build Image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Docker Registry Login"]
  runs = "build -t ianwalter/puppeteer ."
}

action "Create Version Tag" {
  uses = "actions/docker/tag@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Build Image"]
  args = "ianwalter/puppeteer ianwalter/puppeteer"
}
