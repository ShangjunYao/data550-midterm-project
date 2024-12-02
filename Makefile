# Rule to install R packages using renv

install:
	Rscript -e "renv::restore()"

# Rule to compile the R Markdown report
.PHONY: report
report:
	Rscript -e "rmarkdown::render('midterm_report.Rmd')"

# Rule to clean up generated files
.PHONY: clean
clean:
	rm -f midterm_report.html