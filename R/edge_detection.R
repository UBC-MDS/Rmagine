# Created on February 26, 2020
# author: Trevor Kwan
# Implementation of edge_detection function in the Rmagine package.


#' Apply edge detection to given image
#'
#' Returns the given image with greyscale edge detection applied.
#'
#' @param image_path string: The local file path for an image of png, jpg, or jpeg format to which edge detection filter will be applied.
#'
#' @return array: image array with edge_detection filter applied.
#' @export 

require(imager)
require(base)
utils::globalVariables(c(x, y))

edge_detection <- function(image_path){
  
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
  imager::save.image(image, "edge_detection_image.jpg")
  
  print("The filtered image has been saved to the working directory")
  
  return(image)
  
}
