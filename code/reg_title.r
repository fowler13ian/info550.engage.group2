here::i_am("code/reg_title.R")

# load in required library
library(tidyr)
library(dplyr)
library(gtsummary)
library(labelled)
library(car)

# load in edited dataset
engage <- readRDS(file = here::here("output/course_engagement_edit.rds"))

# fit a linear regression
reg_title <- lm(unique_viewers ~ total_min + video_number + total_min*video_number, data = engage)
reg_title_tbl <- tbl_regression(reg_title) |>
  add_global_p() |>
  bold_p() |>
  modify_caption("**Linear regression model by video independently**")

saveRDS(reg_title_tbl, file = here::here("output", "reg_title_tbl.rds"))
