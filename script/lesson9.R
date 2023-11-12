# -- starting questions -- #

# what is the effect of vocabulary size and word familiarity?
# is there an interaction?
# what is the structure of the data?
# what is the result of clustering?

# -- setup -- #

# install the lme4 and broom.mixed packages

# load the tidyverse, broom.mixed, performance, sjPlot, psych, janitor, and lme4 libraries

# load table from 'https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/lesson9.tsv' and assign to d

# take d, scale word familiarity and vocabulary size, assign to d

# -- eda: word familiarity -- #

# take d, plot resp.rt ~ word_familiarity with points and a line

# take d, plot resp.rt ~ scaled_word_familiarity with points and a line

# -- eda: word familiarity and vocabulary size -- #

# take d, sample 10 participants, filter data for these ten participants, plot resp.rt ~ scaled_word_familiarity with points and a line

# not quite

# take d, sample 10 participant ids, assign to ids

# take d, filter for participant ids in ids, plot resp.rt ~ scaled_word_familiarity with points and a line

# repeat the plot with facet wraps for participants

# -- modelling: word familiarity and vocabulary size -- #

# fit a linear model on d predicting resp.rt from scaled_word_familiarity, assign to lm1

# take lm1, get a tidy table of coefficient estimates with confidence intervals

# take d, group by word and scaled word familiarity, summarise mean resp.rt as mean_rt, assign table to dw

# fit a second model on the aggregated data, assign to lm2

# get a tidy table of coefficient estimates with confidence intervals

# take d, plot resp.rt ~ scaled participant vocabulary size with points and a line

# take d, bin scaled vocabulary size into four bins, plot resp.rt ~ scaled word familiarity with binned participant vocabulary size as colour, with points and a line

# repeat plot but remove points

# fit a linear model on d prediting resp.rt from scaled vocabulary size, assign to lm3

# get a tidy table of coefficient estimates with confidence intervals

# take d, group by participant and scaled vocabulary size, summarise mean resp.rt as mean_rt, assign table to dp

# fit a second model on the aggregated data

# get a tidy table of coefficient estimates with confidence intervals

# fit a linear model on d prediting resp.rt from scaled vocabulary size and scaled word familiarity

# fit a linear model with an interaction

# use compare performance to compare lm5 and lm6 and plot the result

# get a tidy table of coefficient estimates with confidence intervals for lm6

# -- hierarchical modelling -- #

# fit a hierarchical model on d predicting resp.rt from scaled and and scaled vocabulary size with a participant random intercept

# fit the same model with an interaction

# compare performance of the two models and plot it

# get a tidy table of coefficient estimates with confidence intervals for lm7 and lm8

# get random effects from lm7 and plot them

# fit a hierarchical model on d predicting resp.rt from scaled and and scaled vocabulary size with a participant and a word random intercept

# compare performance of the two models and plot it

# plot random effects for lm9