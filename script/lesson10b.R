library(tidyverse)
library(lme4)
library(broom.mixed)
library(performance)
library(sjPlot)

d1 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/anthropology1.tsv')
d2 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/anthropology2.tsv')
