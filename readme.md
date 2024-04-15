# INFT4001 Final Project
We use UK road safety data from 2018 to 2022, including collisions, vehicles, and casualties. Here is the download link: [Road Safety Data - data.gov.uk](https://www.data.gov.uk/dataset/cb7ae6f0-4be6-4935-9277-47e5ce24a11f/road-safety-data)There are three files for each year,we store the data files in three folders:Casualties,Collisions and Vehicles,each folder has five data files from 2018 to 2022.

## data loading --Lixin li
* explore the data and choose the columns of facts table and the dimention tables that we use to do the query work, draw the entity relationship diagram
* create the database and all the tables
* load the data into database, clean the data if it is necessary
> 00_EDA.ipynb  
> 01_ERD.vpp  
> 02_data_model_script.sql  
> 03_data_loading.ipynb

**How to build the data before query?**
* download this project
* create a database named UKAccidents
* run all the code in 03_data_loading.ipynb, don't forget to replace the user and password before execution**

## Query and Tuning --Haichuan Zhao
* SQL query work
* performance tuning

