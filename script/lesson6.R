# -- head -- #

library(tidyverse)
library(broom)
library(performance)

# -- read -- #

d4 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l5d4.tsv')
d5 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/l5d5.tsv')
housing = read_csv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/Housing.csv') 

# -- main -- #

# sjPlot

install.packages('sjPlot')
library(sjPlot)

# 1. factor

# factor + numeric

d4 %>% 
  ggplot(aes(wage, edu, colour = gender)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw()

lm1 = lm(wage ~ edu, data = d4)
lm2 = lm(wage ~ edu + gender, data = d4)

tidy(lm2, conf.int = T)
compare_performance(lm1,lm2, metrics = 'common')
anova(lm1,lm2)

plot_model(lm2, 'est')
plot_model(lm2, 'pred')
plot_model(lm2, 'pred', terms = 'edu')
plot_model(lm2, 'pred', terms = c('edu','gender'))

# factor * numeric

# look at d5
# what are x? what is y?
# plot y ~ x1 + x2
# fit a linear model
# what is a (the intercept)? what are b? what are their confidence intervals?

lm3 = lm(wage ~ edu + gender, data = d5)
lm4 = lm(wage ~ edu * gender, data = d5)

tidy(lm4, conf.int = T)
compare_performance(lm3,lm4, metrics = 'common')
anova(lm3,lm4)

# HOUSING

summary(housing)
glimpse(housing)

lm5 = lm(price ~ area + bedrooms + bathrooms + guestroom + basement + hotwaterheating + airconditioning + parking + furnishingstatus, data = housing)
lm6 = lm(price ~ bedrooms + bathrooms + guestroom + basement + hotwaterheating + airconditioning + parking + furnishingstatus, data = housing)

tidy(lm5, conf.int = T)
check_model(lm5)
plot_model(lm5, 'est')
plot_model(lm5, 'pred', terms = c('area','furnishingstatus'))
compare_performance(lm5,lm6, metrics = 'common')

# airconditioning
# hotwaterheating
# bathrooms
# bedrooms
