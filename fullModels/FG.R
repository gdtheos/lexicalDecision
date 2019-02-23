library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
model <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
		+ orthoLength + OLD20 + syllables + (10^wholeFreq*log2(10^wholeFreq))/(10^wholeFreq + 10^baseFreq)+(10^baseFreq*log2(10^baseFreq)/(10^wholeFreq + 10^baseFreq)  
		+ (orthoLength + OLD20 + syllables + (10^wholeFreq*log2(10^wholeFreq))/(10^wholeFreq + 10^baseFreq) + (10^baseFreq*log2(10^baseFreq))/(10^wholeFreq + 10^baseFreq) + 1|subject),
            data = morphoData, family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 1000, iter = 2000, chains = 4,
            control = list(adapt_delta = 0.95))
saveRDS(model, file="fullDecomposition.RDS")
logLikModel <- log_lik(model)
looModel <- loo(logLikeModel)
looModel
