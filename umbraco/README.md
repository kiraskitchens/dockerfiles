# Umbraco 

This is a stock install of [Umbraco](https://our.umbraco.org/), the open-source .NET Content Management System, which you can run in a Docker container on Windows.

## Dockerfile Usage 

```
docker build -t kiraskitchens/umbraco .
```

```
docker run -d -P --name umbraco kiraskitchens/umbraco
```