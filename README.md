# Data Engineering Project: Hotel Sales Analysis


### Problem Statement
This project aims to analyze ordering, invoicing, and sales processes at a Hotel using this [dataset](https://zenodo.org/records/4092667#.Y8OsBtJBwUE). By delving into customers' meal choices, order values, and conversion rates, this project offers valuable insights into consumer behavior trends and engagement within the business that could facilitate strategic data-driven decision-making. 

The project adopts a *batch* approach and implements cloud-based technologies, data ingestion pipelines, workflow orchestration, data lake, data warehouse, data transformations, and dashboarding.

### Project Architecture

![architecture](./images/architecture.png)


### Cloud
The project is developed in the cloud using scalable infrastructure provided by [Google Cloud Platform](https://cloud.google.com/). Infrastructure as Code (IaC) tools such as [Terraform](https://www.terraform.io/) are utilized to provision and manage the cloud resources efficiently.

### Data Ingestion
Data ingestion involves batch processing, where data is collected, processed, and uploaded to the data lake periodically and subsequently to the data warehouse. This ensures that the latest information on customers' meal choices, order values, and sales conversions is readily available for analysis.

### Workflow Orchestration
An end-to-end pipeline is orchestrated using [Mage](https://www.mage.ai/) to automate data workflows. This pipeline efficiently manages multiple steps in a Directed Acyclic Graph (DAG), ensuring seamless execution and reliability of the data processing tasks.

### Data Lake &  Data Warehouse
In this project, [Google Cloud Storage](https://cloud.google.com/storage) is used as the data lake where the data is initially stored after ingestion from the source. [Google BigQuery](https://cloud.google.com/bigquery) is used as the data warehouse and for storing and optimizing structured data for analysis. Tables in BigQuery are partitioned and clustered to ensure efficient query performance, enabling quick retrieval of insights for strategic decision-making.

### Transformations
Data transformations are performed using [dbt](https://www.getdbt.com/). The transformation logic is defined and executed seamlessly within the pipeline, ensuring accurate analysis of consumer behavior trends and patterns.

### Dashboard

![architecture](./images/architecture.png)


Finally a dashboard is then created using [Looker Studio](https://lookerstudio.google.com/) to visualize key insights derived from the processed data. The dashboard comprises of tiles that provide a holistic view of consumer actions, habits, and engagement within the supermarket.

