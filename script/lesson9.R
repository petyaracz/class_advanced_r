install.packages('lme4')
install.packages('broom.mixed')

library(tidyverse)
library(broom.mixed)
library(performance)
library(sjPlot)
library(psych)
library(janitor)

# load d
d = read_tsv('https://raw.githubusercontent.com/petyaracz/class_advanced_r/main/dat/lesson9.tsv')
# d
d
# plot resp.rt ~ word_familiarity
d %>% 
  ggplot(aes(x = word_familiarity, y = resp.rt)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  theme_bw()
# plot resp.rt ~ scaled_word_familiarity
d %>% 
  ggplot(aes(x = scaled_word_familiarity, y = resp.rt)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  theme_bw()
# look at a couple participants
couple_participants = d %>% 
  distinct(participant) %>% 
  sample_n(25) %>% 
  pull()
d %>% 
  filter(participant %in% couple_participants) %>% 
  ggplot(aes(x = scaled_word_familiarity, y = resp.rt, colour = participant)) +
  geom_smooth(method = 'lm') +
  guides(colour = FALSE) +
  theme_bw()
# fit a model
lm1 = lm(resp.rt ~ scaled_word_familiarity, data = d)
tidy(lm1, conf.int = T)
# aggregate data
dw = d %>% 
  group_by(word,scaled_word_familiarity) %>%
  summarise(mean_rt = mean(resp.rt))
# fit a second model on the aggregated data
lm2 = lm(mean_rt ~ scaled_word_familiarity, data = dw)
tidy(lm2, conf.int = T)
# plot resp.rt ~ participant_age
d %>% 
  ggplot(aes(x = scaled_age, y = resp.rt)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  theme_bw()
# plot resp.rt ~ scaled_age + scaled_word_familiarity
d %>% 
  mutate(ntile_age = as.factor(ntile(scaled_age,4))) %>% 
  ggplot(aes(x = scaled_word_familiarity, y = resp.rt, colour = ntile_age)) +
  # geom_point() +
  geom_smooth(method = 'lm') +
  theme_bw()

# fit a model
lm3 = lm(resp.rt ~ scaled_age, data = d)
tidy(lm3, conf.int = T)
# aggregate data
dp = d %>% 
  group_by(participant,scaled_age) %>%
  summarise(mean_rt = mean(resp.rt))
# fit a second model on the aggregated data
lm4 = lm(mean_rt ~ scaled_age, data = dp)
tidy(lm4, conf.int = T)

# age + vocabulary size
lm5 = lm(resp.rt ~ scaled_age + scaled_vocabulary_size, data = d)
lm6 = lm(resp.rt ~ scaled_age * scaled_vocabulary_size, data = d)
plot(compare_performance(lm5,lm6))
tidy(lm6, conf.int = T)

glm1 = lmer(resp.rt ~ scaled_age + scaled_vocabulary_size + (1|participant), data = d)
glm2 = lmer(resp.rt ~ scaled_age * scaled_vocabulary_size + (1|participant), data = d)
plot(compare_performance(glm1,glm2))
tidy(glm2, conf.int = T)

ranef(glm1)

glm3 = lmer(resp.rt ~ scaled_age + scaled_vocabulary_size + (1|participant) + (1|word), data = d)
plot(compare_performance(glm1,glm3))

ranef(glm3)$word
ranef(glm3)$participant
