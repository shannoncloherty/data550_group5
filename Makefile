report.html: Report.Rmd alex/code/01_make_table1.R erika/code/02_make_figure1.R
erika/code/03_make_figure2.R tina/code/04_regression_figure1.R tina/code/05_regression_figure2.R
afia/code/06_make_figure3.R
	Rscript render_report.R

alex_code:
	Rscript alex/code/01_make_table1.R
	
erika_code:
	Rscript erika/code/02_make_figure1.R erika/code/03_make_figure2.R
	
tina_code:
	Rscript tina/code/04_regression_figure1.R tina/code/05_regression_figure2.R
	
afia_code:
	Rscript afia/code/06_make_figure3.R

.PHONY: clean
clean:
	rm -f *.rds && rm -f report.html