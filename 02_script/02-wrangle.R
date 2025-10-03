library(tidyverse)

sex_var <-
  read_csv(
    here::here("01_data",
               "raw_data",
               "UV102b - Age (20) by sex.csv"),
    skip = 3,
    n_max = 1
  ) |> 
  rename(oa = 1)


names_var <- 
  tibble(
    name = names(sex_var),
    dat = sex_var |> t() |> as.vector()
  ) |> 
  mutate(sex_age = paste(name, dat, sep = "_")) |> 
  pull(sex_age)


age_sex <-
  read_csv(
    here::here("01_data",
               "raw_data",
               "UV102b - Age (20) by sex.csv"),
    skip = 5,
    col_names = names_var,
    n_max = 46363
  ) |> 
  rename(oa = 1) |> 
  mutate(across(where(is.numeric), as.character))


age_sex <- 
  age_sex |> 
  pivot_longer(
    cols = -c(oa),
    names_to = "sex_age",
    values_to = "n"
  ) |> 
  separate(sex_age, into = c("sex", "age"), sep = "_")

# this is suprisingly slow! like 15 seconds maybe

age_sex <- 
  age_sex |> 
  mutate(sex = str_replace_all(sex, "\\.\\.\\.|[0-9]+", ""))

oa_total <- 
  age_sex |> 
  filter(age == "All people")

oa_age_sex <- 
  age_sex |> 
  filter(age != "All people")

oa_age_sex <- 
  oa_age_sex |> 
  mutate(n = if_else(n == "-", 0L, as.numeric(n))) |> 
  filter(!is.na(n))

oa_age_sex |> 
  filter(sex != "All people") |> 
  summarise(n = sum(n))


oa_age_sex |> 
  filter(sex == "All people") |> 
  summarise(n = sum(n))


oa_total |> 
  filter(sex != "All people") |> 
  mutate(n = as.numeric(n)) |> 
  summarise(n = sum(n))

# we have 

5440900 - 5439675

# about a thousand more people with the by-age breakdown

oa_age_sex <- 
  oa_age_sex |> 
  mutate(age = fct_relevel(
    age, 
    "0 - 4",
    "5 - 9",
    "10 - 14",
    "15",
    "16 - 17",
    "18 - 19",
    "20 - 24",
    "25 - 29",
    "30 - 34",
    "35 - 39",
    "40 - 44",
    "45 - 49",
    "50 - 54",
    "55 - 59",
    "60 - 64",
    "65 - 69",
    "70 - 74",
    "75 - 79",
    "80 - 84",
    "85 and over"))


# export ------------------------------------------------------------------



saveRDS(
  oa_age_sex,
  here::here("01_data",
             "oa_age_sex.rds")
)
