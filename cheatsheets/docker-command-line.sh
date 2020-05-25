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


[1] - START A CONTAINER
----
  docker run [IMAGE]                            Run a container from [IMAGE]
  --                                            --
  docker run -d [IMAGE]                         Run the container as detached
  docker run -it [IMAGE] [PROMPT]               Run the container interactively with given [PROMPT]
E.G.
  docker run nginx
  docker run nginx:latest
  docker run -d nginx
  docker run -it node bash


[2] - STOP A CONTAINER
----
  docker stop [CID]                             Stop the container by [CID]
E.G.
  docker stop 6ca2fb9d6969


[3] - LIST CONTAINERS
----
  docker ps                                     List all running containers


[4] - LIST IMAGES
----
  docker images                                 List all images 


[5] - REMOVE A CONTAINER
----
  docker rm [CID]                               Remove a container by [CID]
E.G.
  docker rmi 6ca2fb9d6969


[6] - REMOVE AN IMAGE
----
  docker rmi [IID]                              Remove an iamge by [IID]
E.G.
  docker rmi bdca973cfa07


[7] - DOWNLOAD AN IMAGE
----
  docker pull [IMAGE]                           Download [IMAGE]
E.G.
  docker pull nginx:latest


[8] - EXECUTE A COMMAND
----
  docker exec [CID] [COMMAND]                   Execute [COMMAND] at container [CID]


 ------------------------------------------------------------------------------------------------
|                                 DOCKER COMMAND LINE CHEATSHEET                                 |
|                                                                                                |
|                                by Alexandre Delaloy - @blyndusk                                |
 ------------------------------------------------------------------------------------------------