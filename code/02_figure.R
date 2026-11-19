
library(yaml)
library(ggplot2)

# Read configuration file
config <- yaml::read_yaml("config.yml")

# Retrieve selected sex
selected_sex <- tolower(config$sex)

# Validate selected sex
if (!selected_sex %in% c("female", "male")) {
  stop("Invalid sex in config.yml. Must be 'female' or 'male'.")
}

# Read data
data <- read.csv("data/covid_sub.csv")

# Filter dataset based on selected sex and drop rows missing age or patient type
data <- data[tolower(data$SEX) == selected_sex &
               !is.na(data$AGE) &
               !is.na(data$PATIENT_TYPE), ]

# Label patient type
data$PATIENT_TYPE <- factor(
  data$PATIENT_TYPE,
  levels = c("returned home", "hospitalization"),
  labels = c("Returned home", "Hospitalized")
)

# Boxplot of age by patient type
figure <- ggplot(data, aes(x = PATIENT_TYPE, y = AGE, fill = PATIENT_TYPE)) +
  geom_boxplot(outlier.alpha = 0.2, show.legend = FALSE) +
  labs(
    title = paste0("Age by patient type (", selected_sex, " patients)"),
    x = "Patient type",
    y = "Age (years)"
  ) +
  theme_bw()

# Save figure
saveRDS(figure, file = "output/figure.rds")
