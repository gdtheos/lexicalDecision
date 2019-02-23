library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
model <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
		+ orthoLength + OLD20 + syllables +  
		+ (orthoLength + OLD20 + syllables + 1|subject),
            data = morphoData, family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 1000, iter = 2000, chains = 4,
            control = list(adapt_delta = 0.95))
saveRDS(model, file="baseline.RDS")
logLikModel <- log_lik(model)
looModel <- loo(logLikeModel)
looModel
