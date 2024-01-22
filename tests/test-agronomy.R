library(testthat)
library(webmockr)
library(httr)

source("../R/agronomy.R")


source("mocks/agronomy.R")

context("Module Agronomy Tests - Aclimate API")

test_that("Verify that get_agronomy returns 2 lists and that the mock formats it correctly.", {
    url_root = "https://webapi.aclimate.org/api/"


    httr_mock()

    stub_request("GET", paste0(url_root, "Agronomic/true/json")) %>%
        to_return(status = 200, body = agronomy_mock_data)


    result <- get_agronomy(url_root)

    httr_mock(FALSE)

    expect_is(result, "list")
    expect_length(result, 2)
    expect_is(result$cultivars, "data.frame")
    expect_length(result$cultivars, 6)
    expect_equal(nrow(result$cultivars), 2)
    expect_is(result$soils, "data.frame")
    expect_length(result$soils, 4)
    expect_equal(nrow(result$soils), 2)
})
