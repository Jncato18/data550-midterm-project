
library(yaml)
library(rmarkdown)

# Read configuration file
config <- yaml::read_yaml("config.yml")

# Retrieve selected sex
selected_sex <- tolower(config$sex)

# Validate selected sex
if (!selected_sex %in% c("female", "male")) {
  stop("Invalid sex in config.yml. Must be 'female' or 'male'.")
}

# Render parameterized report
rmarkdown::render(
  input = "report.Rmd",
  output_file = "report.html",
  params = list(sex = selected_sex)
)
