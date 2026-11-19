library(dplyr)
library(gtsummary)
library(yaml)
library(here)

# Read configuration file
config <- yaml::read_yaml(here::here("config.yml"))

# Read dataset
data <- read.csv(here::here("data/covid_sub.csv"))

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

table1

saveRDS(
  table1,
  file = here::here("Output", "01_descriptive_table.rds")
)