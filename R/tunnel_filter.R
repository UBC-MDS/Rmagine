# Created on February 28, 2020
# author: Katie Birchard
# Implementation of the tunnel distortion filter in the Rmagine package.

#' Apply tunnel distortion filter to a given image.
#' 
#' Returns the given image with the user-specified distortion applied.
#' 
#' @param image_path string: the local file path for the image to which the filter will be applied.
#' @param k double: Distortion coefficient. Default: 0.5.
#' @param rot double: Rotation degree holding value between -0.5 and 0.5. Default: 0.5.
#' 
#' @return 
#' @export image: image returned to working directory with desired distortion applied.

tunnel_filter <- function(image_path, k=0.5, rot=0.5) {
  
  # Exception handling
  if(!is.character(image_path)) {
    stop("Image file path must be a string")
  }
  
  if(!endsWith(image_path, ".jpg") & !endsWith(image_path, ".jpeg") & !endsWith(image_path, ".png")) {
    stop("Image file path should lead to an image")
  }
  
  if(startsWith(image_path, "https:") | startsWith(image_path, "http:") | startsWith(image_path, "www")) {
    stop("Image file path must be in a local directory")
  }
  
  if(!is.numeric(k)) {
    stop("Distortion coefficient, k, must be numeric")
  }
  
  if(!is.numeric(rot)) {
    stop("Rotation degree, rot, must be numeric")
  }
  
  if(rot > 0.5 | rot < -0.5) {
    stop("Rotation degree must be between -0.5 and 0.5")
  }
  
  # Read in the image file
  image <- imager::load.image(image_path)
  
  # Obtain width and height
  w <- width(image)
  h <- height(image)
  
  # Convert image to array and specify output array
  original_array <- as.array(image)
  tunnel_array <- as.array(image)
  
  # Calculate max radius for normalization
  max_radius = sqrt(w**2 + h**2)/2
  
  # Loop through colour channels, width, and height
  for (c in 1:3) {
    for (x in 1:w) {
      for (y in 1:h) {
        
        # Normalize x and y values
        norm_y <- (2*y - h)/h 
        norm_x <- (2*x - w)/w  
        
        # Calculate radius and normalize
        r = sqrt(norm_x^2 + norm_y^2)/max_radius
        x2 = norm_x / (1 + (k*(r^4) + k*(r^2) + k*r))
        y2 = norm_y/ (1 + (k*(r**4) + k*(r**2) + k*r))
        
        # Creating variables for distortion and rotation
        x3 = ((rot*cos(atan2(x2, y2)) + 1)*w)/2.0
        y3 = ((rot*sin(atan2(x2, y2)) + 1)*h)/2.0
        
        # Apply distortion and rotation to output array
        tunnel_array[x, y, 1, c] <- original_array[x3, y3, 1, c] 
      }
    }
  }
  # Convert array to image
  tunnel_image <- as.cimg(tunnel_array)
  
  # Save image
  # plot(tunnel_image)
  imager::save.image(tunnel_image, "tunnel.jpg")
  print("The filtered image has been saved to the working directory")
}
  
