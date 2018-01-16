# FoodC5
R package to derive probability that any two food items are the same

## Overview

**FoodC5** is an R package providing an interface to a pre-trained C5.0 classification model.
This C5.0 tree enable to predict whether any two food items are the same. It requires the following input parameters:

* the similary between the two food names (can be computed with the [Foodmapping R package](https://github.com/armandvalsesia/Foodmapping))
* information on how much the two items differ in energy content (expressed as a percentage - see below)

## Installation

To install, run the following commands in R:

``` r
install.packages("devtools")
devtools::install_github("armandvalsesia/FoodC5")
```


## License and authors

This software uses the GPL v3 license, see [LICENSE](LICENSE).
Authors and copyright are provided in [DESCRIPTION](DESCRIPTION). 

## Issues

To report an issue, please use the [locus issue tracker](https://github.com/hruffieux/locus/issues) at github.com.
