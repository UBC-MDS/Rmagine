# This script tests the edge_detection function
library(testthat)
library(imager)

context("edge_detection")

# Load helper image
test_image <- "../imgs/coronado_beach.jpeg"
test_not_image <- "../imgs/coronado_beach.svg"
test_image_url <- "www.image.com"

test_that("Filepath must be a string", {
  expect_error(edge_detection(3),
               "Image file path must be a string")
})

test_that("Filepath must lead to an image", {
  expect_error(edge_detection(test_not_image),
               "Image format must be jpg or jpeg.")
})

test_that("Filepath must not be a URL", {
  expect_error(edge_detection(test_image_url),
               "Image file path can't be a URL, provide a local file path.")
})

test_that("Return file name must be a string", {
  expect_error(edge_detection(test_image, return_file_name = 123),
               "Error: Output file name must be a string")
})

test_that("Inavlid return file name. File name must end with .jpg, .png or .jpeg", {
  expect_error(edge_detection(test_image, return_file_name = 'file'),
               "Error: Path given must end with .png, .jpg, or .jpeg")
})

test_that("Inavlid destination folder. Must be a string and an existing directory", {
  expect_error(edge_detection(test_image, dest_folder = 1),
               "Error: Destination folder must be a string")
})

returned_arr_edge_detection <- edge_detection(test_image, dest_folder = "")

test_that("Test for correct dimensions of output array", {
  expect_equal(dim(returned_arr_edge_detection), dim(imager::grayscale(imager::load.image('../imgs/coronado_beach.jpeg'))))
})
