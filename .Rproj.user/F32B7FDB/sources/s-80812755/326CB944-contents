# charge useful packages 
source("./utils/charge_packages.R")

# Load data 
predictors <- read.csv("./data/predictors.csv", header = TRUE, sep =";", row.names = 1)

vegetation <- read.csv("./data/vegetation.csv", header = TRUE, sep =";", row.names = 1)

fauna <- read.csv("./data/fauna.csv", header = TRUE, sep =";", row.names = 1)

ab.plants <- read.csv("./data/abundance_vasc_plants.csv", header = TRUE, sep =";", row.names = 1) # single species are already removed in the data set

ab.grasshoppers <- read.csv("./data/abundance_grasshoppers.csv", header = TRUE, sep =",", row.names = 1) # single species are already removed in the data set

# select responses = normal distribution 
dvList.gaussian.veg <- names(vegetation)[c(1:5)]
dvList.gaussian.fauna <- names(fauna)[c(1:4)]
# select responses = proportion data
dvList.binomial.veg <- names(vegetation)[c(6:8)]
dvList.binomial.fauna <- names(fauna)[5:6]
# select responses = count data
dvList.poisson.fauna <- names(fauna)[7]
# log transform plant and grasshoppers abundance data
ab.plants.log <- log1p (ab.plants)
ab.grasshoppers.log <- log1p (ab.grasshoppers)
# set variable of rooting groups as factor
group_old <- as.factor(predictors$Group_rooting_old)

# check predictor variables for non-collinearity prior to analysis
source("./scripts/check_non_collinearity.R")

# determine the most efficient predictor of relationships between wild boar rooting or frequency and response patterns
# in plants
source("./selection_variables_vegetation.R")

# in grasshoppers and sand lizards
source("./selection_variables_fauna.R")

# Run GLMMs on vegetation data
source("./GLMMs_vegetation.R")

# Run GLMMs on fauna data (grasshoppers and lizard)
source("./GLMMs_vegetation.R")

# Plot GLMMs results 
source("./plot_GLMMs_results.R")

# run NMDS on plant species data
source("./NMDS_vegetation.R")

# run NMDS, RDA and SIMPER analysis on plant species data
source("./NMDS_RDA_SIMPER_grasshoppers.R")
