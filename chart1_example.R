#Creating chart 1
library("stringr")
library("dplyr")

# Filtering the data by total fiction vs. nonfiction

"Fiction" <- library_data$Subjects[str_detect(library_data$Subjects, "fiction")]
"Nonfiction" <- library_data$Subjects[str_detect(library_data$Subjects, "nonfiction")]

chart_1 <- library_data %>% filter(Subjects %in% c("Fiction", "Nonfiction")) %>% group_by(CheckoutYear, Subjects) %>% summarize(sum = sum(Checkouts))
View(chart_1)

# Making line graph 
library(ggplot2)
line_1 <- ggplot(data=chart_1) +
  geom_line(aes(x=CheckoutYear, y = sum, color=Subjects)) +
  labs(title = "Fiction vs. Nonfiction Checkouts", x = "Years", y = "Number of Checkouts")

