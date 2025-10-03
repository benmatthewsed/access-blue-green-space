census_oa_url <- "https://www.scotlandscensus.gov.uk/media/zz85kfinmf97whklasd98gfkadft5hj4f_Topic2H_20241120_1747/Census-2022-Output-Area-v1.zip"

download.file(census_oa_url,
              destfile = here::here("01_data", 
                                    "zipfiles",
                                    "census_2022_oa.zip"),
              mode = "wb")

# extract

unzip(here::here("01_data", 
                 "zipfiles",
                 "census_2022_oa.zip"),
      exdir = here::here("01_data",
                         "raw_data")
)
