# Nginx

Docker with nginx web server and s6 overlay already setup to run website.

## Configuration

All nginx configuration files are copied into `/config` on first container start.

## Install

- Mount `/config` folder (nginx configuration directory).
- Mount `/app` to **webroot** folder or put in webfiles during build.

## Parameters

For additional parameters see [upstream image](https://github.com/SloCompTech/docker-baseimage).

## Issues

Submit issues [here](https://github.com/SloCompTech/docker-nginx/issues).

## Versioning

This project uses version from [nginx alpine](https://hub.docker.com/_/nginx).
