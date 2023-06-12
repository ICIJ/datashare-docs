# 5. Integrate ICIJ extract java library as backend library

Date: 2021-11-22

## Status

Accepted

## Context

[extract](https://github.com/ICIJ/extract) has been developed and used for previous leak projects (panama papers, swiss leaks, luxembourg leaks) based on :

* Tika
* tesseract OCR

## Decision

Reuse extract separating : 

* a library that is used by Datashare and
* the existing extract command line interface

## Consequences

There is a jar library published on maven central repositories from which depend : 
- datashare 
- extract-cli