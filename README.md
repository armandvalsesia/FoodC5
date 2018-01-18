[![Travis-CI Build Status](https://travis-ci.org/armandvalsesia/FoodC5.svg?branch=master)](https://travis-ci.org/armandvalsesia/FoodC5)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/armandvalsesia/FoodC5?branch=master&svg=true)](https://ci.appveyor.com/project/armandvalsesia/FoodC5/branch/master)
[![codecov.io](https://codecov.io/github/armandvalsesia/FoodC5/coverage.svg?branch=master)](https://codecov.io/github/armandvalsesia/FoodC5?branch=master)
[![codecov](https://codecov.io/gh/armandvalsesia/FoodC5/branch/master/graph/badge.svg)](https://codecov.io/gh/armandvalsesia/FoodC5)

# FoodC5
R package to derive probability that any two food items are the same

## Overview

**FoodC5** is an R package providing an interface to a pre-trained C5.0 classification model.
This C5.0 tree enable to predict whether any two food items are the same. It requires the following input parameters:

* fuzzy score: similary between the two food names 
* information on how much the two items differ in energy content

The fuzzy score can be computed with with the [Foodmapping R package](https://github.com/armandvalsesia/Foodmapping).
The difference in energy content can be expressed as 100 * abs( itemA_energy_content - itemB_energy_content ) / itemA_energy_content.

## Installation

To install, run the following commands in R:

``` r
install.packages("devtools")
devtools::install_github("armandvalsesia/FoodC5")
```
## Quick Start


``` r
require("FoodC5")

# load example dataset
data(food_score)

# Compute probability based on a comparison using the English-translated food names
preds <- c5_one_language(food_score,  'ENG_SCORE', 'EDIFF')


# Compute probability based on a comparison using the original food names
# this model is trained for the following languages: English, Dutch, Danish, and a modest subset for Greek, Spanish and Bulgarian.  
preds <- c5_one_language(food_score,  'ENG_SCORE', 'EDIFF', c5_object = read_c50_ori())

```

## License and authors

This software uses the GPL v3 license, see [LICENSE](LICENSE).
Authors and copyright are provided in [DESCRIPTION](DESCRIPTION). 

Big thanks to [Hélène Ruffieux](https://github.com/hruffieux) and [Radu Popescu](https://github.com/radupopescu) for help with CI.
