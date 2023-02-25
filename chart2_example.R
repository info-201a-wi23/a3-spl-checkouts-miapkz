# Creating Chart 2

# Filtering data to show checkouts by material type per year
chart_2 <- library_data %>% group_by(CheckoutYear, MaterialType) %>% filter(MaterialType %in% c("EBOOK", "BOOK", "AUDIOBOOK")) %>% summarize(totals = sum(Checkouts))
View(chart_2)

# Making line graph
library(ggplot2)
library(scales)
line_2 <- ggplot(data=chart_2) +
  geom_line(aes(x=CheckoutYear, y = totals, color=MaterialType)) +
  labs(title = "Total Book Checkouts by Type between 2017 and 2023", x = "Years", y = "Total Checkouts")+
  scale_x_continuous(breaks=seq(2017, 2023, 1)) +
  scale_y_continuous(labels=label_number_si())


# Creating chart 3

# Filter data to only show the most checked out book - So You Want to Talk About Race, and two books I read and really liked - The Alchemist and To Kill a Mockingbird

chart_3 <- library_data %>% group_by(CheckoutYear, Title) %>% filter(Title %in% c("So You Want to Talk about Race (Unabridged)", "To Kill a Mockingbird", "The Alchemist (Unabridged)")) %>% summarize(total = sum(Checkouts))

View(chart_3)

# Making line chart
line_3 <- ggplot(data=chart_3) +
  geom_line(aes(x=CheckoutYear, y=total, color=Title)) +
  labs(title = "Checkouts of 3 Chosen Books between 2017 and 2021", x = "Years", y= "Total Checkouts")





