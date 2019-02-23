library(brms)
library(loo)
morphoData <- read.csv(file="ELPMorphoParsed.csv", header=TRUE, sep=",")
model <- brm(formula = log2(reactionTime) ~ trialNum + gender + education + suffixType 
		+ orthoLength + OLD20 + syllables + (10^wholeFreq*log2(10^wholeFreq))/(10^wholeFreq + 10^baseFreq)+(10^baseFreq*log2(10^baseFreq)/(10^wholeFreq + 10^baseFreq) + (1|subject),
            data = sample_n(morphoData, 10000), family = gaussian(),
            prior = set_prior("normal(0,5)", class = "b"),
            warmup = 200, iter = 1000, chains = 4, cores=4)
saveRDS(model, file="FG.RDS")
