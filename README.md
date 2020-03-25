
# Rmagine

[![codecov](https://codecov.io/gh/UBC-MDS/Rmagine/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/Rmagine)
![R-CMD-check](https://github.com/UBC-MDS/Rmagine/workflows/R-CMD-check/badge.svg)

## Package Overview & Scope

This package includes functions that provide several different types of
visual manipulations to an input image.

## Features

This package includes four main functions that accept an image as input
and apply different types of manipulations and provide a new output
image as summarized below:

1.  **Tunnel distortion**: produces an image with strong visual
    distortion intended to create a tunnel or pincushion effect
2.  **Colour filters**: produces an image with different user-specified
    colour distortions (ex: blue tone)
3.  **Edge detection**: identifies edges by looking at where the image
    brightness changes sharply, and produces a black and white image
    highlighting the locations of these edges
4.  **Vignetting**: produces an image with reduced brightness around the
    periphery compared to the image center

**Package data:** A small set of example photos are included with the
package for testing the functions, with some usage examples outlined
below.

## Our Package in the R Ecosystem

A variety of image processing packages providing some similar
functionality already exist within the R ecosystem, including
[magick](https://github.com/ropensci/magick),
[imager](https://github.com/dahtah/imager), and
[OpenImageR](https://github.com/mlampros/OpenImageR). The purpose of our
package is the provide functions that apply some common artistic filter
transformations to a given input image.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rmagine")
```

## Usage

For additional documentation and usage examples please refer to the
[Introduction to image filtering with
Rmagine](http://htmlpreview.github.com/?https://github.com/UBC-MDS/Rmagine/blob/brendon-vignette/vignettes/Rmagine-vignette.html)
page and [pkgdown documentation](https://ubc-mds.github.io/Rmagine/) page.

### Using the Vignette Filter

``` r
library(Rmagine)
vignette_filter(image_path, strength)
```

This function produces an image with reduced brightness around the
periphery compared to the image center.

#### Arguments

  - `image_path`: file path of the input image (string)
  - `strength`: parameter for strength of the dimming effect (double,
    optional). If not specified, defaults to 1.0

#### Example

Here’s an input photo taken at Coronado Beach, San Diego: ![Sample
Image](vignettes/imgs/coronado_beach.jpeg)

And here’s that image after applying the vignette filter:

`vignette_filter("imgs/coronado_beach.jpeg", 1.0)` ![Vignette
Effect](vignettes/imgs/vignette.jpeg)

## Package Dependencies

  - `imager`
  - `testthat`
