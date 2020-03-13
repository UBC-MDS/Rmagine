# Created on February 26, 2020
# author: Sukriti Trehan
# Implementation of colour_filters function in the Rmagine package.


#' Apply colour filter to given image
#'
#' Saves the given image to the working directory with the user-specified color filter applied.
#'
#' @param image string: The local file path for image to which filter will be applied
#' @param tone string: Colour filter to be applied to the image. Options:'grayscale', 'blue_tone', 'green_tone', 'red_tone', 'negative'. Default: 'grayscale'
#'
#' @return image: image returned with desired colour filter applied
#' @export
#' @importFrom magrittr %>%

colour_filters <- function(image, tone="grayscale"){

  ## unit tests
  if(!is.character(image)){
    stop("Error: image path must be a string")
  }

  if(!(tolower(tone)) %in% c("grayscale","negative", "blue_tone", "green_tone", "red_tone")){
    stop("Invalid colour tone for filtering. Choose between: 'grayscale', 'negative', 'blue_tone', 'green_tone', 'red_tone'")
  }

  if(startsWith(tolower(image), "http") | startsWith(tolower(image), "www")){
    stop("Error: image path must be from a local directory")
  }

  if(!endsWith(image, "jpg") & !endsWith(image, "png") & !endsWith(image, "jpeg")){
    stop("Error: Path given must point to an image of .png, .jpg, or .jpeg format")
  }

  im <- imager::load.image(image)

  ## converting image to an array
  im_array <- as.array(im)

  ## extracting colour channels from the image
  red_array <- im_array[,,1,1]
  green_array <- im_array[,,1,2]
  blue_array <- im_array[,,1,3]

  if(tolower(tone) == "red_tone"){
    im_array[,,1,1] = (red_array*0.439)
    im_array[,,1,2] = (green_array*0.258)
    im_array[,,1,3] = (blue_array*0.078)

    imager::save.image(imager::cimg(im_array), "colour_filter.jpeg")
  }

  else if(tolower(tone) == "blue_tone"){
    im_array[,,1,1] = (red_array*0.12)
    im_array[,,1,2] = (green_array*0.17)
    im_array[,,1,3] = (blue_array*0.70)

    imager::save.image(imager::cimg(im_array), "colour_filter.jpeg")
  }

  else if(tolower(tone) == "green_tone"){
    im_array[,,1,1] = (red_array*0.12)
    im_array[,,1,2] = (green_array*0.70)
    im_array[,,1,3] = (blue_array*0.17)

    imager::save.image(imager::cimg(im_array), "colour_filter.jpeg")
  }

  else if(tolower(tone) == "negative"){
    imager::save.image(255-im %>% imager::grayscale(), "colour_filter.jpeg")
  }

  else {
    imager::save.image(imager::grayscale(im), "colour_filter.jpeg")
  }
  print("The filtered image has been saved to the working directory")
}


