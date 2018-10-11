# JQ-API

[![Build Status](https://travis-ci.org/thecampagnards/jq-api.svg?branch=master)](https://travis-ci.org/thecampagnards/jq-api)
[![Go Report Card](https://goreportcard.com/badge/github.com/thecampagnards/jq-api)](https://goreportcard.com/report/github.com/thecampagnards/jq-api)

This web service get a json from an url then parse it with jq (check <https://github.com/stedolan/jq>).
We use it for rundeck which accept specific json format.

## Installation

Docker image available here <https://hub.docker.com/r/thecampagnards/jq-api/>.
Run the service with this command:

```sh
docker run -p 8080:8080 thecampagnards/jq-api
```

## Usage

Api params, can be url encoded:

- `url`: the url of your json
- `jq`: the jq query

The headers, body and request type used to request the api will be used to request the `url`.

Example :

```bash
curl 'http://localhost:8080?jq=.tags&url=https://mydockerregistry.com/v2/alpine/tags/list'
> ["latest","v0.28.3"]
```