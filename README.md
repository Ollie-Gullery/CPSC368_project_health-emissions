# Project Title: Health Problems and Emissions Analysis

Team Members: Oliver Gullery (95292827), Sam Thorne (83910448), Riddhi Battu (85855856), Kourosh Shahbazi (87286076)

## Overview

This project explores the potential effects of a country's emissions on the health of its citizens and residents. By analyzing emissions data alongside health indicators, we aim to assess the environmental and social sustainability of current emissions rates. This interdisciplinary analysis seeks to bridge the gap between environmental sustainability (focused on emissions control) and social sustainability (centered around health and healthcare), aiming to highlight the bearability of current emissions practices on public health.

## Requirements

- Python 3.8+
- OracleDB
- Libraries: pandas, sklearn, statsmodels, numpy, matplotlib

## Installation

Ensure Python and pip are installed. Install the required Python libraries using pip:

```bash
pip install pandas scikit-learn statsmodels numpy matplotlib oracledb
```

## Database Setup

The analysis relies on a series of datasets stored in an Oracle database. The teaching team may opt to populate their own database with the provided SQL DDL file (`SQL_SCHEMA_CREATION_FINAL.sql`) or use an existing Oracle account.

### Using a Team Member's Oracle Account

To facilitate the project evaluation, we suggest using the following Oracle account details for database access:

- Username: `ora_gullery1`
- Password: `a95292827`


## Usage `assignment5.ipynb`

1. Connect to the Oracle database using the provided credentials.
2. Execute the provided SQL script to fetch the required data.
3. Run the Python scripts for data analysis, which includes data preprocessing, statistical analysis, and data visualization.

Example of establishing a connection:

```python
import oracledb

dsn = oracledb.makedsn("localhost", 1522, service_name="stu")
connection = oracledb.connect(user="ora_gullery1", password="a95292827", dsn=dsn)
```

option 2 -- another student account for backup

```python
import oracledb

dsn = oracledb.makedsn("localhost", 1522, service_name="stu")
connection = oracledb.connect(user="ora_rbattu", password="a85855856", dsn=dsn)
```

## Contribution Guidelines

We welcome contributions from all team members and stakeholders. Please follow the standard fork-and-pull request workflow. For major changes, please open an issue first to discuss what you would like to change.
