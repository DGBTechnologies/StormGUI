# StormGUI

A graphical interface to interact with storm. 

# Documentation

- https://docs.google.com/document/d/1PCfdL-rDlCoCoFrcpqL1ML43wg2aBf9ieD6-dzHJ--4/edit?usp=sharing

# To run the tool:

Make sure you have already installed docker on your computer and is currently running. 

Note: These commands are for linux/unix based operating system.

Precondition: Remove volume and container if already exists.

```
docker container stop storm_gui
docker container rm storm_gui
docker volume rm storm_vol
```

Step 1: Clone the repository

```
git clone https://github.com/DGBTechnologies/StormGUI.git
```

Step 2: Build Docker Image

```
cd StormGUI
docker build -t storm_gui:latest .
```

Step 3: Set Working Directory and License Key

```
export WORK_DIR=$PWD
export LICENSE_KEY=JMKHA-XWOTZ-AOHGR-AIJNL
```


Step 4: Create a docker volume  of working directory

```
docker volume create --driver local --opt type=none --opt device=$WORK_DIR --opt o=bind storm_vol
```


Step 5: Run Docker Container

```
docker run -it -p 5000:5000 -p 8080:8080 --name storm_gui --restart unless-stopped -v storm_vol:/home -e LICENSE_KEY=$LICENSE_KEY storm_gui:latest
```

Step 6: Open Link 

- http://127.0.0.1:8080



Note: If you are facing any alert related to license expiry, make sure you are connected to the internet and restart your docker container.

```
docker container restart storm_gui
```

