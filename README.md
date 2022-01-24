# Wild boars and urban grassland conservation

Author: Valentin Cabon, Collaborators: Miriam Bùi, Henning Kühne, Ingo Kowarik, Moritz von der Lippe, Sascha Buchholz

This repository provides R codes and data to reproduce the analysis described in the submitted manuscript "Wild boars and urban grassland conservation: positive or neutral relationships between soil disturbance and endangered animals and plants". The analysis aims to test if wild boar activities on urban dry grasslands are related to alterations in plant and animal communities, with a particular focus on endangered species, habitat specialists and non-native species. The dataset contains information about 22 study sites located in Berlin, Germany. 

# Data

The provided dataset "data/vegetation.csv" contains the investigated biodiversity indices related to vascular plants. Dataset "data/fauna.csv" contains biodiversity indices related to grasshoppers and sand lizards. Dataset "data/abundance_vasc_plants" contains abundance data of recorded vascular plant species (singletons were removed). Dataset "data/abundance_grasshoppers" contains abundance data of recorded grasshopper species (singletons were here removed as well). Finally, the dataset "data/predictors" contains the environment variables, ingluding measures of wild boar's activities, tested as predictors in the analysis.

# Run the scripts

Run the main script (scripts/main.R) will load the needed R-packages, import the data, run the models and export the figures used as illustrations in the manuscript. The figures in .PNG format are exported in the "exports/" folder.
