********************************************************************************
********************************************************************************
clear all
set more off

// Author: Chris Miyinzi Mwungu
// Date: May 05, 2017
// Created using Stata/SE 14.1

*Setting Working Directory
cd "C:\Users\cmwungu\Desktop\Collapsing Data"

*Importing the CSV file
import delimited "data.csv"

*Assinging Variable labels
la var household_id "Household ID"
la var gender_id "Gender of the Household Head"

*Destring gender variable
replace gender_id ="1" if gender_id == "Male"
replace gender_id ="2" if gender_id == "Female"

destring gender_id, replace

la define gender 1 Male 2 Female
la values gender_id gender

*Collapsing 
by household_id gender_id,sort: gen household_size =_n
collapse (max) household_size, by(household_id gender_id)

*Dropping duplicates
bysort household_id (gender_id) : drop if _N == 2 &  _n == 2 & gender_id == 2

*Saving to Excel
export excel final_dataset.xls, firstrow(variables)
********************************************************************************
*****End of Do File ************************************************************
********************************************************************************
