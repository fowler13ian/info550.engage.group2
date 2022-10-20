
# get the relative directory (for reproduction purpose)
here::i_am("code/data_manipulation.R")

# load in required library
library(stringr)

# load in original dataset
# for reproduction purpose, use here::here
engage <- read.csv(here::here("data/course_engagement.csv"))

# split the length variable by ":" and save the output to seconds, minutes, and hours
for (i in 1:nrow(engage)) {
  engage[i,"seconds"] <- as.numeric(strsplit(as.character(engage[i,"length"]),
                                             "\\:")[[1]][length(strsplit(as.character(engage[i,"length"]),"\\:")[[1]])])
  engage[i,"minutes"] <- as.numeric(strsplit(as.character(engage[i,"length"]),
                                             "\\:")[[1]][length(strsplit(as.character(engage[i,"length"]),"\\:")[[1]])-1])
  engage[i,"hours"] <- as.numeric(strsplit(as.character(engage[i,"length"]), "\\:")[[1]][1])
}

engage$hours <- ifelse(engage$hours==engage$minutes, 0, engage$hours)

# summary the time to seconds and minutes
engage$total_sec <- engage$seconds + 60*engage$minutes + 3600*engage$hours
engage$total_min <- engage$total_sec/60


# output to rds file
# for reproduction purpose, use here::here
saveRDS(engage, file = here::here("data", "course_engagement_edit.rds"))
