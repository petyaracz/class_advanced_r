library(tidyverse)
library(broom.mixed)
library(performance)
library(sjPlot)
library(lme4)

d = read_tsv("~/Work/BME/HaladóRÓra/haladorrepo/dat/l11d1.tsv")

# hogy nez ki a d
# viz

# mod
fit1 = lm(rt ~ stimulus_congruent + response_correct + artist, data = d)
fit2 = lmer(rt ~ stimulus_congruent + response_correct + artist + (1|subject), data = d)
fit3 = lmer(rt ~ stimulus_congruent + response_correct + artist + (1|subject) + (1|word), data = d)
fit4 = lmer(rt ~ stimulus_congruent + response_correct + artist + (1|subject) + (1|word) + (1|ink), data = d)
fit5 = lmer(rt ~ stimulus_congruent + response_correct + artist + (1|word) + (1|ink), data = d)
fit6 = lmer(rt ~ stimulus_congruent + response_correct + artist + (1 + stimulus_congruent |subject), data = d)
fit7 = lmer(rt ~ stimulus_congruent * artist + response_correct + (1|subject), data = d)

# test

check_posterior_predictions(fit2)
check_normality(fit2)
check_autocorrelation(fit2)
check_collinearity(fit7)

# comp

test_likelihoodratio(fit1,fit2)
plot(compare_performance(fit2,fit7))