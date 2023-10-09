library(muStat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')

print(summary(lm(oldScore~NL$IL33)))
print(summary(lm(oldScore~LS$`IFN-γ`)))
print(summary(lm(oldScore~xueqing$CCL17+xueqing$CCL18+xueqing$CCL27+xueqing$`IFN-γ`+xueqing$IL13+
                   xueqing$IL18+xueqing$IL33+xueqing$IL4+xueqing$MMP12)))

# 单独计算mu-score
NLSign = data.frame(NL$IL33)
LSSign = data.frame(LS$`IFN-γ`)
xueqingSign = data.frame(xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, xueqing$`IFN-γ`, 
                         xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
NLScore = mu.score(NLSign)
LSScore = mu.score(LSSign)
xueqingScore = mu.score(xueqingSign)

# scoreDf = data.frame(oldScore, NLScore, LSScore, xueqingScore)
# write.csv(scoreDf, file = 'result.csv')

fit = lm(oldScore~LSScore)
print(summary(fit))
plot(LSScore, oldScore)
abline(fit)

# 合并计算mu-score
sign = data.frame(NL$IL33, LS$`IFN-γ`, xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, xueqing$`IFN-γ`, 
                  xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
score = mu.score(sign)
fit = lm(oldScore~score)
print(summary(fit))
plot(score, oldScore)
abline(fit)