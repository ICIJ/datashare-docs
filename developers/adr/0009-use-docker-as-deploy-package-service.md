# 9. Use docker as deploy package service

Date: 2018-01-01

## Status

Accepted

## Context

A previous user survey stated that a bit more than 50% of journalists are using windows, then mac, then linux.
Docker is a multiplatform container runner and can help to have a unified deployment process.

## Decision

We will build a docker container that will embed front and back apps, and will be pulled by users for local mode.
In server mode we will pull the containers with the deploy system.

## Consequences

Users will have install docker desktop app.