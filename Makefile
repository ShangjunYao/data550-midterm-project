# Rule to install R packages using renv
.PHONY: install
install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"

# Rule to compile the R Markdown report
.PHONY: report
report:
	Rscript -e "rmarkdown::render('midterm_report.Rmd')"

# Rule to clean up generated files
.PHONY: clean
clean:
	rm -f midterm_report.html