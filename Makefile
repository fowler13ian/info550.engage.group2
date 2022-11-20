INFO550_EngagementReport_Group2_${WHICH_CONFIG}.html: engage_report.Rmd code/render_report.R descript.analysis regress.analysis
	Rscript code/render_report.R

output/course_engagement_edit.rds: raw_data/course_engagement.csv code/data_manipulation.R
	rscript code/data_manipulation.R
	
output/table1.rds: output/course_engagement_edit.rds code/table1.R
	rscript code/table1.R
	
output/plot1.png: output/course_engagement_edit.rds code/plot.R
	rscript code/plot.R
	
output/plot2.png: output/course_engagement_edit.rds code/plot.R
	rscript plot.R
	
output/reg_title_tbl.rds: output/course_engagement_edit.rds code/reg_title.R
	rscript code/reg_title.R
	
output/reg_topic_tbl.rds: output/course_engagement_edit.rds code/reg_topic.R
	rscript code/reg_topic.R
	
output/reg_week_tbl.rds: output/course_engagement_edit.rds code/reg_week.R
	rscript code/reg_week.R

.PHONY: install
install: 
	rscript -e 'renv::restore(prompt = FALSE)'
	
.PHONY: descript.analysis
descript.analysis: output/course_engagement_edit.rds output/table1.rds output/plot1.png output/plot2.png

.PHONY: regress.analysis
regress.analysis: output/reg_title_tbl.rds output/reg_topic_tbl.rds output/reg_week_tbl.rds

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html
