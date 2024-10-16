# -- head -- #

library(tidyverse)
library(broom)
library(performance)
library(sjPlot)

# -- main -- #

# 1. factor

# read in dat/l5d1.tsv
d1 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l5d1.tsv')

# what is x? what is y?
# plot y ~ x
# fit a linear model
# what is a (the intercept)? what is b? what are their confidence intervals?
# is the model healthy?

# 2. factor 2

# read in dat/l5d2.tsv
# what is x? what is y?
# plot y ~ x
# fit a linear model
# what is a (the intercept)? what is b? what are their confidence intervals?

# factor levels:
d2b = d2 %>% 
  mutate(
    nem2 = fct_relevel(nem, 'nő')
  )

# 3. factor 3

# read in dat/l5d3.tsv
# what are x? what is y?
# plot y ~ x
# fit a linear model
# what is a (the intercept)? what are b? what are their confidence intervals?

d3b = d3 %>% 
  mutate(
    high_school2 = fct_reorder(high_school, maths)
  )
d3c = d3 %>% 
  mutate(
    high_school3 = fct_reorder(high_school, -maths)
  )

# 4. factor + numeric

# read in dat/l5d4.tsv
# what are x? what is y?
# plot y ~ x
# fit a linear model
# what is a (the intercept)? what are b? what are their confidence intervals?

plot_model(m1, 'est')
compare_performance(m1,m2,m3)
compare_performance(m1,m2,m3, metrics = 'common')
plot(compare_performance(m1,m2,m3, metrics = 'common'))

# 5. factor * numeric

# read in dat/l5d5.tsv
# what are x? what is y?
# plot y ~ x
# fit a linear model
# what is a (the intercept)? what are b? what are their confidence intervals?

plot_model(m1, terms = c('pred1','pred2'))
plot_model(m1, terms = c('pred2','pred1'))
anova(m1,m2)
test_performance(m1,m2)
