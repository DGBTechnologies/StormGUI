# StormGUI

A graphical interface to interact with storm. 

# Documentation

- https://docs.google.com/document/d/1PCfdL-rDlCoCoFrcpqL1ML43wg2aBf9ieD6-dzHJ--4/edit?usp=sharing


# To run the tool:

Make sure you have already installed docker on your computer and is currently running.

Step 1: Clone the repository

`git clone https://github.com/DGBTechnologies/StormGUI.git`

Step 2: Build Docker Image

`cd StormGUI`
`docker build -t storm_gui:latest .`

Step 3: Set Working Directory

`export working_dir=/path_to_working_dir`

Step 4: Run Docker Container

`docker run -it -p 5000:5000 -p 8080:8080 --restart unless-stopped -v $working_dir:/home storm_gui:latest`

Step 5: Open Link 

- http://127.0.0.1:8080