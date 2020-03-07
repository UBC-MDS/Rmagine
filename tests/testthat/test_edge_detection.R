# Load helper image
test_image <- "../imgs/coronado_beach.png"
test_not_image <- "../imgs/coronado_beach.svg"
test_image_url <- "www.image.com"

test_that("Filepath must be a string", {
  expect_error(edge_detection(3), 
               "Image file path must be a string")
})

test_that("Filepath must lead to an image", {
  expect_error(edge_detection(test_not_image),
               "Image format must be png, jpg, or jpeg.")
})

test_that("Filepath must not be a URL", {
  expect_error(edge_detection(test_image_url),
               "Image file path can't be a URL, provide a local file path.")
})