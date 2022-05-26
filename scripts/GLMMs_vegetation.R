attach(vegetation)

#### computes GLMMs (Family Gaussian) to plant species richness and diversity indices

models.gaussian.veg <- lapply(dvList.gaussian.veg, function(x) 
{
  lmer(substitute(i ~ scale(Fresh_rooting) + 
                    scale(Old_rooting) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = vegetation)
})

# List summaries gaussians GLMMs 
summary.models.gaussian.veg <- lapply(models.gaussian.veg, function(x) 
{
  summary(x)
})

# List R2 gaussians GLMMs 
R2_models.gaussian.veg <- lapply(models.gaussian.veg, function(x) 
{
  rsq(x)
})


### apply GLMMs (family neg- binomial) to relative abundance (proportion data)

models.binomial.veg <- lapply(dvList.binomial.veg, function(x) 
{
  glmer.nb(substitute(i ~ scale(Fresh_rooting)+ 
                        scale(Old_rooting)+
                        scale(1|Cover_herb) +
                        scale(1|Cover_litter) +
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = vegetation)
})

# List summaries neg- binomial GLMMs 
summary.models.binomial.veg <- lapply(models.binomial.veg, function(x) 
{
  summary(x)
})

# List R2 binomial GLMMs 
R2_models.binomial.veg <- lapply(models.binomial.veg, function(x) 
{
  rsq(x)
})

detach(vegetation)