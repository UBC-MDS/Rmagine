# Load helper image
test_image <- "../imgs/coronado_beach.png"
test_not_image <- "../imgs/coronado_beach.svg"
test_image_url <- "www.image.com"

test_that("Filepath must be a string", {
  expect_error(tunnel_filter(4), 
               "Image file path must be a string")
})

test_that("Filepath must lead to an image", {
  expect_error(tunnel_filter(test_not_image),
               "Image file path should lead to an image")
})

test_that("Filepath must not be a URL", {
  expect_error(tunnel_filter(test_image_url),
               "Image file path must be in a local directory")
})
