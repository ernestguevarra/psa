## code to prepare `vitals` dataset goes here

## Libraries
library(openxlsx)
library(magrittr)
library(dplyr)
library(stringr)

## Read data
d2015 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2015.xlsx",
                   startRow = 6, colNames = FALSE)

d2016 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2016.xlsx",
                   startRow = 6, colNames = FALSE)

d2017 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2017.xlsx",
                   startRow = 6, colNames = FALSE)

d2018 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2018.xlsx",
                   startRow = 6, colNames = FALSE)

d2019 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2019.xlsx",
                   startRow = 6, colNames = FALSE)

d2020 <- read.xlsx(xlsxFile = "data-raw/vitals/deaths2020.xlsx",
                   startRow = 6, colNames = FALSE)

names(d2020) <- c("residence", "total", "january", "february", "march", "april",
                  "may", "june")

names(d2015) <- c("residence", "total", "january", "february", "march", "april",
                  "may", "june", "july", "august", "september", "october",
                  "november", "december")

names(d2019) <- names(d2018) <- names(d2017) <- names(d2016) <- names(d2015)


##
d2015 <- d2015 %>%
  mutate(residence = stringr::str_trim(residence, side = "both"))

d2015 %>%
  pivot_wider(id_cols = total:december, names_from = residence)





usethis::use_data(vitals, overwrite = TRUE)
