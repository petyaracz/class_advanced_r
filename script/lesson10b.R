# -- header -- #

install.packages('maps')

library(tidyverse)
library(lme4)
library(broom.mixed)
library(performance)
library(sjPlot)
library(maps)

world = map_data("world")
tidy2 = partial(tidy, conf.int = T)

# -- read -- #

d1 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/anthropology1.tsv')
d2 = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/anthropology2.tsv')

# -- gods -- #

glimpse(d1)

## visuals

ggplot() +
  geom_polygon(data = world, aes(x=long, y = lat, group = group), fill = "lightgrey") + 
  coord_fixed(1.3) +
  geom_point(data = d1, aes(x = Long, y = Lat, colour = as.factor(moral_gods))) +
  scale_colour_viridis_d() +
  theme_bw()

ggplot() +
  geom_polygon(data = world, aes(x=long, y = lat, group = group), fill = "lightgrey") + 
  coord_fixed(1.3) +
  geom_point(data = d1, aes(x = Long, y = Lat, colour = as.factor(social_complexity))) +
  scale_colour_viridis_d() +
  theme_bw()

ggplot() +
  geom_polygon(data = world, aes(x=long, y = lat, group = group), fill = "lightgrey") + 
  coord_fixed(1.3) +
  geom_point(data = d1, aes(x = Long, y = Lat, colour = subsistence)) +
  scale_colour_viridis_d() +
  theme_bw()

d1 |> 
  ggplot(aes(social_complexity,moral_gods)) +
  geom_point()

d1 |> 
  ggplot(aes(as.factor(social_complexity),fill = as.factor(moral_gods))) +
  geom_bar(position = position_dodge())

d1 |> 
  ggplot(aes(as.factor(social_complexity),fill = as.factor(moral_gods))) +
  geom_bar(position = position_dodge()) +
  coord_flip()

d1 |> 
  ggplot(aes(as.factor(subsistence),fill = as.factor(moral_gods))) +
  geom_bar(position = position_dodge()) +
  coord_flip()

d1 |> 
  ggplot(aes(as.factor(social_complexity),fill = as.factor(moral_gods))) +
  geom_bar(position = position_dodge()) +
  coord_flip() +
  facet_wrap( ~ region)

d1 |> 
  ggplot(aes(as.factor(social_complexity), fill = subsistence)) +
  geom_bar(position = position_dodge()) +
  coord_flip()


d1 |> 
  ggplot(aes(subsistence, fill = as.factor(social_complexity))) +
  geom_bar(position = position_dodge()) +
  coord_flip()

## models

lm1 = lm(moral_gods ~ social_complexity + subsistence, data = d1)
lm2 = lmer(moral_gods ~ social_complexity + subsistence + (1|region), data = d1)
lm3 = lmer(moral_gods ~ social_complexity + subsistence + (1 + social_complexity|region), data = d1)
lm4 = lmer(moral_gods ~ social_complexity + subsistence + (1 + subsistence|region), data = d1)
lm5 = lmer(moral_gods ~ social_complexity + subsistence + (1 + social_complexity + subsistence|region), data = d1)

## evaluation

plot(compare_performance(lm1,lm2,lm3))
anova(lm2,lm3)
tidy2(lm2)

plot_model(lm1, 'pred', terms = 'social_complexity')
plot_model(lm2, 'pred', terms = 'social_complexity')
plot_model(lm3, 'pred', terms = 'social_complexity')
plot_model(lm1, 'pred', terms = 'subsistence')
plot_model(lm2, 'pred', terms = 'subsistence')
plot_model(lm3, 'pred', terms = 'subsistence')

# -- grammar -- #

glimpse(d2)
