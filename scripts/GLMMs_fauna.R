attach(fauna)

#### computes GLMMs (Family Gaussian) to grasshopper species richness and diversity indices

models.gaussian.fauna <- lapply(dvList.gaussian.fauna, function(x) 
{
  lmer(substitute(i ~ scale(Fresh_rooting) + 
                    scale(Old_rooting) + 
                    scale(1|Cover_herb) + 
                    scale(1|Cover_litter) + 
                    scale(1|Height_herbs), 
                  list(i = as.name(x))), 
       data = fauna)
})

# List summaries gaussians GLMMs 
summary.models.gaussian.fauna <- lapply(models.gaussian.fauna, function(x) 
{
  summary(x)
})

# List R2 gaussians GLMMs 
R2_models.gaussian.fauna <- lapply(models.gaussian.fauna, function(x) 
{
  rsq(x)
})

### apply GLMMs (family binomial) to relative abundance (proportion data)

models.binomial.fauna <- lapply(dvList.binomial.fauna, function(x) 
{
  glmer.nb(substitute(i ~ scale(Fresh_rooting)+ 
                        scale(Old_rooting)+
                        scale(1|Cover_herb) + 
                        scale(1|Cover_litter) + 
                        scale(1|Height_herbs),
                      list(i = as.name(x))), 
           data = fauna)
})

# List summaries neg- binomial GLMMs 
summary.models.binomial.fauna <- lapply(models.binomial.fauna, function(x) 
{
  summary(x)
})

# List R2 binomial GLMMs 
R2_models.binomial.fauna <- lapply(models.binomial.fauna, function(x) 
{
  rsq(x)
})

### apply GLMM to lizards count data (family poisson)

models.poisson.fauna <-  glmer((Summed_Abundances_Lizard) ~ 
                                 scale(Fresh_rooting)+ 
                                 scale(Old_rooting)+
                                 scale(1|Cover_herb) + 
                                 scale(1|Cover_litter) + 
                                 scale(1|Height_herbs), 
                               family="poisson",
                               data = fauna)

# Summary GLMM Poisson
summary.models.poisson.fauna <- summary(model.poisson.fauna)

# R2 GLMM Poisson
R2_models.poisson.fauna <- rsq(model.poisson.fauna)

detach(fauna)
