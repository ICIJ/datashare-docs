# 11. Create a Design System for vueJS and bootstrap

Date: 2018-11-01

## Status

Accepted

## Context

With vueJS components it is convenient to extract reusable graphic elements. 
There is a duplication between some ICIJ web sites, datashare and other apps (footers, signup, ...).

We also want to unify the look and feel of the ICIJ projects and apps.

## Decision

We will create a design system that will extract those components and make it as a library.
This design system will be called [murmur](https://github.com/ICIJ/murmur).

## Consequences

When a component fits the design system criteria, it will be defined in murmur.