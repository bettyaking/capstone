# ED Encounters by Homeless Patients in Healthcare Shortage Areas
This repository contains the R code built to execute the objectives of the final project of MIS 581 Capstone: Business Intelligence and Data Analytics at Colorado State University - Global Campus.
## The Dataset
The dataset used in this project was downloaded from HealthData.gov. It can be accessed from this url: https://healthdata.gov/State/Hospital-Encounters-for-Homeless-Patients/gnju-kkrr.

The original dataset contains 25,449 observations and 17 variables pertaining to emergency department visits and hospitalizations. The scope of this project was limited to ED visits, thus a version of this dataset consisting of only ED visit observations was created prior to loading into R Studio for analyses. This truncated dataset was named homeless.csv in the user's working directory. The aforementioned csv file is available for download in this repository.

## The Code
R libraries readr, dplyr, and ggplot2 must be installed in order to execute this code. The comments explain the intent and purpose for each command as it pertains to the research project.

Lines 1 - 83 provide various methods of exploratory analyses.

Lines 85 - 102 munge variables into factor for future regression testing.

Lines 104 - 253 subset the data per demographic value for further exploration.

Lines 255 - 305 create pie charts for visual analyses of the various demographics.

Lines 307 - 326 provide more visual charts of the data.

Lines 328 - 418 partition the data and build the logistic regression models.

## Figures
Lines 39-43 Example of a useful visualization

<img width="500" alt="Lines 39-43" src="https://user-images.githubusercontent.com/124456710/217118033-9478b530-56c0-4f18-880c-7e534c284999.png">

Lines 258-260 Pie Chart of Homeless Patient Ages

<img width="360" alt="Lines 258-260 h-age pie" src="https://user-images.githubusercontent.com/124456710/217118128-0922e4ce-49f9-43c2-935c-39302ab01240.png">

Lines 262-265 Pie Chart of Homeless Patient Races

<img width="360" alt="Lines 262-265 h-race pie" src="https://user-images.githubusercontent.com/124456710/217118131-bb0ab98f-0d43-43fd-a30f-5fc5b794e3e9.png">

Lines 267-269 Pie Chart of Homeless Patient Sexes

<img width="360" alt="Lines 267-269 h-sex pie" src="https://user-images.githubusercontent.com/124456710/217118132-58215a8d-e272-4969-b26c-7b0daa255a74.png">

Lines 271-273 Pie Chart of Homeless Patient Insurance

<img width="360" alt="Lines 271-273 h-payer pie" src="https://user-images.githubusercontent.com/124456710/217118134-a3a9a90f-c8e6-48d7-81ab-b37153597c4b.png">

Lines 276-278 Pie Chart of Non-Homeless Patient Ages

<img width="360" alt="Lines 276-278 nh-age pie" src="https://user-images.githubusercontent.com/124456710/217118136-9c84556d-efe0-4f7a-aced-2725f54f0040.png">

Lines 280-283 Pie Chart of Non-Homeless Patient Races

<img width="360" alt="Lines 280-283 nh-race pie" src="https://user-images.githubusercontent.com/124456710/217118137-94a999a5-f554-4727-8728-554a78d57013.png">

Lines 285-287 Pie Chart of Non-Homeless Patient Sexes

<img width="360" alt="Lines 285-287 nh-sex pie" src="https://user-images.githubusercontent.com/124456710/217118138-81ef4a43-5874-4702-913e-a5129c65743b.png">

Lines 289-291 Pie Chart of Non-Homeless Patient Insurance

<img width="360" alt="Lines 289-291 nh-payer pie" src="https://user-images.githubusercontent.com/124456710/217118140-1008c686-8b31-47c6-a83d-89b26f005b28.png">

Lines 294-299 Pie Chart of Non-Homeless Patient Insurance with Legend

<img width="360" alt="Lines 294-299 legend pie example" src="https://user-images.githubusercontent.com/124456710/217118141-322275ab-ecca-4fb7-8e08-616907df8d23.png">

Lines 301-306 "Figure 1" in Final Paper: Homeless Patients in California in 2019 by Sex Pie Chart

<img width="360" alt="Lines 301-306 Figure 1 Pie" src="https://user-images.githubusercontent.com/124456710/217118142-4356f311-2b9a-40d9-b5fd-951542915f24.png">

Lines 308-322 "Figure 2" in Final Paper: Demographic per Homelessness Status Bar Chart

<img width="1200" alt="Lines 308-322 Figure 2 Bar Chart" src="https://user-images.githubusercontent.com/124456710/217118144-96a7c6b9-2943-4fe2-bb47-20e146c88aed.png">

Lines 324-327 Example of a scatterplot

<img width="1200" alt="Lines 324-327 scatterplot" src="https://user-images.githubusercontent.com/124456710/217118145-6063facf-5516-4257-bfc9-0ba3d91d1551.png">


## References
State of California. (2021, July 2). Hospital Encounters for Homeless Patients. HealthData.gov. Retrieved on December 14, 2022 from https://healthdata.gov/State/Hospital-Encounters-for-Homeless-Patients/gnju-kkrr. 