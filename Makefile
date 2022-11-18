INFO550_EngagementReport_Group2.html: engage_report.Rmd code/render_report.R descript.analysis regress.analysis

output/course_engagement_edit.rds: course_engagement.csv data_manipulation.R
	rscript data_manipulation.R
	
output/table1.rds: output/course_engagement_edit.rds table1.R
	rscript table1.R
	
output/plot1.png: output/course_engagement_edit.rds plot.R
	rscript plot.R
	
output/plot2.png: output/course_engagement_edit.rds plot.R
	rscript plot.R
	
output/reg_title_tbl.rds: output/course_engagement_edit.rds reg_title.r
	rscript reg_title.r
	
output/reg_topic_tbl.rds: output/course_engagement_edit.rds reg_topic.R
	rscript reg_topic.R
	
output/reg_week_tbl.rds: output/course_engagement_edit.rds reg_week.R
	rscript reg_week.R

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
