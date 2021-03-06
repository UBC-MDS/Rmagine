# This script tests the vignette function
library(testthat)
library(imager)

context("vignette_filter")

test_image <- "../imgs/coronado_beach.png"
bad_test_image <- "../imgs/coronado_beach.csv"
test_image_url <- "https://upload.wikimedia.org/wikipedia/Python-logo-notext.svg"

test_that("Test that the input parameters are valid", {
  expect_error(vignette_filter(image_path=5),
               "Image file path must be a string.")
  expect_error(vignette_filter(image_path="abc.123"),
               "Image format must be png, jpg, or jpeg.")
  expect_error(vignette_filter(image_path="http:image.png"),
               "Image file path can't be a URL, provide a local file path.")
  expect_error(vignette_filter(image_path='coronado_beach.jpeg',strength=-5),
               "Vignette strength must be a positive value.")
  expect_error(vignette_filter(test_image, return_file_name = 123),
               "Error: Output file name must be a string")
  expect_error(vignette_filter(image_path=test_image, return_file_name = 'file'),
               "Error: Path given must end with .png, .jpg, or .jpeg")
  expect_error(vignette_filter(test_image, dest_folder = 1),
               "Error: Destination folder must be a string")
})

test_that("Test that image loads succesfully", {
  expect_error(vignette_filter(image_path='invalid_input_path.png',strength=1.0),
               "File not found")
})

returned_arr_vignette <- vignette_filter(test_image, dest_folder = "")

test_that("Test for correct dimensions of output array", {
  expect_equal(dim(returned_arr_vignette), dim(imager::load.image('../imgs/coronado_beach.png')))
})
