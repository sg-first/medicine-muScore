library(mustat)
library(readxl)

oldScore = read_excel("baseline.xlsx", sheet = '评分信息')
print(oldScore)