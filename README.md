Debug a NodeJs app in Docker
============================
This project shows how to configure your dev environment to be able to debug
a NodeJs application deployed in a Docker container.

Pre-Requisites
--------------
Install the following software in your dev machine:
- Visual Studio Code
- Docker

Getting started
---------------
### Download the project
```bash
$ git clone https://github.com/riccardomerlin/docker-debug-nodejs
```
### Run the app in a docker container
```bash
$ cd docker-debug-nodejs
$ docker build --tag docker-debug-nodejs:latest .
$ docker run --publish 3000:3000  docker-debug-nodejs:latest
```
Open a browser to `http://localhost:3000` and the page should display
`Hello Docker World!`.

### Run the app in debug mode in a Docker container
1. Run the following command from the shell to start
a new container instance with debug port (9222) exposed
    ```bash
    $ docker run -p 3000:3000 -p 9222:9222 --entrypoint=/bin/bash docker-debug-nodejs:latest -c "npm run debug"
    ```
    or alternatively

    start the container using `docker-compose`
    ```bash
    $ docker-compose up
    ```

2. Open up [/src/index.js](/src/index.js) in VS Code and set a break point at this line
    ```javascript
    res.end('Hello Docker World!')
    ```

3. Open the `Debug` panel and select `Docker: Attach to Node` configuration
to attach the debugger. VS Code should display the debugger attached in the
status bar at the very bottom of the window.

4. Open the browser and go to `http://localhost:3000`, you will see the
debugger in VS Code stopping in the break point set in the previous step.

### Hot-reload
_Note: it works only when running the container with `docker-compose`_

Edit the following line in [/src/index.js](/src/index.js)
```javascript
res.end('Hello Docker World!')
``` 
to
```javascript
res.end('Hello Docker World [Edited]!')
```
and save the file.

In the terminal you should see node restarting and the debugger should
automatically re-attach.

Go back to the browser and refresh the page, the debugger is still stopping in the same break-point.
Release the debugger and the page now displays
`Hello Docker World [Edited]!`.

Things to notice
----------------

### launch.json
- `"remoteRoot"`, it has to specify the execution folder in the container
in order to make the debugger able to set the break point correctly.
-  `"restart"`, set it to `true` to support `hot changes`. 
This flag allows the debugger re-attaching after node is restarted.

### docker-compose
- `volumes`, maps a folder in the host to a folder in the container
(arguments separated by `:`)
- `ports`, maps container ports with host ports



