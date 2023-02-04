library(readr)
# Reading the dataset into R Studio and name is "homeless."
homeless <- read_csv("Desktop/MIS581 Capstone/homeless.csv")
# Verifying the structure of the dataset.
str(homeless)
# Returns: spc_tbl_ [10,744 × 17] (S3: spec_tbl_df/tbl_df/tbl/data.frame)

# Checking the dataset for missing values.
sapply(homeless,function(x) sum(is.na(x)))
# There are no missing values.

# Identifying how many unique records there are per variable.
sapply(homeless, function(x) length(unique(x)))
# Returns:
# EncounterType 
# 1 
# HospitalCounty
# 55 
# OSHPD_ID 
# 317
# etc.

# An example of exploring the data from one county.
alamedahosp <- subset(homeless, FacilityName == "Alameda Hospital")
View(alamedahosp)
# Returns: a data frame of the selected data in a new window.
# Repeating the process for only data on the homeless encounters.
alamedahosp.homeless <- subset(homeless, FacilityName == "Alameda Hospital" 
  & HomelessIndicator == "Homeless")

# Perform descriptive statistics on the dataset.
dim(homeless)
# Returns: 10744    17
table(homeless$HomelessIndicator)
# Returns the number of observations for each:
# Homeless Non-Homeless 
# 5355         5389 

# Visualize this distribution with a bar chart.
library(ggplot2)
ggplot(homeless, aes(homeless$HomelessIndicator)) +
  geom_histogram(aes(fill = homeless$HomelessIndicator), 
    stat = "count", binwidth = 2)

# Determining how many homeless encounters occured in Primary Care Shortage Areas
# and Mental Health Shortage Areas (PCSA and MHSA respectively).
PCSA <- filter(homeless, PrimaryCareShortageArea == "Yes"
  & HomelessIndicator == "Homeless")
str(PCSA)
# Returns 1615 observations
# Obtaining the sum of the encounters contained in the 1615 observations.
sum(PCSA$Encounters)
# Returns: 549,287

MHSA <- filter(homeless, MentalHealthShortageArea == "Yes"
  & HomelessIndicator == "Homeless")
str(MHSA)
# Returns 2091 observations
sum(MHSA$Encounters)
# Returns:721,165

SA <- filter(homeless, PrimaryCareShortageArea == "Yes" 
  & MentalHealthShortageArea == "Yes" & HomelessIndicator == "Homeless")
str(SA)
# Returns 1156 observations
sum(SA$Encounters)
# Returns: 300,540

#Repeat the above process for the non-homeless cohort.
nh.PCSA <- filter(homeless, PrimaryCareShortageArea == "Yes"
  & HomelessIndicator == "Non-Homeless")
sum(nh.PCSA$Encounters)
# Returns: 21,806,914

nh.MHSA <- filter(homeless, MentalHealthShortageArea == "Yes"
  & HomelessIndicator == "Non-Homeless")
sum(nh.MHSA$Encounters)
# Returns: 31,019,439

nh.SA <- filter(homeless, PrimaryCareShortageArea == "Yes" 
  & MentalHealthShortageArea == "Yes" & HomelessIndicator == "Non-Homeless")
sum(nh.SA$Encounters)
# Returns: 13,918,262

# Munging variable Homeless Indictor from character to factor to prepare for testing.
homeless$HomelessIndicator <- as.factor(homeless$HomelessIndicator)
# Verify the class of Homeless Indicator.
is.factor(homeless$HomelessIndicator)
# Returns: TRUE

# Identifying the levels and level assignments.
str(homeless$HomelessIndicator)
# Returns: Factor w/ 2 levels "Homeless", "Non-Homeless": 1 1 1 1 1 1 1 1 1 1 ...

# Converting other variables to factors.
homeless$PrimaryCareShortageArea <- 
  as.factor(homeless$PrimaryCareShortageArea)
# Verify
is.factor(homeless$PrimaryCareShortageArea)
# Returns: TRUE
homeless$MentalHealthShortageArea <- 
  as.factor(homeless$MentalHealthShortageArea)

# Creating subsets to use for visualizations.
# Age Subsets.
homeless.children <- subset(homeless, DemographicValue == '0 to 18' 
  & HomelessIndicator == "Homeless")
# Verify this subset was successful
str(homeless.children)
# Returns: tibble [315 × 18]
# Find the sum of all Homeless Children ED encounters.
sum(homeless.children$Encounters)
6280
#Subsetting the rest of the demographics:
homeless.adults <- subset(homeless, DemographicValue == '19 to 39' 
  & HomelessIndicator == "Homeless")
sum(homeless.adults$Encounters)
251589
homeless.midlife <- subset(homeless,DemographicValue == '40 to 59' 
  & HomelessIndicator == "Homeless")
sum(homeless.midlife$Encounters)
290589
homeless.seniors <- subset(homeless, DemographicValue == '60+' 
  & HomelessIndicator == "Homeless")
sum(homeless.seniors$Encounters)
109490

homeless.native <- subset(homeless, DemographicValue == 'American 
  Indian/Alaska Native' & HomelessIndicator == "Homeless")
sum(homeless.native$Encounters)
3684
homeless.pacific <- subset(homeless, DemographicValue == 
  'Asian/Pacific Islander' & HomelessIndicator == "Homeless")
sum(homeless.pacific$Encounters)
11411
homeless.black <- subset(homeless, DemographicValue == 'Black' 
  & HomelessIndicator == "Homeless")
sum(homeless.black$Encounters)
153156
homeless.hispanic <- subset(homeless, DemographicValue == 'Hispanic' 
  & HomelessIndicator == "Homeless")
sum(homeless.hispanic$Encounters)
148944
homeless.other <- subset(homeless, DemographicValue == 'Other Race/Ethnicity' 
  & HomelessIndicator == "Homeless")
sum(homeless.other$Encounters)
47640
homeless.white <- subset(homeless, DemographicValue == 'White' 
  & HomelessIndicator == "Homeless")
sum(homeless.white$Encounters)
293809

homeless.female <- subset(homeless, DemographicValue == 'Female' 
  & HomelessIndicator == "Homeless")
sum(homeless.female$Encounters)
189289
homeless.male <- subset(homeless, DemographicValue == 'Male' 
  & HomelessIndicator == "Homeless")
sum(homeless.male$Encounters)
469166

homeless.medical <- subset(homeless, DemographicValue == 'Medi-Cal' 
  & HomelessIndicator == "Homeless")
sum(homeless.medical$Encounters)
421929
homeless.medicare <- subset(homeless, DemographicValue == 'Medicare' 
  & HomelessIndicator == "Homeless")
sum(homeless.medicare$Encounters)
106465
homeless.otherpayer <- subset(homeless, DemographicValue == 'Other Payer' 
  & HomelessIndicator == "Homeless")
sum(homeless.otherpayer$Encounters)
19700
homeless.private <- subset(homeless, DemographicValue == 'Private Coverage' 
  & HomelessIndicator == "Homeless")
sum(homeless.private$Encounters)
26271
homeless.uninsured <- subset(homeless, DemographicValue == 'Uninsured' 
  & HomelessIndicator == "Homeless")
sum(homeless.uninsured$Encounters)
84279

nonhomeless.children <- subset(homeless, DemographicValue == '0 to 18' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.children$Encounters)
4642761
nonhomeless.adults <- subset(homeless, DemographicValue == '19 to 39' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.adults$Encounters)
7224829
nonhomeless.midlife <- subset(homeless, DemographicValue == '40 to 59' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.midlife$Encounters)
5314602
nonhomeless.seniors <- subset(homeless,DemographicValue == '60+' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.seniors$Encounters)
5029232

nonhomeless.native <- subset(homeless, DemographicValue == 'American 
  Indian/Alaska Native' & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.native$Encounters)
0
nonhomeless.pacific <- subset(homeless, DemographicValue == 
  'Asian/Pacific Islander' & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.pacific$Encounters)
1392154
nonhomeless.black <- subset(homeless, DemographicValue == 'Black' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.black$Encounters)
2322766
nonhomeless.hispanic <- subset(homeless, DemographicValue == 'Hispanic' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.hispanic$Encounters)
9264900
nonhomeless.other <- subset(homeless, DemographicValue == 'Other Race/Ethnicity' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.other$Encounters)
1405758
nonhomeless.white <- subset(homeless, DemographicValue == 'White' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.white$Encounters)
7750715

nonhomeless.female <- subset(homeless, DemographicValue == 'Female' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.female$Encounters)
12077962
nonhomeless.male <- subset(homeless, DemographicValue == 'Male' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.male$Encounters)
10132998

nonhomeless.medical <- subset(homeless, DemographicValue == 'Medi-Cal' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.medical$Encounters)
9365162
nonhomeless.medicare <- subset(homeless, DemographicValue == 'Medicare' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.medicare$Encounters)
4281073
nonhomeless.otherpayer <- subset(homeless, DemographicValue == 'Other Payer' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.otherpayer$Encounters)
747537
nonhomeless.private <- subset(homeless, DemographicValue == 'Private Coverage' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.private$Encounters)
6268051
nonhomeless.uninsured <- subset(homeless, DemographicValue == 'Uninsured' 
  & HomelessIndicator == "Non-Homeless")
sum(nonhomeless.uninsured$Encounters)
1550694

# Data Visualizations
# Pie charts per demographic of the homeless subsets:
ageslices <- c(6280, 251589, 290589, 109490)
lbls <- c("0 to 18", "19 to 39", "40 to 59", "60+")
pie(newslices, labels = lbls, main = "Pie Chart of Homeless Patient Ages")

raceslices <- c(3684, 11411, 153156, 148944, 47640, 293809)
racelbls <- c("American Indian/Alaska Native", "Asian/Pacific Islander", "Black", 
  "Hispanic", "Other Race/Ethnicity", "White")
pie(raceslices, labels = racelbls, main = "Pie Chart of Homeless Patient Races")

sexslices <- c(189289, 469166)
sexlbls <- c("Female", "Male")
pie(sexslices, labels = sexlbls, main = "Pie Chart of Homeless Patient Sexes")

payerslices <- c(421929, 106465, 19700, 26271, 84279)
payerlbls <- c("Medi-Cal", "Medicare", "Other Payer", "Private Coverage", "Uninsured")
pie(payerslices, labels = payerlbls, main = "Pie Chart of Homeless Patient Insurance")

# Pie charts per demographic of the non-homeless subsets:
nh.ageslices <- c(4642761,7224829,5314602,5029232)
nh.agelbls <- c("0 to 18", "19 to 39", "40 to 59", "60+")
pie(nh.ageslices, labels = nh.agelbls, main = "Pie Chart of Non-Homeless Patient Ages")

nh.raceslices <- c(0, 1392154, 2322766, 9264900, 1405758, 7750715)
nh.racelbls <- c("American Indian/Alaska Native", "Asian/Pacific Islander", "Black",
  "Hispanic", "Other Race/Ethnicity", "White")
pie(nh.raceslices, labels = nh.racelbls, main = "Pie Chart of Non-Homeless Patient Races")

nh.sexslices <- c(12077962, 10132998)
nh.sexlbls <- c("Female", "Male")
pie(nh.sexslices, labels = nh.sexlbls, main = "Pie Chart of Non-Homeless Patient Sexes")

nh.payerslices <- c(9365162,4281073,747537,6268051,1550694)
nh.payerlbls <- c("Medi-Cal", "Medicare", "Other Payer", "Private Coverage", "Uninsured")
pie(nh.payerslices, labels = nh.payerlbls, main = 
  "Pie Chart of Non-Homeless Patient Insurance")

# Pie Charts with Legends:
piepercent<- round(100*nh.payerslices/sum(nh.payerslices), 1)
pie(nh.payerslices, labels = piepercent, main = "Pie Chart of Non-Homeless Patient 
  Insurance", col = rainbow(length(nh.payerslices)))
legend("topright", c("Medi-Cal", "Medicare", "Other Payer", "Private Coverage", 
  "Uninsured"), cex = 0.8, fill = rainbow(length(nh.payerslices)))

# Figure 1 in final paper, an example of a pie chart.
sexpct <- round(100*sexslices/sum(sexslices))    
sexlbls <- paste(sexlbls, sexpct) # add percents to labels 
sexlbls <- paste(sexlbls,"%",sep="") # ad % to labels
pie(sexslices,labels = sexlbls, col=rainbow(length(sexlbls)),
  main="Homeless Patients in California in 2019 by Sex")

# Figure 2 in final paper, a bar chart of the demographic distribution.
reorderedDV <- ordered(homeless$DemographicValue, levels = c("0 to 18", "19 to 39", 
  "40 to 59", "60+", "Female", "Male", "American Indian/Alaska Native", "Asian/Pacific
  Islander", "Black", "Hispanic", "Other Race/Ethnicity", "White", "Medi-Cal", 
  "Medicare", "Other Payer", "Private Coverage", "Uninsured"))

DVxaxis <- reorderedDV
Status <- homeless$HomelessIndicator
ENCyaxis <- homeless$Encounters
data <- homeless
ggplot(homeless, aes(fill=Status, y=ENCyaxis, x=DVxaxis)) + 
  geom_bar(position="dodge", stat="identity")+
  labs(title="Demographic per Homelessness Status", x="Demographic", 
       y = "Encounters") +
  theme(axis.text.x = element_text(angle = 45, size = 10, hjust=0.95,vjust=1))

# Scatter plot of all demographic encounters.
ggplot(data = homeless, mapping = aes(y=ENCyaxis, x=DVxaxis)) + 
  geom_point(position="dodge", stat="identity") + 
  theme(axis.text.x = element_text(angle = 45, size = 10, hjust=0.95,vjust=1))

# Partioning the data to building a logistic regression model.
smp_size <- floor(0.75 * nrow(homeless))
train_ind <- sample(seq_len(nrow(homeless)), size = smp_size)
train <- homeless[train_ind, ]
test <- homeless[-train_ind, ]
# Verifying the data was partitioned appropriately
str(train)
# Returns 8058 observations which is 75% of the total amount of observations.
str(test)
# Returns 2,686 observations which is 25% of the total amount of observations.

# Building a logistic regression model using PCSA as the independent variable.
logistic_model_PCSA <- glm(HomelessIndicator ~ PrimaryCareShortageArea,
  family = binomial(), data=train)
summary(logistic_model_PCSA)
# Returns statistics that lead to the following conclusions:
# There is no statistical significance.
# The equation of this regression is: 
# p(Homeless) = exp(-0.006068 + 0.026435*PCSA=Yes)/(1 + exp(-0.006068 + 0.026435*PCSA=Yes))

# Finding the relative odds where 0.026435 is the coefficient of PCSA=Yes
1-exp(0.026435)
# Returns: -0.0267875
# This means that the odds of an individual with PCSA = Yes being in the Homeless 
# group increases by 2.6% than the one in PCSA = No.
# Finding the absolute odds where -0.006068 is the intercept.
1-exp(-0.006068)
# Returns: 0.006049627
# This means that the odds of an individual being in the homeless group decreases 
# by 0.6% holding no variables as explanatory variables.

# Building a logistic regression model using MHSA as the independent variable.
logistic_model_MHSA <- glm(HomelessIndicator ~ MentalHealthShortageArea,
  family = binomial(), data=train)
summary(logistic_model_MHSA)
# Returns statistics that lead to the following conclusions:
# There is no statistical significance.
# The equation of this regression is: 
# p(Homeless) = exp(-0.01066  + 0.03205*MHSA=Yes)/(1 + exp(-0.01066 + 0.03205*MHSA=Yes))

# Finding the relative odds where 0.03205 is the coefficient of MHSA=Yes
1-exp(0.03205)
# Returns: -0.03256913
# This means that the odds of an individual with MHSA = Yes being in the Homeless 
# group increases by 3.2% than the one in MHSA = No.
# Finding the absolute odds where -0.01066 is the intercept.
1-exp(-0.01066)
# Returns: 0.01060338
# This means that the odds of an individual being in the homeless group decreases 
# by 1% holding no variables as explanatory variables.

####----#### I NEED TO KNOW MORE ABOUT LOG REG ####----####
logistic_model <- glm(formula = HomelessIndicator ~ PrimaryCareShortageArea + 
  MentalHealthShortageArea, family = binomial(), data = train)
summary(logistic_model)
# Returns: Nothig significant
# Intercept: -0.01260
1-exp(-0.01260)
# Returns: 0.01252095

# PCSA: 0.01402 
# What does this mean? that the odds of an individual being in the homeless group 
# decreases by 1.4% ...
1-exp(0.01402)
# Returns: -0.01411874

# MHSA: 0.02615 <-
1-exp(0.02615)
#Returns: -0.02649491

####----#### I NEED TO KNOW MORE ABOUT LOG REG ####----####

# Making predictions.
PCSAprobabilities <- logistic_model_PCSA %>% predict(test, type = "response")
head(PCSAprobabilities)
# Returns:
# 1        2        3        4        5        6 
# 0.498483 0.498483 0.498483 0.498483 0.498483 0.498483 

MHSAprobabilities <- logistic_model_MHSA %>% predict(test, type = "response")
head(MHSAprobabilities)
# Returns:
# 1         2         3         4         5         6
# 0.4973361 0.4973361 0.4973361 0.4973361 0.4973361 0.4973361 

probabilities <- logistic_model %>% predict(test, type = "response")
head(probabilities)
# Returns:
# 1         2         3         4         5         6 
# 0.4968507 0.4968507 0.4968507 0.4968507 0.4968507 0.4968507 
