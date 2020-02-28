# Created on February 28, 2020
# author: Katie Birchard
# Implementation of the barrel distortion filter in the Rmagine package.

#' Apply barrel distortion filter to a given image.
#' 
#' Returns the given image with the user-specified distortion applied.
#' 
#' @param image string: the local file path for the image to which the filter will be applied.
#' @param a double: parameter for correction, affects outermost pixels. Default: 0.3.
#' @param b double: parameter for correction. Default: 0.3.
#' @param c double: parameter for correction. Default: 0.3.
#' @param d double: linear scaling of the image. Default: 1.0.  
#' @param w integer: scaled width of the image. Default: 500.
#' @param h integer: scaled height of the image. Default: 500.
#' 
#' @return image: image returned with desired distortion applied.
#' @export

fishbowl_filter <- function(image, a=0.3, b=0.3, c=0.3, d=1.0, w=500, h=500) {
  
}