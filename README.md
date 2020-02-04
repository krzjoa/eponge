
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sponge <img src='man/figures/logo.png' align="right" height="139" />

> Keep your environment
clean

<!-- badges: start -->

[![Documentation](https://img.shields.io/badge/documentation-sponge-orange.svg?colorB=E91E63)](http://krzjoa.github.io/sponge/)
[![Buy hex
stciker](https://img.shields.io/badge/buy%20hex-sponge-green)](https://www.redbubble.com/people/krzjoa/works/44569100-sponge-r-package-hex?asc=u&kind=sticker&p=sticker&size=small)
<!-- badges: end -->

A small utility which makes selective objects removing easier.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("krzjoa/sponge")
```

## Usage

Many times we can meet a situation, when we want to clean our
environment selectiely. Suppose we just wrote a couple of functions,
which have the same names as the ones existing in already attached
libraries.

``` r
filter <- function(x, id){
  x %>% 
  filter(ID == id)
}

sponge::erase_masking_functions()
```

Sometimes, we may want to tidy our messy enivornment: he have functions
we would like to keep, while in the same time there are many temporary
objects created in exploration.

``` r
sponge::erase_data()
```
