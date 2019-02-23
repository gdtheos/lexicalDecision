library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
trainingData <- morphoData[sample(nrow(morphoData), 10000), ]
baselineModel <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
					+ orthoLength + OLD20 + syllables + (1|subject),
            data = trainingData, family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 200, iter = 1000, chains = 4,
            control = list(adapt_delta = 0.95))
fullstorageModel <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
					+ orthoLength + OLD20 + syllables + wholeFreq + (1|subject),
            data = trainingData, family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 200, iter = 1000, chains = 4,
            control = list(adapt_delta = 0.95))
icmodels <- loo(baselineModel, fullstorageModel)
summary(icmodels)




