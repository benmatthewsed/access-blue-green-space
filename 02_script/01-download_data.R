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




# OA lookups --------------------------------------------------------------

oa_lookups <- "https://www.nrscotland.gov.uk/media/utrbt5ze/census_2022_index.zip"

download.file(oa_lookups,
              destfile = here::here("01_data", 
                                    "zipfiles",
                                    "census_2022_oa_lookups.zip"),
              mode = "wb")



oa_boundaries_ctc <- "https://www.nrscotland.gov.uk/media/uwdpx4hn/output-area-2022-mhw.zip"


download.file(oa_boundaries_ctc,
              destfile = here::here("01_data", 
                                    "zipfiles",
                                    "census_2022_oa_boundaries_ctc.zip"),
              mode = "wb")




oa_pwc <- "https://www.nrscotland.gov.uk/media/gm4dvdsv/output-area-2022-pwc.zip"


download.file(oa_pwc,
              destfile = here::here("01_data", 
                                    "zipfiles",
                                    "census_2022_oa_pwc.zip"),
              mode = "wb")



# extract

unzip(here::here("01_data", 
                 "zipfiles",
                 "census_2022_oa_boundaries_ctc.zip"),
      exdir = here::here("01_data",
                         "raw_data")
)


unzip(here::here("01_data", 
                 "zipfiles",
                 "census_2022_oa_pwc.zip"),
      exdir = here::here("01_data",
                         "raw_data")
)

