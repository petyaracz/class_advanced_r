install.packages('glmmTMB')

library(tidyverse)
library(broom.mixed)
library(performance)
library(sjPlot)
library(lme4)
library(glmmTMB)

d = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l10d1.tsv')

# structure of d
d

# effects of analogy and rules on regularity
d %>% 
  ggplot(aes(analogy,regular)) +
  geom_jitter(width = 0, height = .1) +
  geom_smooth(method = 'glm', method.args = list(family = 'binomial'), se = FALSE) +
  scale_y_continuous(breaks = c(0,1))

# per subject?

# "ordinary" GLM?

# "ordinary" GLM with participant factor?

# "ordinary" GLM with participant interaction?

# hierarchical GLM with participant grouping factor (random intercept)?

# hierarchical GLM with participant grouping factor (random intercept) and random slope?

# gods?
