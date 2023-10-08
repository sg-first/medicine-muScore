library(muStat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')

print(summary(lm(oldScore~NL$CCL17+NL$CCL18+NL$CCL22+NL$CCL27+NL$`IFN-γ`+NL$IL13+NL$IL18+
                   NL$IL19+NL$IL31+NL$IL33+NL$IL4+NL$MMP12)))
print(summary(lm(oldScore~LS$CCL17+LS$CCL18+LS$CCL22+LS$CCL27+LS$`IFN-γ`+LS$IL13+LS$IL18+
                   LS$IL19+LS$IL31+LS$IL33+LS$IL4+LS$MMP12)))
print(summary(lm(oldScore~xueqing$CCL17+xueqing$CCL18+xueqing$CCL22+xueqing$CCL27+xueqing$`IFN-γ`+xueqing$IL13+
                   xueqing$IL18+xueqing$IL19+xueqing$IL31+xueqing$IL33+xueqing$IL4+xueqing$MMP12)))

# NL、LS分开计算mu-score
NLSign = data.frame(NL$IL13, NL$IL33)
LSSign = data.frame(LS$CCL22, LS$`IFN-γ`)
NLScore = mu.score(NLSign)
LSScore = mu.score(LSSign)

# scoreDf = data.frame(oldScore, NLScore, LSScore, xueqingScore)
# write.csv(scoreDf, file = 'result.csv')

fit = lm(oldScore~LSScore)
print(summary(fit))
plot(oldScore, LSScore)
abline(fit)

# NL、SL合并计算mu-score
sign = data.frame(NL$IL13, NL$IL33, LS$CCL22, LS$`IFN-γ`)
score = mu.score(sign)
fit = lm(oldScore~score)
print(summary(fit))
plot(oldScore, score)
abline(fit)