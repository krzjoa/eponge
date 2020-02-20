
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sponge <img src='man/figures/logo.png' align="right" height="139" />

> Keep your environment clean <!-- badges: start -->
> [![Documentation](https://img.shields.io/badge/documentation-sponge-orange.svg?colorB=E91E63)](http://krzjoa.github.io/sponge/)
> [![Travis build
> status](https://travis-ci.org/krzjoa/sponge.svg?branch=master)](https://travis-ci.org/krzjoa/sponge)
> [![AppVeyor build
> status](https://ci.appveyor.com/api/projects/status/github/krzjoa/sponge?branch=master&svg=true)](https://ci.appveyor.com/project/krzjoa/sponge)
> [![Buy hex
> stciker](https://img.shields.io/badge/buy%20hex-sponge-green)](https://www.redbubble.com/people/krzjoa/works/44569100-sponge-r-package-hex?asc=u&kind=sticker&p=sticker&size=small)
> <!-- badges: end -->

A small utility which makes selective objects removing easier.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("krzjoa/sponge")
```

## Usage

Many times we can meet a situation, when we want to clean our
environment selectively. Suppose we just wrote a couple of functions,
which have the same names as the ones existing in already attached
libraries.

``` r
filter <- function(x, id){
  x %>% 
  filter(ID == id)
}

cars <- 1:5

sponge::erase_masking()
```

Sometimes, we may want to tidy our messy enivornment: we have objects we
would like to keep, while in the same time there are many temporary
objects created in exploration.

``` r
cars.2 <- cars
cars.2$speed <- cars.2$speed + 2

new.iris <- iris[1:20, ]

add_two <- function(x) x + 2

# Normally, we don't have to pass envir argument, because it indicates global environment by default
sponge::erase_data(envir = environment())
```
