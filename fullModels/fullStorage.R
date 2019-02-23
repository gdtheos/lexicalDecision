library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
model <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
		+ orthoLength + OLD20 + syllables + wholeFreq +  
		+ (orthoLength + OLD20 + syllables + wholeFreq + 1|subject) + (orthoLength + OLD20 + syllables + wholeFreq + 1|orthography),
            data = morphoData, family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 200, iter = 400, chains = 4,
            control = list(adapt_delta = 0.95))
saveRDS(model, file="elpFullStorageModel.RDS")
logLikModel <- log_lik(model)
looModel <- loo(logLikeModel)
looModel
