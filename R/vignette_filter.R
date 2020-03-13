# Created on February 28, 2020
# author: Brendon Campbell
# Implementation of vignette_filter function in the Rmagine package.

#' Apply a vignetting filter to a given image
#'
#' Saves the given image with the vignette filter applied at the specified strength.
#'
#' @param image_path string: The local file path for the image to which the filter will be applied.
#' @param strength double: parameter for the strength of the dimming effect. Default: 1.0.
#'
#' @return array: image array with the desired distortion applied.
#' @export

vignette_filter <- function(image_path, strength=1.0) {

  if(!is.character(image_path)){
    stop("Image file path must be a string.")
  }

  if (!endsWith(image_path, ".png") & !endsWith(image_path, ".jpeg") & !endsWith(image_path, ".jpg")){
    stop("Image format must be png, jpg, or jpeg.")
  }

  if (startsWith(image_path, "http") | startsWith(image_path, "www")){
    stop("Image file path can't be a URL, provide a local file path.")
  }

  if (strength <= 0){
    stop("Vignette strength can't be negative.")
  }

  # read in image from path
  image <- imager::load.image(image_path)
  cols <- imager::width(image)
  rows <- imager::height(image)

  original_array <- as.array(image)
  vignette_array <- as.array(image)

  # calculate stdev of the gaussian based on strength parameter
  sigma <- ((rows + cols)/((1+strength)/1))/2

  # generate gaussian filters for each axis
  filt_cols <- stats::dnorm(seq.int(1, cols), mean = cols/2, sd = sigma)
  filt_rows <- stats::dnorm(seq.int(1, rows), mean = rows/2, sd = sigma)

  # create and scale 2d vignette filter
  filt_2d <- filt_rows %*% t(filt_cols)
  filt_2d_df <- as.data.frame(filt_2d/max(filt_2d))

  # apply vignette filter values to individual pixels
  for (c in 1:3) {
    for (x in 1:cols) {
      for (y in 1:rows) {
        vignette_array[x, y, 1, c] <- original_array[x, y, 1, c]*filt_2d_df[y, x]
      }
    }
  }

  vignette_image <- imager::as.cimg(vignette_array)
  imager::save.image(vignette_image,"vignette.jpeg")
  print("The filtered image has been saved to the working directory.")

  return(vignette_image)
}
