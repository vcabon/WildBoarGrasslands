### run NMDS on plant abundance data
nmds.veg <- metaMDS(ab.plants.log, distance = "bray", k = 2)

# run PERMANOVA: model response of species assemblages to predictors.variables 
adonis2(ab.plants.log ~ predictors$Old_rooting + 
          predictors$Fresh_rooting + 
          predictors$Cover_herb + 
          predictors$Cover_litter + 
          predictors$Height_herbs )

# select significant environment predictors 
ef <- envfit(nmds.veg, predictors[, c(5,6)])

# Export NMDS vegetation plot
png("./exports/plot_NMDS_vegetation.png", width = 800, height = 600)
ordiplot(nmds.veg, type = "none", choices = c(1,2)) 
colvec <- c("darkturquoise", "darkblue")
ordihull(nmds.veg,groups=group_old,draw="polygon",col= colvec, label=F)
legend("topright", legend=levels(group_old), bty="n", col=colvec, pch=19)
plot(ef, col="black", seg.lty = "dashed")
dev.off()
