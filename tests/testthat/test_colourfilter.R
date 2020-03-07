# This script tests the colour_filters function
# Applies tests to the colour_filters function to ensure proper usage.

library(testthat)

context("colour_filters")

test_image <- "../imgs/coronado_beach.png"
bad_test_image <- "../imgs/coronado_beach.csv"
test_image_url <- "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg"

test_that("Image path must be a string", {
  expect_error(colour_filters(2),
               "Error: image path must be a string")
})

test_that("Inavlid input path. Image path must be for jpg, png or jpeg format", {
  expect_error(colour_filters(bad_test_image),
               "Error: Path given must point to an image of .png, .jpg, or .jpeg format")
})

test_that("Image path must be from local directory, not a URL", {
  expect_error(colour_filters(test_image_url),
               "Error: image path must be from a local directory")
})

test_that("Argument tone is not valid", {
  expect_error(colour_filters(test_image,tone = 'pink'),
               "Invalid colour tone for filtering. Choose between: 'grayscale', 'negative', 'blue_tone', 'green_tone', 'red_tone'")
})
