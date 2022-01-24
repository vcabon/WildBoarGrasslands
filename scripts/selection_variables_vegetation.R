###Load data set vegetation
vegetation_na_omit <- na.omit(vegetation)
attach(vegetation_na_omit)

#### GLMMs Family Gaussian vegetation

# compute GLMMs with "total traces" as predictor
models.gaussian.veg.rooting <- lapply(dvList.gaussian.veg, function(x) 
{
  lmer(substitute(i ~ scale(Total_rooting) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = vegetation_na_omit)
})

# computes AIC values of Gaussian GLMMs vegetation - predictor = Rooting
AIC.gaussian.veg.rooting <- lapply(models.gaussian.veg.rooting, function(x) 
{
  AIC(x)
})

# compute neg- binomial GLMMs with "wild boar frequency" as predictor
models.gaussian.veg.freq <- lapply(dvList.gaussian.veg, function(x) 
{
  lmer(substitute(i ~ scale(Freq_occurrence_wild_boar) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = vegetation_na_omit)
})

# computes AIC values of Gaussian GLMMs vegetation - predictor = wild boar frequency 
AIC.gaussian.veg.frequency <- lapply(models.gaussian.veg.freq, function(x) 
{
  AIC(x)
})

# compute neg- binomial GLMMs with "total traces" as predictor
models.binomial.veg.rooting <- lapply(dvList.binomial.veg, function(x) 
{
  glmer.nb(substitute(i ~ scale(Total_rooting)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = vegetation_na_omit)
})

# computes AIC values of binomial GLMMs vegetation - predictor = rooting
AIC.binomial.veg.rooting <- lapply(models.binomial.veg.rooting, function(x) 
{
  AIC(x)
})

# compute GLMMs with "wild boar frequency" as predictor
models.binomial.veg.freq <- lapply(dvList.binomial.veg, function(x) 
{
  glmer.nb(substitute(i ~ scale(Freq_occurrence_wild_boar)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = vegetation_na_omit)
})

# summary neg- binomial GLMMs vegetation - predictor = wild boar frequency
AIC.binomial.veg.frequency <- lapply(models.binomial.veg.freq, function(x) 
{
  AIC(x)
})

# Fill AIC comparison data frame
AIC_comparison_gaussian = as.data.frame(dvList.gaussian.veg)
names(AIC_comparison_gaussian)[1] <- "Response_veg"
AIC_comparison_gaussian$AIC_freq = AIC.gaussian.veg.frequency
AIC_comparison_gaussian$AIC_rooting = AIC.gaussian.veg.rooting

AIC_comparison_binomial = as.data.frame(dvList.binomial.veg)
names(AIC_comparison_binomial)[1] <- "Response_veg"
AIC_comparison_binomial$AIC_freq = AIC.binomial.veg.frequency
AIC_comparison_binomial$AIC_rooting = AIC.binomial.veg.rooting

AIC_comparison <- rbind(AIC_comparison_gaussian, AIC_comparison_binomial)
AIC_comparison <- apply(AIC_comparison,2,as.character)
write.csv(AIC_comparison, "./exports/AIC_comparison_vegetation.csv")

detach(vegetation_na_omit)
