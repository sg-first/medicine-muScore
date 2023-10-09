library(muStat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')

NLSign = data.frame(NL$IL33)
LSSign = data.frame(LS$`IFN-γ`)
xueqingSign = data.frame(xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, xueqing$`IFN-γ`, 
                         xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
NLScore = mu.score(NLSign)
LSScore = mu.score(LSSign)
xueqingScore = mu.score(xueqingSign)

NLLSxueqingSign = data.frame(NL$IL33, LS$`IFN-γ`, xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, 
                              xueqing$`IFN-γ`, xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
NLLSxueqingScore = mu.score(NLLSxueqingSign)

NLLSSign = data.frame(NL$IL33, xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, 
                       xueqing$`IFN-γ`, xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
NLLSScore = mu.score(NLLSSign)

NLxueqingSign = data.frame(NL$IL33, xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, 
                           xueqing$`IFN-γ`, xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
NLxueqingScore = mu.score(NLxueqingSign)

LSxueqingSign = data.frame(LS$`IFN-γ`, xueqing$CCL17, xueqing$CCL18, xueqing$CCL27, 
                           xueqing$`IFN-γ`, xueqing$IL13, xueqing$IL18, xueqing$IL33, xueqing$IL4, xueqing$MMP12)
LSxueqingScore = mu.score(LSxueqingSign)

data = data.frame(NLScore, LSScore, xueqingScore, NLLSxueqingScore, NLLSScore, NLxueqingScore, LSxueqingScore)
write.csv(data, file = 'muScore.csv')
