import copy
import pandas as pd
import statsmodels.formula.api as smf

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
    d = [oldScore]
    columns = ['oldScore']
    for c in colList:
        d.append(c.data)
        columns.append(c.name)
    df = pd.DataFrame(d).T
    df.columns = columns
    return df

def getFormula(columns):
    ret = columns[0] + '~'
    for i in range(1, len(columns)):
        ret += columns[i] + '+'
    return ret[:-1]

def regressiveAnalysis(colList:list):
    title = getTitle(colList)
    print('### ' + title)
    print('```')
    data = getData(colList)
    model = smf.ols(getFormula(data.columns), data).fit()
    print(model.summary())
    print('```')

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

