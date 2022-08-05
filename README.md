# docker-lagoonlint

Dockerized [lagoonlinter](https://github.com/uselagoon/lagoon-linter) with various versions, easy to use and easy to integrate with CI.

## Table of Contents

- [Usage](#usage)
  - [Command line](#command-line)
    - [Use latest version](#use-latest-version)
    - [Use specific version](#use-specific-version)
  - [Continuous Integration (CI)](#continuous-integration-ci)
    - [Travis CI](#travis-ci)
    - [GitLab CI](#gitlab-ci)
- [Build](#build)

## Usage

### Command line

#### Use latest version

```sh
docker run --rm -v $PATH_TO_LAGOONYAML:/app frxncodominguez/lagoonlinter lagoonlinter

# Please replace "$PATH_TO_LAGOONYAML" with your custom path where is the lagoon.yml file.
```

#### Use specific version

Just like above, but you can specify version of lagoonlinter, for example:

```sh
docker run --rm -v $PATH_TO_LAGOONYAML:/app frxncodominguez/lagoonlinter:0.7.0 lagoonlinter

# Please replace "0.7.0" with the version number you want.
# Don't forget to replace "$PATH_TO_LAGOONYAML".
```

### Continuous Integration (CI)

#### Travis CI

Enable Docker service in your `.travis.yml`:

```yaml
services:
  - docker
```

And use the same command in the `scripts` part as the command line mentions, for example:

```yaml
services:
  - docker

scripts:
  - docker run --rm -v $TRAVIS_BUILD_DIR:/app frxncodominguez/lagoonlinter:0.7.0 lagoonlinter
```

This will lint the Travis CI config file `.travis.yml`

#### GitLab CI

Add this block to your `.gitlab-ci.yml`:

```yaml
yamllint:
  stage: lint
  variables:
    lagoonlinter_version: "0.7.0"
  image: frxncodominguez/lagoonlinter:$lagoonlinter_version
  only:
    changes:
      - "**/.lagoon.yml"
  script:
    - find . -name ".lagoon.yml" | xargs -n 1 lagoonlinter
```

Replace "0.7.0" with the version you want to use, you can also use "latest" for the very new version.

## Build

Build command, you need to specify a valid lagoon-linter version argument to `LAGOONLINTER_VERSION`:

```sh
docker build --build-arg LAGOONLINTER_VERSION="0.7.0" -t docker-lagoonlinter .

# Replace "docker-lagoonlinter" with the preferred image name
```

You can find a valid version in the [release history](https://github.com/uselagoon/lagoon-linter/releases) on Github.