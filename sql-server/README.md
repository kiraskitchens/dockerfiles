# Sql Server

This is a stock install of SQL Server, which you can run in a Docker container on Windows.

## Dockerfile Usage 

```
docker build -t kiraskitchens/sqlserver .
```

```
docker run -d -P --name sqlserver kiraskitchens/sqlserver
```