
# Render final HTML report
report.html: report.Rmd code/03_render_report.R config.yml output/descriptive_table.rds output/figure.rds
	Rscript code/03_render_report.R

# Generate descriptive table
output/descriptive_table.rds: code/01_descriptive_table.R config.yml data/covid_sub.csv
	Rscript code/01_descriptive_table.R

# Generate figure
output/figure.rds: code/02_figure.R config.yml data/covid_sub.csv
	Rscript code/02_figure.R

# Remove generated files
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html