#Reading in dataset with items checked out at least 10 times a month from 2017-20203  
library_data <- read.csv(file = "C:\\Users\\miape\\OneDrive\\INFO201\\a3-spl-checkouts-miapkz\\2017-2023-10-Checkouts-SPL-Data.csv\\2017-2023-10-Checkouts-SPL-Data.csv")
 View(library_data)
library_data %>% summarize(min(Checkouts))
# Obtaining 5 summary values
 
# First, which book was checked out the most times
 library("dplyr")
 library("stringr")
 most_checked_out_book <- library_data %>% filter(Checkouts == max(Checkouts)) %>% pull (Title)
 
 max_checkouts <- library_data %>% filter(Checkouts == max(Checkouts)) %>% pull(max(Checkouts))
 
# How many total physical books were checked out?
 total_books <- sum(str_detect(library_data$MaterialType, "BOOK"))

# How many total eBooks were checked out?
 total_ebooks <- sum(str_detect(library_data$MaterialType, "EBOOK"))

# Most checked out book(s) in 2020.
 most_checked_out_2020 <- library_data %>% group_by(CheckoutYear == "2020") %>% filter(Checkouts == max(Checkouts)) %>% pull(Title)

# Which is the most common publisher?
 most_common_publisher <- names(which.max(table(library_data$Publisher)))
                         