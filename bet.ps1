$path = "/"+$pwd.ToString().substring(0,1).tolower()+$pwd.ToString().substring(2).replace("\", "/")
docker run --rm -v ${path}:/build  federerer/bleeding-edge-toolchain:master $Args