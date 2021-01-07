# Storm MA

A graphical interface to interact with storm. 

# Documentation

- https://docs.google.com/document/d/1PCfdL-rDlCoCoFrcpqL1ML43wg2aBf9ieD6-dzHJ--4/edit?usp=sharing

# To run the tool:

Make sure you have already installed docker on your computer and is currently running. 

Precondition: Remove volume and container if already exists

```
docker container stop storm_ma
docker container rm storm_ma
docker volume rm storm_ma_vol
```

Step 1: Clone the repository

```
git clone https://github.com/DGBTechnologies/StormGUI.git
```

Step 2: Build Docker Image

```
cd StormGUI/storm-ma
docker build -t storm_ma:latest .
```

Step 3: Set Working Directory and License Key

```
export WORK_DIR=$PWD
export LICENSE_KEY=MDADD-EOTFZ-ZDLDS-SPQMR
```


Step 4: Create a docker volume  of working directory

```
docker volume create --driver local --opt type=none --opt device=$WORK_DIR --opt o=bind storm_ma_vol
```


Step 5: Run Docker Container

```
docker run -it -p 5000:5000 -p 8080:8080 --name storm_ma --restart unless-stopped -v storm_vol:/home -e LICENSE_KEY=$LICENSE_KEY storm_ma:latest
```

Step 6: Open Link 

- http://127.0.0.1:8080



Note: If you are facing any alert related to license expiry, make sure you are connected to the internet and restart your docker container.

```
docker container restart storm_ma
```

