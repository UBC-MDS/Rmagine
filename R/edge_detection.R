# Created on February 26, 2020
# author: Trevor Kwan
# Implementation of edge_detection function in the Rmagine package.


#' Apply edge detection to given image
#'
#' Returns the given image with greyscale edge detection applied.
#'
#' @param image_path string: The local file path for an image of png, jpg, or jpeg format to which edge detection filter will be applied.
#'
#' @return 
#' @export image: greyscale image returned with edge detection and saved as "edge_detection_image.jpg"

require(imager)

edge_detection <- function(image_path){
  
  # Exception handling
  if(!is.character(image_path)) {
    stop("Image file path must be a string")
  }
  
  if (!endsWith(image_path, ".png") & !endsWith(image_path, ".jpeg") & !endsWith(image_path, ".jpg")){
    stop("Image format must be png, jpg, or jpeg.")
  }
  
  if (startsWith(image_path, "http") | startsWith(image_path, "www")){
    stop("Image file path can't be a URL, provide a local file path.")
  }
  
  # load greyscale image
  image <- load.image(image_path)
  
  # convert image into grayscale image
  image <- grayscale(image)
  
  # compute an image gradient
  gradient <- imgradient(image,"xy")
  
  # compute the gradient magnitude
  magnitude <- with(gradient,sqrt(x^2+y^2))
  
  # take the threshold of the magnitude and convert it to an image
  image <- as.cimg(threshold(magnitude))
  
  # save image as edge_detection_image.jpg
  save.image(image, "edge_detection_image.jpg")
  
}