launch.json
-----------
- `"remoteRoot"`: "/<folder_name_in_the_container>",
it has to specify the execution folder in the container to make the debugger
able to set the break point correctly.
-  `"restart"`, set it to `true` to support `hot changes`. This flag allos the
debugger to reattach after node is restarted.

docker-compose
--------------
- `volumes`, maps a folder in the host to a folder in the container
(arguments separated by `:`)
- `ports`, maps container ports with host ports



