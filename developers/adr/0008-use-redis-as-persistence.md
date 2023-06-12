# 8. Use Redis as persistence database 

Date: 2018-02-12

## Status

Accepted

## Context

For datashare to scale we are following the [12 factor app](https://12factor.net/) stateless processes model. 
We also need session handling for ICIJ authentication and authorization.

## Decision

We will store sessions in Redis database.

## Consequences

We will need a redis server in the Datashare platform infrastructure, and avoid memory sessions or data handling.