####Load data set grasshoppers-lizards
fauna_na_omit <- na.omit(fauna)
attach(fauna_na_omit)

#### GLMMs Family Gaussian grasshoppers-lizards

# compute GLMMs with "total traces" as predictor
models.gaussian.fauna.rooting <- lapply(dvList.gaussian.fauna, function(x) 
{
  lmer(substitute(i ~ scale(Total_rooting) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = fauna_na_omit)
})

# computes AIC values of Gaussian GLMMs fauna - predictor = Rooting
AIC.gaussian.fauna.rooting <- lapply(models.gaussian.fauna.rooting, function(x) 
{
  AIC(x)
})

# compute neg- binomial GLMMs with "wild boar frequency" as predictor
models.gaussian.fauna.freq <- lapply(dvList.gaussian.fauna, function(x) 
{
  lmer(substitute(i ~ scale(Freq_occurrence_wild_boar) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = fauna_na_omit)
})

# computes AIC values of Gaussian GLMMs fauna - predictor = wild boar frequency 
AIC.gaussian.fauna.frequency <- lapply(models.gaussian.fauna.freq, function(x) 
{
  AIC(x)
})

# compute neg- binomial GLMMs with "total traces" as predictor
models.binomial.fauna.rooting <- lapply(dvList.binomial.fauna, function(x) 
{
  glmer.nb(substitute(i ~ scale(Total_rooting)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = fauna_na_omit)
})

# computes AIC values of binomial GLMMs fauna - predictor = rooting
AIC.binomial.fauna.rooting <- lapply(models.binomial.fauna.rooting, function(x) 
{
  AIC(x)
})

# compute GLMMs with "wild boar frequency" as predictor
models.binomial.fauna.freq <- lapply(dvList.binomial.fauna, function(x) 
{
  glmer.nb(substitute(i ~ scale(Freq_occurrence_wild_boar)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = fauna_na_omit)
})

# summary neg- binomial GLMMs fauna - predictor = wild boar frequency
AIC.binomial.fauna.frequency <- lapply(models.binomial.fauna.freq, function(x) 
{
  AIC(x)
})

# compute neg- binomial GLMMs with "total traces" as predictor
models.poisson.fauna.rooting <- lapply(dvList.poisson.fauna, function(x) 
{
  glmer(substitute(i ~ scale(Total_rooting)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
                      family="poisson",
           data = fauna_na_omit)
})

# computes AIC values of binomial GLMMs fauna - predictor = rooting
AIC.poisson.fauna.rooting <- lapply(models.poisson.fauna.rooting, function(x) 
{
  AIC(x)
})

# compute GLMMs with "wild boar frequency" as predictor
models.poisson.fauna.freq <- lapply(dvList.poisson.fauna, function(x) 
{
  glmer.nb(substitute(i ~ scale(Freq_occurrence_wild_boar)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = fauna_na_omit)
})

# summary neg- binomial GLMMs fauna - predictor = wild boar frequency
AIC.poisson.fauna.frequency <- lapply(models.poisson.fauna.freq, function(x) 
{
  AIC(x)
})

# Fill AIC comparison data frame
AIC_comparison_gaussian = as.data.frame(dvList.gaussian.fauna)
names(AIC_comparison_gaussian)[1] <- "Response_fauna"
AIC_comparison_gaussian$AIC_freq = AIC.gaussian.fauna.frequency
AIC_comparison_gaussian$AIC_rooting = AIC.gaussian.fauna.rooting

AIC_comparison_binomial = as.data.frame(dvList.binomial.fauna)
names(AIC_comparison_binomial)[1] <- "Response_fauna"
AIC_comparison_binomial$AIC_freq = AIC.binomial.fauna.frequency
AIC_comparison_binomial$AIC_rooting = AIC.binomial.fauna.rooting

AIC_comparison_poisson = as.data.frame(dvList.poisson.fauna)
names(AIC_comparison_poisson)[1] <- "Response_fauna"
AIC_comparison_poisson$AIC_freq = AIC.poisson.fauna.frequency
AIC_comparison_poisson$AIC_rooting = AIC.poisson.fauna.rooting

AIC_comparison <- rbind(AIC_comparison_gaussian, AIC_comparison_binomial, AIC_comparison_poisson)
AIC_comparison <- apply(AIC_comparison,2,as.character)
write.csv(AIC_comparison, "./exports/AIC_comparison_fauna.csv")

detach(fauna_na_omit)

