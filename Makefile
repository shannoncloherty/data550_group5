report.html: Report.Rmd alex_code_01 erika_code_02 erika_code_03 tina_code_04 tina_code_05 afia_code_06 afia_code_07 afia_code_08 afia_code_09
	Rscript render_report.R

alex_code_01:
	Rscript alex/code/01_table1.R
	
erika_code_02:
	Rscript erika/code/02_boxplots.R 

erika_code_03:
	Rscript erika/code/03_barchart_oedema.R
	
tina_code_04:
	Rscript tina/code/04_regression_figure1.R 

tina_code_05:
	Rscript tina/code/05_regression_figure2.R
	
afia_code_06:
	Rscript afia/code/06_breastfeeding_table.R 
	
afia_code_07:
	Rscript afia/code/07_breastfeeding_graph.R 
	
afia_code_08:
	Rscript afia/code/08_treatment_table.R 
	
afia_code_09:
	Rscript afia/code/09_treatment_graph.R

.PHONY: clean
clean:
	rm -f alex/output/*.rds &&	rm -f erika/output/*.png &&	rm -f tina/output/*.png &&	rm -f afia/output/*.rds &&	rm -f report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"