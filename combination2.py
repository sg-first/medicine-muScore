import copy
import pandas as pd
import statsmodels.formula.api as smf
from factor_analyzer import FactorAnalyzer
import seaborn as sns

oldScore = pd.read_excel('baseline_combination.xlsx', sheet_name='评分信息')['Score']
NL = pd.read_excel('baseline_combination.xlsx', sheet_name='NL')
LS = pd.read_excel('baseline_combination.xlsx', sheet_name='LS')
xueqing = pd.read_excel('baseline_combination.xlsx', sheet_name='血清')

allCol = []
class col:
    def __init__(self, data, sheetName, colName):
        self.name = colName + '_' + sheetName
        self.data = data

def addCol(df, dfName):
    for colName, data in df.iteritems():
        allCol.append(col(data, dfName, colName))
addCol(NL, 'NL')
addCol(LS, 'LS')
addCol(xueqing, '血清')

def getTitle(colList:list):
    title = 'oldScore~'
    for c in colList:
        title += c.name + '+'
    return title[:-1]

def getData(colList:list):
    d = []
    columns = []
    for c in colList:
        d.append(c.data)
        columns.append(c.name)
    df = pd.DataFrame(d).T
    df.columns = columns
    return df

def calcMuScore(data):
    fa = FactorAnalyzer(n_factors=1, rotation=None)
    fa.fit(data)
    muScores = fa.transform(data)
    muScores = pd.DataFrame(muScores)
    muScores.columns = ['muScore']
    return muScores['muScore']

def getOlsData(x):
    d = [oldScore, x]
    columns = ['oldScore', x.name]
    df = pd.DataFrame(d).T
    df.columns = columns
    return df

def getFormula(columns):
    ret = columns[0] + '~'
    for i in range(1, len(columns)):
        ret += columns[i] + '+'
    return ret[:-1]

def drawPlot(model, olsData):
    par = model.params
    ax = olsData.plot(kind='scatter', x=olsData.columns[1], y=olsData.columns[0])
    x = olsData['muScore']
    print(x)
    ax.plot(x, par.const + par.Xvalue * x)
    sns.lmplot(x=olsData.columns[1], y=olsData.columns[0], data=olsData)

def regressiveAnalysis(colList:list):
    title = getTitle(colList)
    print('### ' + title)
    print('```')
    data = getData(colList)
    muScores = calcMuScore(data)
    olsData = getOlsData(muScores)
    model = smf.ols(getFormula(olsData.columns), olsData).fit()
    print(model.summary())
    print('```')
    drawPlot(model, olsData)

regressiveAnalysis(allCol)

def foreachCombination(allCol):
    def recu(startSub, nowSub, chooseList:list):
        if nowSub == startSub:  # 递归起点
            chooseList.append(startSub)
            recu(startSub, nowSub + 1, copy.copy(chooseList))
        elif nowSub == len(allCol):  # 递归终点
            colList = []
            for sub in chooseList:
                colList.append(allCol[sub])
            regressiveAnalysis(colList)
            return
        else:
            recu(startSub, nowSub + 1, copy.copy(chooseList))  # 不放当前的
            # 放当前的
            chooseList.append(nowSub)
            recu(startSub, nowSub + 1, copy.copy(chooseList))

    for i in range(len(allCol)):
        recu(i, i, [])

