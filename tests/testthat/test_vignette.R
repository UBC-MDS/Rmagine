# This script tests the vignette function
library(testthat)

context("Vignette")

test_that("Test that the input parameters are valid", {
  expect_error(vignette_filter(image_path=5),
               "Image file path must be a string.")
  expect_error(vignette_filter(image_path="abc.123"),
               "Image format must be png, jpg, or jpeg.")
  expect_error(vignette_filter(image_path="http:image.png"),
               "Image file path can't be a URL, provide a local file path.")
  expect_error(vignette_filter(image_path='coronado_beach.jpeg',strength=-5),
               "Vignette strength can't be negative.")
})

test_that("Test that image loads succesfully", {
  expect_error(vignette_filter(image_path='invalid_input_path.png',strength=1.0),
               "File not found")
})
