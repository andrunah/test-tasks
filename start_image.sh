#!/bin/bash

export REPO_DIR=/code
export GITHUB_URL=https://github.com/andrunah/test-tasks

mkdir -p /tmp"$REPO_DIR"

docker-compose up

ls -la /tmp/code
