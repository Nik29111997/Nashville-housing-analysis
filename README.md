# Nashville Housing Data Cleaning and Preprocessing

## Problem Statement

The Nashville Housing dataset contains detailed information about real estate transactions in the Nashville area, including attributes such as property addresses, sale dates, sale prices, and property characteristics. However, the dataset is not ready for analysis due to several data quality issues. The primary challenges include missing values, potential outliers, inconsistent data formats, and duplicate entries.

## Objective

The objective of this project is to perform comprehensive data cleaning and preprocessing to ensure the dataset is accurate, consistent, and ready for further analysis. This involves:

1. **Identifying and Handling Missing Values:** Address missing data to maintain the integrity and completeness of the dataset.
2. **Detecting and Addressing Outliers:** Identify and appropriately handle outliers to avoid skewing the analysis.
3. **Standardizing Data Formats:** Ensure consistency in data formats, especially for date and text fields.
4. **Removing Duplicate Records:** Eliminate redundant data to ensure unique entries.
5. **Feature Engineering:** Enhance the dataset with additional relevant features, such as calculating property age and aggregating bathroom data.

## Project Workflow

### 1. Data Import and Initial Exploration
- The dataset is imported using `pandas`, and initial exploration is conducted to understand its structure, including the number of rows and columns, data types, and summary statistics.
- Missing values are identified, and their percentage in each column is calculated to determine the appropriate handling strategy.

### 2. Handling Missing Values
- **Numerical Columns:** Missing values in key numerical columns (e.g., Acreage, LandValue, BuildingValue, etc.) are imputed using the K-Nearest Neighbors (KNN) imputation technique to account for potential relationships between the data points.
- **Categorical Columns:** Columns like `PropertyAddress` and `City` with missing values are filled using the mode, as these are categorical in nature.

### 3. Dropping Irrelevant or Redundant Columns
- Columns with over 50% missing data and those deemed irrelevant for further analysis (e.g., `OwnerName`, `OwnerAddress`, `UniqueID`, `ParcelID`, `LegalReference`) are removed from the dataset.
- This step ensures the focus remains on the most useful and accurate information.

### 4. Standardizing Data Formats
- The `SaleDate` column is converted to a datetime format for accurate date-related analysis.
- The `YearBuilt` column is converted from a float to an integer for consistency.

### 5. Feature Engineering
- A new `City` column is created by extracting the city name from the `PropertyAddress` field to enable location-based analysis.
- A `PropertyAge` column is added by calculating the age of the property based on the construction year.
- A `TotalBathrooms` column is created by aggregating full and half bathrooms, simplifying the analysis.
- The `SaleMonth` and `SaleYear` are extracted from the `SaleDate` to enable temporal analysis.

### 6. Removing Duplicates
- Duplicate records are identified and removed to ensure the dataset contains only unique entries.

### 7. Outlier Detection and Handling
- Outliers in key numerical columns are identified using boxplots.
- After careful consideration, it was decided not to remove these outliers as they are likely reflective of genuine, albeit extreme, values in real estate transactions.

### 8. Final Data Adjustments
- Numerical columns are rounded to appropriate decimal points or converted to integers where applicable, ensuring data is in a clean and usable format.
- The final cleaned dataset is exported to a new CSV file for future analysis.

## Did We Achieve the Objective?

**1. Identifying and Handling Missing Values:**
   - Missing values were effectively managed using KNN imputation for numerical columns and mode imputation for categorical columns.

**2. Detecting and Addressing Outliers:**
   - Outliers were detected using visual tools like boxplots. However, they were left unchanged as they are considered valuable data points in the context of real estate.

**3. Standardizing Data Formats:**
   - Data formats, particularly for dates and text fields, were standardized to ensure consistency.

**4. Removing Duplicate Records:**
   - All duplicate records were successfully removed to maintain the uniqueness of each entry.

**5. Conducting Feature Engineering:**
   - New features like `PropertyAge`, `TotalBathrooms`, and temporal features were added, enhancing the dataset’s analytical potential.

### Final Dataset Overview

- **Shape before cleaning:** 56,477 rows × 19 columns
- **Shape after cleaning:** 55,502 rows × 16 columns

The cleaned dataset is now ready for detailed analysis, with all major data quality issues addressed and new features added for enhanced insights.

## How to Use

1. **Clone the Repository:**
   - `git clone https://github.com/Nik29111997/Nashville-housing-analysis.git`

2. **Navigate to the Project Directory:**
   - `cd nashville-housing-cleaning`

3. **Run the Data Cleaning Script:**
   - Ensure you have all necessary dependencies installed.
   - Execute the script to clean the dataset.

4. **Explore the Cleaned Dataset:**
   - The cleaned data is saved in a CSV file and ready for further analysis.

## Dependencies

- Python 3.x
- pandas
- matplotlib
- seaborn
- scikit-learn (for KNN imputation)

## Author

Nikhil Bhati
