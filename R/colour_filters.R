# Created on February 26, 2020
# author: Sukriti Trehan
# Implementation of colour_filters function in the Rmagine package.


#' Apply colour filter to given image
#'
#' Saves the given image in the user-specified directory with the
#' user-specified color filter applied and returns the altered image array.
#'
#' @param image string: The local file path for image to which filter will be applied
#' @param tone string: Colour filter to be applied to the image. Options:'grayscale', 'blue_tone', 'green_tone', 'red_tone', 'negative'. Default: 'grayscale'
#' @param strength double: Strength of the colour filter being applied (0-2]. Valid for 'blue_tone', 'green_tone', 'red_tone'. Default: 1
#' @param return_file_name string: File name for the transformed image to be saved
#' @param dest_folder string: Destiname folder name for storing transformed images
#'
#' @return array: altered image array returned for the input colour filter
#' @export
#'
#' @example
#' colour_filters("../tests/imgs/coronado_beach.jpeg", tone="red_tone")
#'
#' @importFrom magrittr %>%

colour_filters <- function(image, tone="grayscale", strength = 1, return_file_name = "colour.jpeg", dest_folder = "transformed_imgs/"){

  ## unit tests
  if(!is.character(image)){
    stop("Error: image path must be a string")
  }

  if(startsWith(tolower(image), "http") | startsWith(tolower(image), "www")){
    stop("Error: image path must be from a local directory")
  }

  if(!endsWith(image, "jpg") & !endsWith(image, "png") & !endsWith(image, "jpeg")){
    stop("Error: Path given must point to an image of .png, .jpg, or .jpeg format")
  }

  if(!(tolower(tone)) %in% c("grayscale","negative", "blue_tone", "green_tone", "red_tone")){
    stop("Invalid colour tone for filtering. Choose between: 'grayscale', 'negative', 'blue_tone', 'green_tone', 'red_tone'")
  }

  if(!is.double(strength)){
    stop("Error: Strength must be a double")
  }

  if((strength <= 0) | (strength > 2)){
    stop("Error: strength must be a float greater than 0 and less than or equal to 2")
  }

  if(!is.character(return_file_name)){
    stop("Error: Output file name must be a string")
  }

  if(!endsWith(tolower(return_file_name), "jpg") & !endsWith(tolower(return_file_name), "png") & !endsWith(tolower(return_file_name), "jpeg")){
    stop("Error: Path given must end with .png, .jpg, or .jpeg")
  }

  if(!is.character(dest_folder)){
    stop("Error: Destination folder must be a string")
  }

  im <- imager::load.image(image)

  ## converting image to an array
  im_array <- as.array(im)

  ## extracting colour channels from the image
  red_array <- im_array[,,1,1]
  green_array <- im_array[,,1,2]
  blue_array <- im_array[,,1,3]

  if(tolower(tone) == "red_tone"){
    im_array[,,1,1] = (red_array*0.439*strength)
    im_array[,,1,2] = (green_array*0.258)
    im_array[,,1,3] = (blue_array*0.078)

    final_img_array <- imager::cimg(im_array)
  }

  else if(tolower(tone) == "blue_tone"){
    im_array[,,1,1] = (red_array*0.12)
    im_array[,,1,2] = (green_array*0.17)
    im_array[,,1,3] = (blue_array*0.70*strength)

    final_img_array <- imager::cimg(im_array)
  }

  else if(tolower(tone) == "green_tone"){
    im_array[,,1,1] = (red_array*0.12)
    im_array[,,1,2] = (green_array*0.70*strength)
    im_array[,,1,3] = (blue_array*0.17)

    final_img_array <- imager::cimg(im_array)
  }

  else if(tolower(tone) == "negative"){
    im_array <- as.array(255-im)
    final_img_array <- 255-im %>% imager::grayscale()
  }

  else {
    im_array <- as.array(imager::grayscale(im))
    final_img_array <- imager::grayscale(im)
  }
  imager::save.image(final_img_array, file = paste0(dest_folder, return_file_name))

  print("The filtered image has been saved to the specified directory")
  return(im_array)
}


