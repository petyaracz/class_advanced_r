# -- head -- #

install.packages('psych')

library(tidyverse)
library(broom)
library(performance)
library(sjPlot)
library(psych)

# -- read -- #

d = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/szeged.tsv')

# -- main -- #

# we look at the data
glimpse(d)
# daily averages for daylight hours between:
range(d$ymd)

# correlations
d %>% 
  select(apparent_temperature,temperature) %>% 
  pairs.panels( 
             method = "pearson", # correlation method
             density = TRUE,  # show density plots
             lm = T
  )
# + humidity
d %>% 
  select(apparent_temperature,temperature,humidity) %>% 
  pairs.panels( 
             method = "pearson", # correlation method
             density = TRUE,  # show density plots
             lm = T
)
# + wind speed
d %>% 
  select(apparent_temperature,temperature,humidity,wind_speed) %>% 
  pairs.panels( 
    method = "pearson", # correlation method
    density = TRUE,  # show density plots
    lm = T
  )
# + pressure
d %>% 
  select(apparent_temperature,temperature,humidity,wind_speed,pressure) %>% 
  pairs.panels( 
    method = "pearson", # correlation method
    density = TRUE,  # show density plots
    lm = T
  )
# + date
d %>% 
  select(apparent_temperature,temperature,humidity,wind_speed,pressure,ymd) %>% 
  pairs.panels( 
    method = "pearson", # correlation method
    density = TRUE,  # show density plots
    lm = T
  )

# linear models

# test for:

# apparent_temperature ~ temperature + wind speed
# apparent_temperature ~ humidity + pressure
# apparent_temperature ~ temperature + humidity
# apparent_temperature ~ temperature + residual humidity :o

# checklist:
# 1. coefficient estimates (tidy, plot('est'))
# 2. compare performance (plot)
# 3. test performance
# 4. check model

