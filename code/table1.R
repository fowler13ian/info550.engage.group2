here::i_am("code/table1.R")

# load in required library
library(gtsummary)
library(labelled)

# load in edited dataset
engage <- readRDS(file = here::here("output/course_engagement_edit.rds"))

# factor and label
engage$week <- factor(engage$week, levels = c(1,2,3,4,5,6), 
                      labels = c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6"))
engage$topic <- factor(engage$topic)
engage$reupload <- factor(engage$reupload, levels = c(1,0), labels = c("Yes", "No"))

var_label(engage) <- list(week = "Week", 
                          topic = "Video topics", 
                          views = "Total number of views of video", 
                          unique_viewers= "total number of unique viewers of video", 
                          total_min = "Length of video (minutes)",
                          reupload = "Was the video reuploaded")

# build table1
table1 <- engage |> select(week, topic, views, unique_viewers, total_min, reupload) |> 
  tbl_summary() |>
  modify_caption("**Summary Table**")

saveRDS(table1, file = here::here("output", "table1.rds"))