# Created on February 26, 2020
# author: Trevor Kwan
# Implementation of edge_detection function in the Rmagine package.

require(imager)
require(base)
utils::globalVariables(c("x","y"))
utils::globalVariables(c("xy"))

#' Apply edge detection to given image
#'
#' Returns the given image with greyscale edge detection applied.
#'
#' @param image_path string: The local file path for an image of png, jpg, or jpeg format to which edge detection filter will be applied.
#' @param return_file_name string: File name for the transformed image to be saved
#' @param dest_folder string: Destiname folder name for storing transformed images
#'
#' @return array: image array with edge_detection filter applied.
#' @export
#' @example
#' edge_detection("imgs/pic.jpg")

edge_detection <- function(image_path, return_file_name = "colour_filter.jpeg", dest_folder = "transformed_imgs/"){

  # Exception handling
  if(!is.character(image_path)) {
    stop("Image file path must be a string")
  }

  if (startsWith(image_path, "http") | startsWith(image_path, "www")){
    stop("Image file path can't be a URL, provide a local file path.")
  }

  if (!endsWith(image_path, ".png") & !endsWith(image_path, ".jpeg") & !endsWith(image_path, ".jpg")){
    stop("Image format must be jpg or jpeg.")
  }

  if(!endsWith(tolower(return_file_name), "jpg") & !endsWith(tolower(return_file_name), "png") & !endsWith(tolower(return_file_name), "jpeg")){
    stop("Error: Path given must end with .png, .jpg, or .jpeg")
  }

  if(!is.character(dest_folder)){
    stop("Error: Destination folder must be a string")
  }

  # load greyscale image
  image <- imager::load.image(image_path)

  # convert image into grayscale image
  image <- imager::grayscale(image)

  # compute an image gradient
  gradient <- imager::imgradient(image,"xy")

  # compute the gradient magnitude
  magnitude <- base::with(gradient,sqrt(x^2+y^2))

  # take the threshold of the magnitude and convert it to an image
  image <- imager::as.cimg(imager::threshold(magnitude))

  # save image as edge_detection_image.jpg
  imager::save.image(image, file = paste0(dest_folder, return_file_name))

  print("The filtered image has been saved to the working directory")

  return(image)

}
