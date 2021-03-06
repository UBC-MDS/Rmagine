context("tunnel_filter")

# Load helper image
test_image <- "../imgs/coronado_beach.png"
test_not_image <- "../imgs/coronado_beach.svg"
test_image_url <- "www.image.jpg"

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

test_that("rot must be numeric", {
  expect_error(tunnel_filter(test_image, rot=TRUE),
               "Rotation degree, rot, must be numeric")
})

test_that("rot must be between -0.5 and 0.5", {
  expect_error(tunnel_filter(test_image, rot=1),
               "Rotation degree must be between -0.5 and 0.5")
})

test_that("Return file name must be a string", {
  expect_error(tunnel_filter(test_image, return_file_name = 123),
               "Error: Output file name must be a string")
})

test_that("Inavlid return file name. File name must end with .jpg, .png or .jpeg", {
  expect_error(tunnel_filter(test_image, return_file_name = 'file'),
               "Error: Path given must end with .png, .jpg, or .jpeg")
})

test_that("Inavlid destination folder. Must be a string and an existing directory", {
  expect_error(tunnel_filter(test_image, dest_folder = 1),
               "Error: Destination folder must be a string")
})

returned_array <- tunnel_filter(test_image, dest_folder = "")
original_array <- imager::load.image(test_image)

test_that("Output array should be same size as input array", {
  expect_equal(dim(returned_array),
               dim(original_array))
})
