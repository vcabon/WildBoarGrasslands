old_rooting <- vegetation$Old_rooting/100
fresh_rooting <- vegetation$Fresh_rooting/100

pA <- ggplot(vegetation, aes_string(x =old_rooting , y =  vegetation$Div_simpson)) + ggtitle("Vascular plants \na)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold")) 
pA <- pA+labs(x="Proportion of old rooting", y= "Simpson Diversity Index")

pB <- ggplot(fauna, aes_string(x = old_rooting, y = fauna$Summed_Abundances_Lizard)) + ggtitle("Sand lizard \nb)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pB <- pB+labs(x="Proportion of old rooting", y= "Abundance sand lizard")

pC <- ggplot(fauna, aes_string(x = fresh_rooting, y = fauna$div_simson)) + ggtitle("Grasshoppers \nc)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pC <- pC+labs(x="Proportion of fresh rooting", y= "Simpson Diversity Index")

pD <- ggplot(fauna, aes_string(x = fresh_rooting, y = fauna$sp_richness)) + ggtitle("\nd)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pD <- pD+labs(x="Proportion of fresh rooting", y= "Species richness")

pE <- ggplot(fauna, aes_string(x = old_rooting, y = fauna$div_simson)) + ggtitle("e)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pE <- pE+labs(x="Proportion of old rooting", y= "Simpson Diversity Index")

pF <- ggplot(fauna, aes_string(x = old_rooting, y = fauna$sp_richness)) + ggtitle("f)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pF <- pF+labs(x="Proportion of old rooting", y= "Species richness")

pG <- ggplot(fauna, aes_string(x = old_rooting, y = fauna$Tr_rasen_sp_richness)) + ggtitle("g)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pG <- pG+labs(x="Proportion of old rooting", y= "Number of dry grassland specialists")

pH <- ggplot(fauna, aes_string(x = old_rooting, y = fauna$Rl_sp_richness)) + ggtitle("h)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + geom_point() +  theme(plot.title = element_text(face = "bold"))
pH <- pH+labs(x="Proportion of old rooting", y= "Number of Red List species")

png("./exports/plots_GLMMs.png", width = 500, height = 800)
multiplot(pA+ theme(plot.title = element_text(size=9)), 
          pC+ theme(plot.title = element_text(size=9)), 
          pE+ theme(plot.title = element_text(size=9)), 
          pG+ theme(plot.title = element_text(size=9)), 
          pB+ theme(plot.title = element_text(size=9)), 
          pD+ theme(plot.title = element_text(size=9)),
          pF+ theme(plot.title = element_text(size=9)),
          pH+ theme(plot.title = element_text(size=9)), cols=2) 
dev.off()
