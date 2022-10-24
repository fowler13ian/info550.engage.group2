here::i_am("code/plot.R")

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


# Make sure to install new packages
library(funModeling)
library(skimr)
library(janitor)
library(corrr)
library(corrplot)
library(tidyverse)

#plot1: histograms of numeric variables
plot1 <- plot_num(engage)

ggsave(
  here::here("output/plot1.png"),
  plot = plot1,
  device = "png"
)
cor_matrix <- engage %>% 
  select(where(is.numeric)) %>% 
  cor()


# Plot2: Correlation matrix as a heat map
plot2 <- corrplot(cor_matrix)


png(filename = "output/plot2.png")
corrplot(cor_matrix)
dev.off()





