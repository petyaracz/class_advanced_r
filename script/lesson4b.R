# -- head -- #

set.seed(1337)

install.packages('sjPlot')

library(tidyverse)
library(broom)
library(performance)
library(sjPlot)

# -- read -- #

d1 = read_tsv('dat/l4d1b.tsv')
d2 = read_tsv('dat/l4d2b.tsv')
d3 = read_tsv('dat/l4d3b.tsv')
d4 = read_tsv('dat/l4d4b.tsv')

# -- ex1 -- #

# form groups, 
# visualise data,
# plot_model(name_of_model, 'pred')
# fit a model on d,
# check model

# -- glm -- #


# -- ex2 -- #

