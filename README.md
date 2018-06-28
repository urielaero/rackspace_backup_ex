# RackspaceBackup

Simple backup service for Rackspace containers
Required Elixir ~> 1.5 

## Installation
1.- load env vars:
```sh
 export RS_API_KEY="xxxxxxxxxxxxxxxxxxxx"
 export RS_USERNAME="username"
 export RS_PASSWORD="password"
```

2.- Clone the repository
3.- mix deps.get
4.- mix escript.build 

## Use

```sh
 ./rackspace_backup container_name
```
