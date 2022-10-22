here::i_am("code/reg_topic.R")

# load in required library
library(tidyr)
library(dplyr)
library(gtsummary)
library(labelled)

# load in edited dataset
engage <- readRDS(file = here::here("output/course_engagement_edit.rds"))

# group by topic and generate needed variables
engage_topic <- engage %>% 
  group_by(topic) %>%
  add_count(topic) %>%
  mutate(total_unique_view = sum(unique_viewers)) %>%
  mutate(min = sum(total_min)) %>%
  slice_tail(n=1) %>%
  arrange(week)

# label
var_label(engage_topic) <- list(min = "Total video length (minutes)", 
                                n = "Number of videos")

# fit a linear regression
reg_topic <- lm(total_unique_view ~ min + n + min*n, data = engage_topic)
reg_topic_tbl <- tbl_regression(reg_topic) |>
  add_global_p() |>
  bold_p() |>
  modify_caption("**Linear regression model grouped by topic**")

saveRDS(reg_topic_tbl, file = here::here("output", "reg_topic_tbl.rds"))
