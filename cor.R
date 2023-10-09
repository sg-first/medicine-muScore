library(muStat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')

corTest = function(oldScore, data)
{
  corDf = data.frame(oldScore, data$CCL17, data$CCL18, data$CCL22, data$CCL27, data$`IFN-γ`, data$IL13, data$IL18, 
                     data$IL19, data$IL31, data$IL33, data$IL4, data$MMP12)
  print(cor(corDf))
  print(cor.test(oldScore, data$CCL17))
  print(cor.test(oldScore, data$CCL18))
  print(cor.test(oldScore, data$CCL22))
  print(cor.test(oldScore, data$CCL27))
  print(cor.test(oldScore, data$`IFN-γ`))
  print(cor.test(oldScore, data$IL13))
  print(cor.test(oldScore, data$IL18))
  print(cor.test(oldScore, data$IL19))
  print(cor.test(oldScore, data$IL31))
  print(cor.test(oldScore, data$IL33))
  print(cor.test(oldScore, data$IL4))
  print(cor.test(oldScore, data$MMP12))
}

corTest(oldScore, xueqing)