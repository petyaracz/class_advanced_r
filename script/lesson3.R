# CI
# R2, RMSE, AIC, BIC
# ppc, homogeneity/homoscedasticity, linearity, outliers
# collinearity...

# -- head -- #

setwd('~/Work/Adjunktus/HaladóRÓra/haladorrepo')

install.packages('broom')
install.packages('performance')

library(tidyverse)
library(broom) # !
library(performance) # !

# -- read -- #

d0 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d0.tsv')
d1 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d1.tsv')
d2 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d2.tsv')
d3 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d3.tsv')
d4 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d4.tsv')
d4 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l3d5.tsv')

# -- fun -- #

plotData = function(dat,x,y){
  dat %>% 
    ggplot(aes({{x}},{{y}})) +
    geom_point() +
    geom_smooth(method = lm) +
    theme_bw()
}

# -- wrangle -- #

## performance

plotData(d0,height_father,height_son)

lm0 = lm(height_son ~ height_father, data = d0)

lm0_coef = tidy(lm0, conf.int = T)
lm0_coef
lm0_stats = glance(lm0)
lm0_stats
lm0_perf = model_performance(lm0)
lm0_perf

## ppc

plotData(d1,height_father,height_son) 
  
lm1 = lm(height_son ~ height_father, data = d1)

tidy(lm1, conf.int = T)
glance(lm1)
check_model(lm1)

ggplot(d1, aes(height_father,height_son,colour = orig_father)) +
  geom_point() +
  theme_bw()

d1ind = d1 %>% 
  filter(orig_father == 'ind')

lm1_ind = lm(height_son ~ height_father, data = d1ind)
check_model(lm1_ind)

## homogeneity

plotData(d2,iq,income) 

lm2 = lm(income ~ iq, data = d2)

tidy(lm2, conf.int = T)
glance(lm2)
check_model(lm2)

## linearity

plotData(d3,size,weight) 

lm3 = lm(weight ~ size, data = d3)

tidy(lm3, conf.int = T)
glance(lm3)
check_model(lm3)

lm3_square = lm(weight ~ poly(size, degree = 2), data = sizes)
lm3_cube = lm(weight ~ poly(size, degree = 3), data = sizes)
check_model(lm3_cube)
compare_performance(lm3,lm3_square,lm3_cube)

## outliers

plotData(d4,sqm,price)

lm4 = lm(price ~ sqm, data = d4)

tidy(lm4, conf.int = T)
glance(lm4)
check_model(lm4)

# standard error
# mean absolute error
# top/bottom x observation

d4l = d4 %>% 
  mutate(
    median_sqm = median(sqm),
    mad_sqm = mad(sqm),
    upper_sqm = mad_sqm + 2.5 * median_sqm,
    lower_sqm = mad_sqm - 2.5 * median_sqm,
    median_price = median(price),
    mad_price = mad(price),
    upper_price = mad_price + 2.5 * median_price,
    lower_price = mad_price - 2.5 * median_price,
    keep = sqm < upper_sqm & price < upper_price
  )

d4l %>% 
  ggplot(aes(sqm,price,colour = keep)) +
  geom_point() +
  theme_bw()

d4r = d4l %>% 
  filter(keep)

lm4r = lm(price ~ sqm, data = d4r)

tidy(lm4r, conf.int = T)
glance(lm4r)
check_model(lm4r)

# minden egyszerre megy tonkre
# golem
