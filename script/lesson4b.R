# -- head -- #

set.seed(1337)

install.packages('sjPlot')

library(tidyverse)
library(broom)
library(performance)
library(sjPlot)

# -- read -- #

d1 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d1b.tsv')
d2 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d2b.tsv')
d3 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d3b.tsv')
d4 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d4b.tsv')
d5 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d5b.tsv')
d6 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/refs/heads/main/dat/l4d6b.tsv')

# -- ex1 -- #

# form groups, 
# visualise data,
# plot_model(name_of_model, 'pred')
# fit a model on d,
# check model

# -- glm -- #


# -- ex2 -- #

