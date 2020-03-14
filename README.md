
# Rmagine

  <!-- badges: start -->
  [![R build status](https://github.com/UBC-MDS/Rmagine/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/Rmagine/actions)
  <!-- badges: end -->

## Package Overview & Scope

We intend to design functions that provide several different types of
visual manipulations to an input image. Note the initial design will
accept single images as inputs, but we intend to consider enhancing the
package to apply the effects in bulk to a batch of input images.

## Features

In this package we intend to create four main functions that accept an
image as input and apply different types of manipulations and provide a
new output image as summarized below:

1.  **Tunnel filter**: produces an image with strong visual distortion
    intended to create a tunnel or pincushion effect
      - *Stretch goal*: ‘barrel’ distortion, effectively the inverse of
        tunnel distortion
2.  **Colour filters**: produces an image with different user-specified
    colour distortions (ex: grayscale tone)
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

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rmagine")
```

## Usage

### Tunnel Filter

``` r
library(Rmagine)
tunnel_filter(image_path, k, rot)
```

#### Arguments

  - `image_path`: file path of the input image (string)
  - `k`: distortion coefficient (float, optional). If not specified,
    defaults to 0.5
  - `rot`: rotation degree holding value between -0.5 and 0.5 (float,
    optional). If not specified, defaults to 0.5

#### Output

  - Saves the image with tunnel filter applied to the current working
    directory

#### Example

  - `tunnel_filter("tests/imgs/coronado_beach.jpeg", 0.6, 0.3)`

### Colour Filter

``` r
library(Rmagine)
colour_filters(image, tone)
```

#### Arguments

  - `image`: file path of the input image (string)
  - `tone`: colour filter to be applied to the image (string, optional)
    ‘grayscale’, ‘red\_tone’, ‘green\_tone’, ‘blue\_tone’, ‘negative’.
    If not specified, defaults to ‘grayscale’

#### Output

  - Saves the image with colour filter applied to the current working
    directory

#### Example

  - `colour_filters("tests/imgs/coronado_beach.jpeg", 'red_tone')`

### Edge Detection

``` r
library(Rmagine)
edge_detection(image_path)
```

#### Arguments

  - `image_path`: file path of the input image (string)

#### Output

  - Saves the image with edge detection filter applied to the current
    working directory

#### Example

  - `edge_detection("tests/imgs/coronado_beach.jpeg")`

### Vignetting

``` r
library(Rmagine)
vignette_filter(image_path, strength)
```

#### Arguments

  - `image_path`: file path of the input image (string)
  - `strength`: parameter for strength of the dimming effect (double,
    optional). If not specified, defaults to 1.0

#### Output

  - Saves the image with vignetting applied at specified strength to the
    current working directory

#### Example

  - `vignette_filter("tests/imgs/coronado_beach.jpeg", 0.9)`

## Package Dependencies

  - `imager`
  - `testthat`
