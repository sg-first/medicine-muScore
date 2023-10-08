library(mustat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
oldScore = oldScore$Score
NL = read_excel("baseline.xlsx", sheet = 'NL')
LS = read_excel("baseline.xlsx", sheet = 'LS')
xueqing = read_excel("baseline.xlsx", sheet = '血清')