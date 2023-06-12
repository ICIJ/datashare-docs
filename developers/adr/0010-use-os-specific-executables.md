# 10. Use OS specific executables

Date: 2019-01-01

## Status

Accepted

## Context

Users running macOS or windows struggle to make datashare run in docker when they have less than 16 GB memory.
Datashare alone (without docker) could run on a small Raspberry Pi model B with 4 GB memory. 

## Decision

To avoid the overhead of docker desktop apps in windows and mac, we will provide installers for windows, mac and linux.

## Consequences

We will create a new repository which handles the 3 installers and change the build to generate the installers.
