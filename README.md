# INFO 550: Engagement Report Project
# Group 2

## Data Dictionary

- `week`          = week of class, numeric
- `video_number`  = sequential number of a video within a week, numeric
- `video_title`   = title of video file, string
- `topic`         = topic of video, string
- `views`         = total number of views of video, numeric
- `unique_viewers`= total number of unique viewers of video, numeric
- `length`        = length of video, either mm:ss or hh:mm:ss format for videos > 1 hour
- `reupload`      = was the video reuploaded to fix mistakes, 0 = no; 1 = yes

## Project Organization

### Group Member Roles:

  *Team lead*: Ian Fowler

  *Coder*: Chenxi Du, Natalie Hakim, Yu Cao

### Coding Elements:

__Descriptive analysis table (table 1)__ -- by selected week description of each video including all variables (Chenxi Du)

__Visual analysis (Figures)__ -- by selected week correlation analysis matrix (Yu Cao)

__Linear regression analysis__  – select which regression to be included in final output

unique_viewers (by video title) ~ length + video_number + length*video_number (Ian F)

unique_viewers (grouped by week) ~ length + video_number + length*video_number (Natalie)

unique_viewers (grouped by topic) ~ length + video_number + length*video_number (Chenxi Du)

### Organizational Structure

`project folder` <- project(week_).Rmd render_report.R makefile project(week_).html

`/data folder` <- raw data
              
`/code folder` <- code.R for analyses coded by each coder
                 
`/output folder` <- code chunk output.Rds/.png

### Customization

__config file with environmental variables__ <- change week/topic being analyzed/output with proper labels + select appropriate regression