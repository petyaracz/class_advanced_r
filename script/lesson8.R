library(tidyverse)
library(glue)
library(broom)
library(performance)
library(sjPlot)
library(psych)

d = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/lesson8.tsv')
# d = read_tsv('~/Work/BME/HaladóRÓra/haladorrepo/dat/lesson8.tsv')

# use pairs.plot to look at data

# what are the possible models?

# what is the best model?
# does the best model meet the assumptions?
# why? why not?
# what is the best model that does meet the assumptions?
# what does this model predict?
