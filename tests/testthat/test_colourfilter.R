# This script tests the colour_filters function
# Applies tests to the colour_filters function to ensure proper usage.

library(testthat)
library(imager)

context("colour_filters")

test_image <- "../imgs/coronado_beach.jpeg"
bad_test_image <- "../imgs/coronado_beach.csv"
test_image_url <- "https://Python-logo-notext.svg"

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

test_that("Strength must be a float", {
  expect_error(colour_filters(test_image, strength = 'high'),
               "Error: Strength must be a double")
})

test_that("Strength is not valid", {
  expect_error(colour_filters(test_image, strength = 10),
               "Error: strength must be a float greater than 0 and less than or equal to 2")
})

test_that("Inavlid return file name. File name must end with .jpg, .png or .jpeg", {
  expect_error(colour_filters(test_image, return_file_name = 'file'),
               "Error: Path given must end with .png, .jpg, or .jpeg")
})

test_that("Inavlid destination folder. Must be a string and an existing directory", {
  expect_error(colour_filters(test_image, dest_folder = 1),
               "Error: Destination folder must be a string")
})

returned_arr_grayscale <- colour_filters(test_image, dest_folder = "")
returned_arr_negative <- colour_filters(test_image, tone = "negative", dest_folder = "")
returned_arr_red <- colour_filters(test_image, tone = "red_tone", dest_folder = "")
returned_arr_blue <- colour_filters(test_image, tone = "blue_tone", dest_folder = "")
returned_arr_green <- colour_filters(test_image, tone = "green_tone", dest_folder = "")

test_that("Test for correct dimensions of output array", {
  expect_equal(dim(returned_arr_grayscale)[4], 1)
  expect_equal(dim(returned_arr_negative), dim(load.image('../imgs/coronado_beach.jpeg')))
  expect_identical(dim(returned_arr_red), dim(load.image('../imgs/coronado_beach.jpeg')))
  expect_equal(dim(returned_arr_blue), dim(load.image('../imgs/coronado_beach.jpeg')))
  expect_equal(dim(returned_arr_green), dim(load.image('../imgs/coronado_beach.jpeg')))
})
