# Test correlations predictor variables
cor.pearson <- rcorr(as.matrix(predictors[,c(1:7)]), type = "pearson")
cor.sperman <- rcorr(as.matrix(predictors[,c(1:7)]), type = "spearman")

test.distribution <- lapply(predictors, function(x) {shapiro.test(x)})

write.csv(cor.pearson$r, file = "./exports/correlations_predictor_pearson_r.csv")
write.csv(cor.pearson$P, file = "./exports/correlations_predictor_pearson_p.csv")
write.csv(cor.sperman$r, file = "./exports/correlations_predictor_spearman_r.csv")
write.csv(cor.sperman$P, file = "./exports/correlations_predictor_spearman_p.csv")
