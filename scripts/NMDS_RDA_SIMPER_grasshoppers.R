# run NMDS on grasshopper abundance data
nmds.grasshoppers <- metaMDS(ab.grasshoppers.log, distance = "bray", k = 2)

# run PERMANOVA: model response of species assemblages to predictors.variables 
adonis2(ab.grasshoppers.log ~ predictors$Old_rooting + 
          predictors$Fresh_rooting  + 
          predictors$Cover_herb + 
          predictors$Cover_litter + 
          predictors$Height_herbs)

# select significant environment predictors 
ef <- envfit(nmds.grasshoppers, predictors[, c(3, 5)])

# Export NMDS grasshoppers plot
png("./exports/plot_NMDS_grasshoppers.png", width = 800, height = 600)
ordiplot(nmds.grasshoppers, type = "none", choices = c(1,2)) 
colvec <- c("orange", "purple")
ordihull(nmds.grasshoppers,groups=group_old,draw="polygon",col= colvec, label=F)
legend("topright", legend=levels(group_old), bty="n", col=colvec, pch=19)
plot(ef, col="black")
dev.off()

# compute partial-RDA considering rooting as predictor and other significant variable (cover_herbs) as co-variable
rooting <- predictors$Old_rooting
ordi_logtrans <- rda(ab.grasshoppers.log ~ rooting  + 
                      Condition(predictors$Cover_herb), 
                      data = predictors)

# Export Partial-RDA grasshoppers plot
png("./exports/plot_partialRDA_grasshoppers.png", width = 700, height = 600)
ordiplot(ordi_logtrans, display=c("sites", "bp"))
ordipointlabel(ordi_logtrans, display = 'species', pch= "+", cex = 0.8, scaling = 3, add = T)
anova (ordi_logtrans, permutations = 999)
dev.off()

# Compute indicator species analysis
indval.grasshoppers <- multipatt(ab.grasshoppers.log, group_old, func = "IndVal.g", control = how(nperm=999))
summary(indval.grasshoppers)
