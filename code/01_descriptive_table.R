library(dplyr)
library(gtsummary)
library(yaml)

# Read configuration file
config <- yaml::read_yaml("config.yml")

# Read dataset
data <- read.csv("data/covid_sub.csv")

# Filter dataset based on selected sex
data <- data %>%
  filter(tolower(SEX) == tolower(config$sex))

# Creating Table 1
table1 <- data %>%
  select(DIABETES, COPD, ASTHMA, INMSUPR,
         HIPERTENSION, OTHER_DISEASE, CARDIOVASCULAR,
         OBESITY, RENAL_CHRONIC) %>%
  tbl_summary(
    label = list(
      DIABETES ~ "Diabetes",
      COPD ~ "COPD",
      ASTHMA ~ "Asthma",
      INMSUPR ~ "Immunosuppression",
      HIPERTENSION ~ "Hypertension",
      OTHER_DISEASE ~ "Other Disease",
      CARDIOVASCULAR ~ "Cardiovascular Disease",
      OBESITY ~ "Obesity",
      RENAL_CHRONIC ~ "Chronic Renal Disease"
    ),
    statistic = list(
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "no"
  ) %>%
  bold_labels() %>%
  modify_header(label = "**Comorbidities**")

saveRDS(table1, file = "output/descriptive_table.rds")