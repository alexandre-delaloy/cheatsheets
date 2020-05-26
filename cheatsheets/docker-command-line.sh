 ------------------------------------------------------------------------------------------------
|                                 DOCKER COMMAND LINE CHEATSHEET                                 |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------

[0.0] - MY NOTATION
----
  [CID]                                         Container ID                     
  [IID]                                         Image ID
  [IMAGE]                                       An image
  [UPORT]                                       User port 
  [CPORT]                                       Container port
  [EDIR]                                        Exterior directory
  [CDIR]                                        Container directory


[1.1] - START A CONTAINER
----
  docker run [IMAGE]                            Run a container from [IMAGE]
  --                                            --
  docker run -d [IMAGE]                         Run the container as detached
  docker run -p [UPORT]:[CPORT]                 Map [CPORT] port to [UPORT] port
  docker run -v [EDIR]:[CDIR]                   Map [EDIR] volume to [CDIR] volume
  docker run -i [IMAGE]                         Interactive mode
  docker run -it [IMAGE] [PROMPT]               Run the container interactively with given [PROMPT]
E.G.
  docker run nginx
  docker run nginx:latest
  docker run -d -p 8080:8080 nginx
  docker run -v /data/db:/var/lib/mysql
  docker run -it node bash


[1.2] - STOP A CONTAINER
----
  docker stop [CID]                             Stop the container by [CID]
E.G.
  docker stop 6ca2fb9d6969


[1.3] - LIST CONTAINERS
----
  docker ps                                     List all running containers


[1.4] - LIST IMAGES
----
  docker images                                 List all images 


[1.5] - REMOVE A CONTAINER
----
  docker rm [CID]                               Remove a container by [CID]
E.G.
  docker rmi 6ca2fb9d6969


[1.6] - REMOVE AN IMAGE
----
  docker rmi [IID]                              Remove an iamge by [IID]
E.G.
  docker rmi bdca973cfa07


[1.7] - DOWNLOAD AN IMAGE
----
  docker pull [IMAGE]                           Download [IMAGE]
E.G.
  docker pull nginx:latest


[1.8] - EXECUTE A COMMAND
----
  docker exec [CID] [COMMAND]                   Execute [COMMAND] at the container using [CID]

[1.9] - INSPECT A CONTAINER
----
  docker inspect [CID]                          Inspect the container using [CID]           


[1.10] - LOGS INFORMATIONS ABOUT A CONTAINER
----
  docker logs [CID]                             Output the logs of the container using [CID]               



 ------------------------------------------------------------------------------------------------
|                                 DOCKER COMMAND LINE CHEATSHEET                                 |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------