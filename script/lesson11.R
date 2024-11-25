library(tidyverse)
library(broom.mixed)
library(performance)
library(sjPlot)
library(lme4)

d = read_tsv("https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l11d1.tsv")

d

# drop NA
d = d %>% drop_na()

# boxplot rt ~ stimulus_congruent
ggplot(d, aes(x = stimulus_congruent, y = rt)) +
  geom_boxplot()

# boxplot rt ~ response_correct
ggplot(d, aes(x = response_correct, y = rt)) +
  geom_boxplot()

# boxplot rt ~ artist
ggplot(d, aes(x = artist, y = rt)) +
  geom_boxplot()

# boxplot rt ~ stimulus_congruent x artist
ggplot(d, aes(x = stimulus_congruent, y = rt, color = artist)) +
  geom_boxplot()

# mik lehetnek fixed effektek?

# mik lehetnek grouping faktorok?

# random effekt struktura


