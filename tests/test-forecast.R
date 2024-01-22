library(testthat)
library(webmockr)

source("../R/forecast.R")

source("mocks/forecast.R")

httr_mock()

context("Module Forecast Tests - Aclimate API")


url_root <- "https://webapi.aclimate.org/api/"

test_that("get_forecast_climate Simulation of a successful API query", {

    stations <- c("58504f1a006cb93ed40eebe2")
    stub_request("GET", paste0(url_root, "Forecast/Climate/58504f1a006cb93ed40eebe2/true/json")) %>%
        to_return(status = 200, body = forecast_climate_mock_data)


    result <- get_forecast_climate(url_root, stations)

    expect_true(is.list(result))
    expect_true("probabilities" %in% names(result))
    expect_true("performance" %in% names(result))
    expect_true("scenarios" %in% names(result))
})

test_that("get_forecast_crop Simulation of a successful API query", {

    stations <- c("58504f1a006cb93ed40eebe2")
    stub_request("GET", paste0(url_root,"Forecast/Yield/58504f1a006cb93ed40eebe2/json")) %>%
        to_return(status = 200, body = forecast_crop_mock_data)


    result <- get_forecast_crop(url_root, stations)

    expect_true(is.data.frame(result))
})

test_that("get_forecast_information Simulation of a successful API query", {

    year <- 2023

    stub_request("GET", paste0(url_root,"Forecast/Log/2023/json")) %>%
        to_return(status = 200, body = forecast_information_mock_data)



    result <- get_forecast_information(url_root, year)

    expect_true(is.data.frame(result))
})

test_that("get_forecast_subseasonal Simulation of a successful API query", {

    stub_request("GET", paste0(url_root,"Forecast/SubseasonalWS/63a3744005732d2a14260392/json")) %>%
        to_return(status = 200, body = forecast_subseasonal_mock_data)


    stations <- c("63a3744005732d2a14260392")
    result <- get_forecast_subseasonal(url_root, stations)

    expect_true(is.data.frame(result))
    expect_equal(nrow(result), 4)
    expect_equal(ncol(result), 8)
})

test_that("get_forecast_climate_previous Simulation of a successful API query", {

    stub_request("GET", paste0(url_root,"Forecast/ClimatePrevious/657006544afb9646da8c6b78/58504f1a006cb93ed40eebe2/true/json")) %>%
        to_return(status = 200, body = forecast_climate_previous_mock_data)

    forecast <- "657006544afb9646da8c6b78"
    stations <- c("58504f1a006cb93ed40eebe2")
    result <- get_forecast_climate_previous(url_root, forecast, stations)

    expect_true(is.list(result))
    expect_true("probabilities" %in% names(result))
    expect_true("performance" %in% names(result))
    expect_true("scenarios" %in% names(result))
    expect_equal(ncol(result$probabilities), 7)
    expect_equal(ncol(result$performance), 5)
    expect_equal(ncol(result$scenarios), 6)
})

test_that("get_forecast_crop_previous Simulation of a successful API query", {

    stub_request("GET", paste0(url_root,"Forecast/YieldPrevious/657006544afb9646da8c6b78/58504f1a006cb93ed40eebe2/json")) %>%
        to_return(status = 200, body = forecast_crop_previous_mock_data)

    forecast <- "657006544afb9646da8c6b78"
    stations <- c("58504f1a006cb93ed40eebe2")
    result <- get_forecast_crop_previous(url_root, forecast, stations)

    expect_true(is.data.frame(result))
    expect_gt(nrow(result), 0)
    expect_equal(ncol(result), 19)
})

test_that("get_forecast_crop_exc Simulation of a successful API query", {

    stub_request("GET", paste0(url_root,"Forecast/YieldExceedance/58504f1a006cb93ed40eebe2/json")) %>%
        to_return(status = 200, body = forecast_crop_ext_mock_data)


    stations <- c("58504f1a006cb93ed40eebe2")
    result <- get_forecast_crop_exc(url_root, stations)

    expect_true(is.data.frame(result))
    expect_gt(nrow(result), 0)
    expect_equal(ncol(result), 19)
})

httr_mock(FALSE)
