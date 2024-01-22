library(testthat)
library(webmockr)
library(httr)

source("../R/geographic.R")

source("mocks/geographic.R")

url_root <- "https://webapi.aclimate.org/api/"

httr_mock()

test_that("get_geographic_country Returns a list with information about countries", {




    stub_request("GET", paste0(url_root, "Geographic/Country/json")) %>%
        to_return(status = 200, body = geographic_country_mock_data)

    result <- get_geographic_country(url_root)



    expect_is(result, "data.frame")
    expect_equal(nrow(result), 9)
    expect_equal(ncol(result), 3)
})

test_that("get_geographic Returns a list with geographical information", {

    country_id <- "61e59d829d5d2486e18d2ea8"



    stub_request("GET", paste0(url_root,"Geographic/",country_id,"/json")) %>%
        to_return(status = 200, body = geographic_mock_data)

    result <- get_geographic(url_root, country_id)




    expect_is(result, "data.frame")
    expect_equal(nrow(result), 3)
    expect_equal(ncol(result), 13)
})


test_that("get_geographic_ws Returns a list with information about weather stations.", {

    country_id <- "6438525c843fb30d41311d25"



    stub_request("GET", paste0(url_root, "Geographic/", country_id, "/WeatherStations/json")) %>%
        to_return(status = 200, body = geographic_ws_mock_data)

    result <- get_geographic_ws(url_root, country_id)




    expect_is(result, "list")
    expect_length(result, 36)
    expect_length(result[[1]], 7)

})

httr_mock(FALSE)
