# 6. use Fluent HTTP as backend web framework

Date: 2018-01-01

## Status

Accepted

## Context

Java web development is very heavy or old fashioned (play, struts, SpringMVC, Tomcat...) and we wanted Datashare standalone to be run on small machines. 

## Decision

We will use [fluent HTTP](https://github.com/CodeStory/fluent-rest-test) that is working with java-nio (asynchronous), is very lightweight and self-contained (no need for an additional web app server.

## Consequences

We will need to make changes to Fluent HTTP to improve, fix bugs.
