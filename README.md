
# Rmagine

## Package Overview & Scope

We intend to design functions that provide several different types of
visual manipulations to an input image. Note the initial design will
accept single images as inputs, but we intend to consider enhancing the
package to apply the effects in bulk to a batch of input images.

## Features

In this package we intend to create four main functions that accept an
image as input and apply different types of manipulations and provide a
new output image as summarized below:

1.  **Barrel ‘fisheye’ distortion**: produces an image with strong
    visual distortion intended to create a wide panoramic or
    hemispherical effect
      - *Stretch goal*: ‘pincushion’ distortion, effectively the inverse
        of fisheye distortion
2.  **Colour filters**: produces an image with different user-specified
    colour distortions (ex: sepia tone)
      - *Stretch goal*: allowing the user to specify the strength of the
        effect via a parameter
3.  **Edge detection**: identifies edges by looking at where the image
    brightness changes sharply, and produces a black and white image
    highlighting the locations of these edges
      - *Stretch goal*: a more customizable, artistic colourized edge
        detection filter that would allow the user to specify desired
        colours for the output image with parameters (beyond the default
        black and white)
4.  **Vignetting**: produces an image with reduced brightness around the
    periphery compared to the image center
      - *Stretch goal*: allow the user to specify a focal point location
        (other than the centre) via parameter, around which the
        vignetting effect should be applied

**Package data:** We plan to include a small set of our own photos in
the package as sample images for use with the package functions

## Our Package in the R Ecosystem

A variety of image processing packages providing some similar
functionality already exist within the R ecosystem, including
[magick](https://github.com/ropensci/magick),
[imager](https://github.com/dahtah/imager), and
[OpenImageR](https://github.com/mlampros/OpenImageR). The purpose of our
package is the provide functions that apply some common artistic filter
transformations to a given input image.

## Installation

You can install the released version of Rmagine from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Rmagine")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rmagine")
```
