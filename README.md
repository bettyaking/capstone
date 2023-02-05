# ED Encounters by Homeless Patients in Healthcare Shortage Areas
This repository contains the R code built to execute the objectives of the final project of MIS 581 Capstone: Business Intelligence and Data Analytics at Colorado State University - Global Campus.
## The Dataset
The dataset used in this project was downloaded from HealthData.gov. It can be accessed from this url: https://healthdata.gov/State/Hospital-Encounters-for-Homeless-Patients/gnju-kkrr.

The original dataset contains 25,449 observations and 17 variables pertaining to emergency department visits and hospitalizations. The scope of this project was limited to ED visits, thus a version of this dataset consisting of only ED visit observations was created prior to loading into R Studio for analyses. This truncated dataset was named homeless.csv in the user's working directory.

## The Code
R libraries readr and ggplot2 must be installed in order to execute this code. The comments explain the intent and purpose for each command as it pertains to the research project.

Lines 1 - 83 provide various methods of exploratory analyses.

Lines 85 - 102 munge variables into factor for future regression testing.

Lines 104 - 253 subset the data per demographic value for further exploration.

Lines 255 - 305 create pie charts for visual analyses of the various demographics.

Lines 307 - 326 provide more visual charts of the data.

Lines 328 - 416 partition the data and build the logistic regression models.

## References
State of California. (2021, July 2). Hospital Encounters for Homeless Patients. HealthData.gov. Retrieved on December 14, 2022 from https://healthdata.gov/State/Hospital-Encounters-for-Homeless-Patients/gnju-kkrr. 