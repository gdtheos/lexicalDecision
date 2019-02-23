library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
model <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
		+ orthoLength + OLD20 + syllables + baseFreq + (1|subject),
            data = sample_n(morphoData, 10000), family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 200, iter = 1000, chains = 4, cores=4)
saveRDS(model, file="fullDecomposition.RDS")
