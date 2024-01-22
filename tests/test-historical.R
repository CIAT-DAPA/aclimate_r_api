library(testthat)
library(webmockr)
library(httr)

source("../R/historical.R")

source("mocks/historical.R")

context("Module Historical Tests - Aclimate API")

url_root = "https://webapi.aclimate.org/api/"

httr_mock()

test_that("get_historical_climatology Returns a dataframe with climatological data.", {




    stub_request("GET", paste0(url_root, "Historical/Climatology/58504f1a006cb93ed40eebe3/json")) %>%
        to_return(status = 200, body = historical_climatology_mock_data)

    result <- get_historical_climatology(url_root, c("58504f1a006cb93ed40eebe3"))



    expect_is(result, "data.frame")
    expect_gt(nrow(result), 48)
    expect_equal(ncol(result), 4)
})



test_that("get_historical_climatic Returns a dataframe with historical climatological data.", {



    stub_request("GET", paste0(url_root, "Historical/HistoricalClimatic/58504f1a006cb93ed40eebe3/json")) %>%
        to_return(status = 200, body = historical_climatic_mock_data)

    result <- get_historical_historicalclimatic(url_root, c("58504f1a006cb93ed40eebe3"))


    expect_is(result, "data.frame")
    expect_gt(nrow(result), 35)
    expect_equal(ncol(result), 5)
})



test_that("get_historical_historicalyieldyears Returns a dataframe with years of historical performance data", {



    stub_request("GET", paste0(url_root, "Historical/HistoricalYieldYears/58504f1a006cb93ed40eebe3/json")) %>%
        to_return(status = 200, body = yield_years_mock_data)

    result <- get_historical_historicalyieldyears(url_root, c("58504f1a006cb93ed40eebe3"))



    expect_is(result, "data.frame")
    expect_gt(nrow(result), 0)
    expect_equal(ncol(result), 1)
})


test_that("get_historical_historicalyield Returns a dataframe with historical crop performance data", {



    stub_request("GET", paste0(url_root, "Historical/HistoricalYield/58504f1a006cb93ed40eebe3/2023/json")) %>%
        to_return(status = 200, body = yield_mock_data)

    result <- get_historical_historicalyield(url_root, c("58504f1a006cb93ed40eebe3"), c("2023"))



    expect_is(result, "NULL")
})

httr_mock(FALSE)
