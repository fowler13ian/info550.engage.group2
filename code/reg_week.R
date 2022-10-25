here::i_am("code/reg_week.R")

# load in required library
library(tidyr)
library(dplyr)
library(gtsummary)
library(labelled)

# load in edited dataset
engage <- readRDS(file = here::here("output/course_engagement_edit.rds"))

# group by topic and generate needed variables
engage_week <- engage %>% 
  group_by(week) %>%
  add_count(week) %>%
  mutate(total_unique_view = sum(unique_viewers)) %>%
  mutate(min = sum(total_min)) %>%
  slice_tail(n=1) %>%
  arrange(week)

# label
var_label(engage_week) <- list(min = "Total video length (minutes)", 
                                n = "Number of videos")

# fit a linear regression
reg_week <- lm(total_unique_view ~ min + n + min*n, data = engage_week)
reg_week_tbl <- tbl_regression(reg_week) |>
  add_global_p() |>
  bold_p() |>
  modify_caption("**Linear regression model grouped by week**")

saveRDS(reg_week_tbl, file = here::here("output", "reg_week_tbl.rds"))