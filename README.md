docker-sickrage
---------------
This container runs SickRage.

Running manually
----------------
    docker build -t edgard/sickrage .
    docker run -d --name sickrage -p 8081:8081 -v /srv/sickrage:/data edgard/sickrage

Running with make tasks
-----------------------
* **build**: build image
* **start**: start container in background
* **test**: start temporary test container *sickrage-test*
* **test-stop**: stop and remove temporary test container
* **run**: start interactive container
* **push**: push image to docker hub

Check *Makefile* for additional information.

SickRage configuration
----------------------
If you want to use your own sickrage config you need to create the file at:
> $DATADIR/config/sickrage.ini
