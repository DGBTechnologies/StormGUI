# Storm Dft

A graphical interface to interact with storm dft. 


# To run the tool:

Make sure you have already installed docker on your computer and is currently running. 

Precondition: Remove volume and container if already exists

```
docker container stop storm_dft
docker container rm storm_dft
docker volume rm storm_dft_vol
```

Step 1: Clone the repository

```
git clone https://github.com/DGBTechnologies/StormGUI.git
```

Step 2: Build Docker Image

```
cd StormGUI/storm-dft 
docker build -t storm_dft:latest .
```

Step 3: Set Working Directory and License Key

```
export WORK_DIR=$PWD
export LICENSE_KEY=MDADD-EOTFZ-ZDLDS-SPQMR
```


Step 4: Create a docker volume  of working directory

```
docker volume create --driver local --opt type=none --opt device=$WORK_DIR --opt o=bind storm_dft_vol
```


Step 5: Run Docker Container

```
docker run -it -p 8081:8081 -p 6000:5000 --name storm_dft --restart unless-stopped -v storm_dft_vol:/home -e LICENSE_KEY=$LICENSE_KEY storm_dft:latest
```

Step 6: Open Link 

- http://127.0.0.1:8081



Note: If you are facing any alert related to license expiry, make sure you are connected to the internet and restart your docker container.

```
docker container restart storm_dft
```

