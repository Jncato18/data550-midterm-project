# COVID-19 Cases in Mexico: Descriptive Analysis

## Project Overview

This project generates an automated HTML report summarizing characteristics of COVID-19 patients in Mexico. The report includes a descriptive table of ??? and a figure of ???.

The report can be customized to analyze either male or female patients and is generated using GNU Make.

## Repository Structure

| File/Directory | Description |
|---|---|
| `data/` | Contains the raw COVID-19 dataset |
| `code/01_descriptive_table.R` | Generates the descriptive table |
| `code/02_figure.R` | Generates the figure |
| `code/03_render_report.R` | Renders the final HTML report |
| `output/` | Stores generated tables and figures as RDS files |
| `config.yml` | Contains the customization parameter |
| `Makefile` | Defines the workflow for generating the report |
| `report.Rmd` | R Markdown source file for the report |
| `renv.lock` | Records R package dependencies |

## Building the Report

**Requirements:** R, GNU Make, and the R packages required for the analyses and report generation.

1. Clone the GitHub repository and open the project directory.
2. Restore the project's R package environment by running `renv::restore()` in R.
3. Open a terminal in the main project directory and run: `make`

The Makefile automatically executes the descriptive table and figure scripts, then renders the final HTML report.

The completed report will be saved as `report.html` in the main project directory.

To remove generated outputs and rebuild the report from scratch, run `make clean` followed by `make`.

## Customizing the Report

The report can be customized by modifying the `sex` parameter in `config.yml` to either "female" or "male".

After changing the configuration, run `make` again to regenerate the report.

Both analysis scripts use the selected sex to filter the dataset, and the rendering script passes the same parameter to `report.Rmd`.
