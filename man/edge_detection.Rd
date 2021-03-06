% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/edge_detection.R
\name{edge_detection}
\alias{edge_detection}
\title{Apply edge detection to given image}
\usage{
edge_detection(
  image_path,
  return_file_name = "edge.jpeg",
  dest_folder = "transformed_imgs/"
)
}
\arguments{
\item{image_path}{string: The local file path for an image of png, jpg, or jpeg format to which edge detection filter will be applied.}

\item{return_file_name}{string: File name for the transformed image to be saved}

\item{dest_folder}{string: Destiname folder name for storing transformed images}
}
\value{
array: image array with edge_detection filter applied.
}
\description{
Returns the given image with greyscale edge detection applied.
}
