library(muStat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')

NL = data.frame(NL$CCL17, NL$CCL18, NL$CCL22, NL$CCL27, NL$`IFN-γ`, NL$IL13, NL$IL18, 
                NL$IL19, NL$IL31, NL$IL33, NL$IL4, NL$MMP12)
LS = data.frame(LS$CCL17, LS$CCL18, LS$CCL22, LS$CCL27, LS$`IFN-γ`, LS$IL13, LS$IL18, 
                LS$IL19, LS$IL31, LS$IL33, LS$IL4, LS$MMP12)
xueqing = data.frame(xueqing$CCL17, xueqing$CCL18, xueqing$CCL22, xueqing$CCL27, xueqing$`IFN-γ`, xueqing$IL13, xueqing$IL18, 
                     xueqing$IL19, xueqing$IL31, xueqing$IL33, xueqing$IL4, xueqing$MMP12)

NLScore = mu.score(NL)
LSScore = mu.score(LS)
xueqingScore = mu.score(xueqing)

scoreDf = data.frame(oldScore, NLScore, LSScore, xueqingScore)
print(cor(scoreDf))
write.csv(scoreDf, file = 'result.csv')