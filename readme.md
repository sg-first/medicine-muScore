medicine-muScore
==========

有显著性的变量（基于线性模型）
------------
### NL
```
            Estimate Std. Error t value Pr(>|t|)   
(Intercept)  14.5448     9.7958   1.485  0.14655   
NL$CCL17     -0.6188     0.7658  -0.808  0.42447   
NL$CCL18      0.3174     0.8565   0.371  0.71314   
NL$CCL22      0.8744     0.5335   1.639  0.11014   
NL$CCL27      0.2710     0.5563   0.487  0.62919   
NL$`IFN-γ`    0.1589     0.4417   0.360  0.72129   
NL$IL13       1.1829     0.5194   2.278  0.02897 * 
NL$IL18      -0.4725     0.6077  -0.778  0.44205   
NL$IL19      -0.3951     0.8423  -0.469  0.64193   
NL$IL31       0.3407     0.4809   0.708  0.48342   
NL$IL33      -1.6340     0.5915  -2.762  0.00908 **
NL$IL4        0.2754     0.4090   0.673  0.50520   
NL$MMP12     -0.6256     0.7289  -0.858  0.39660   
```
选`NL$IL13`、`NL$IL33`

### LS
```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept) 32.66294   13.44491   2.429   0.0204 *
LS$CCL17    -0.61665    1.04816  -0.588   0.5601  
LS$CCL18    -0.06943    0.85339  -0.081   0.9356  
LS$CCL22     1.52887    0.89165   1.715   0.0953 .
LS$CCL27     0.29908    0.59554   0.502   0.6187  
LS$`IFN-γ`   1.08841    0.52512   2.073   0.0456 *
LS$IL13     -0.70085    0.61946  -1.131   0.2656  
LS$IL18     -0.26468    0.87713  -0.302   0.7646  
LS$IL19      0.15354    0.58645   0.262   0.7950  
LS$IL31     -0.14748    0.55427  -0.266   0.7917  
LS$IL33      0.29774    0.59514   0.500   0.6200  
LS$IL4       0.58940    0.49842   1.183   0.2450  
LS$MMP12    -0.53630    1.10482  -0.485   0.6304  
```
选`LS$CCL22`、`LS$IFN-γ`

### 血清
```
Coefficients:
                 Estimate Std. Error t value Pr(>|t|)
(Intercept)     -142.4356   158.7045  -0.897    0.376
xueqing$CCL17      1.2658     1.2262   1.032    0.309
xueqing$CCL18      5.7255     4.2457   1.349    0.186
xueqing$CCL22     -1.9918     1.9416  -1.026    0.312
xueqing$CCL27     -0.8906     7.2759  -0.122    0.903
xueqing$`IFN-γ`   13.0398    10.8767   1.199    0.239
xueqing$IL13      -4.8670     9.6505  -0.504    0.617
xueqing$IL18       3.7538     2.6243   1.430    0.161
xueqing$IL19      -1.0227     9.4906  -0.108    0.915
xueqing$IL31       1.9330     1.5473   1.249    0.220
xueqing$IL33       0.1061    10.9903   0.010    0.992
xueqing$IL4        6.2101     8.1755   0.760    0.453
xueqing$MMP12     -0.6502    21.8782  -0.030    0.976
```
全不选

mu-score回归分析（NL、LS分开）
-----------

### NL
```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 16.03958    1.44714  11.084  1.4e-14 ***
NLScore      0.02931    0.05680   0.516    0.608    
```
![](NL.png)
无相关性

### LS
```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 16.03958    1.35324  11.853  1.4e-15 ***
LSScore      0.16522    0.06285   2.629   0.0116 *  
```
![](LS.png)
有相关性

mu-score回归分析（NL、LS合并）
---------
```
Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 16.03958    1.35776  11.813 1.57e-15 ***
score        0.21041    0.08216   2.561   0.0138 *  
```
![](NLLS.png)
有相关性

有显著性的变量（基于相关系数）
---------
### NL
相关系数值：
```
               oldScore
NL.CCL17   -0.079291411
NL.CCL18   -0.086562711
NL.CCL22    0.109278587
NL.CCL27    0.006320145
NL..IFN.γ. -0.041992165
NL.IL13     0.191548290
NL.IL18    -0.016398469
NL.IL19    -0.045139547
NL.IL31     0.050036618
NL.IL33    -0.244847347
NL.IL4      0.114566674
NL.MMP12    0.033108402
```
显著性检验：
```
data:  oldScore and data$CCL17
t = -0.53948, df = 46, p-value = 0.5922

data:  oldScore and data$CCL18
t = -0.58931, df = 46, p-value = 0.5585

data:  oldScore and data$CCL22
t = 0.74563, df = 46, p-value = 0.4597

data:  oldScore and data$CCL27
t = 0.042866, df = 46, p-value = 0.966

data:  oldScore and data$`IFN-γ`
t = -0.28506, df = 46, p-value = 0.7769

data:  oldScore and data$IL13
t = 1.3237, df = 46, p-value = 0.1922

data:  oldScore and data$IL18
t = -0.11123, df = 46, p-value = 0.9119

data:  oldScore and data$IL19
t = -0.30646, df = 46, p-value = 0.7606

data:  oldScore and data$IL31
t = 0.33979, df = 46, p-value = 0.7356

data:  oldScore and data$IL33
t = -1.7128, df = 46, p-value = 0.09349

data:  oldScore and data$IL4
t = 0.78218, df = 46, p-value = 0.4381

data:  oldScore and data$MMP12
t = 0.22468, df = 46, p-value = 0.8232
```

### LS
相关系数值：
```
                 oldScore
data.CCL17    0.039797106
data.CCL18   -0.053143332
data.CCL22    0.202109176
data.CCL27    0.118341394
data..IFN.γ.  0.291807130
data.IL13    -0.082457924
data.IL18     0.069993915
data.IL19    -0.042943835
data.IL31     0.003483419
data.IL33     0.191968995
data.IL4      0.088449836
data.MMP12    0.156350250
```
显著性检验：
```
data:  oldScore and data$CCL17
t = 0.27013, df = 46, p-value = 0.7883

data:  oldScore and data$CCL18
t = -0.36095, df = 46, p-value = 0.7198

data:  oldScore and data$CCL22
t = 1.3997, df = 46, p-value = 0.1683

data:  oldScore and data$CCL27
t = 0.80831, df = 46, p-value = 0.4231

data:  oldScore and data$`IFN-γ` <<<<<<
t = 2.0692, df = 46, p-value = 0.04417

data:  oldScore and data$IL13
t = -0.56117, df = 46, p-value = 0.5774

data:  oldScore and data$IL18
t = 0.47589, df = 46, p-value = 0.6364

data:  oldScore and data$IL19
t = -0.29153, df = 46, p-value = 0.772

data:  oldScore and data$IL31
t = 0.023626, df = 46, p-value = 0.9813

data:  oldScore and data$IL33
t = 1.3267, df = 46, p-value = 0.1912

data:  oldScore and data$IL4
t = 0.60226, df = 46, p-value = 0.55

data:  oldScore and data$MMP12
t = 1.0736, df = 46, p-value = 0.2886
```

### 血清
相关系数值：
```
              oldScore
data.CCL17   0.4893293
data.CCL18   0.2782037
data.CCL22   0.1589100
data.CCL27   0.5038487
data..IFN.γ. 0.5093419
data.IL13    0.3744124
data.IL18    0.4655896
data.IL19    0.1454989
data.IL31    0.1852483
data.IL33    0.4838018
data.IL4     0.4609382
data.MMP12   0.3796799
```

显著性检验：
```
data:  oldScore and data$CCL17 <<<<<<
t = 3.8055, df = 46, p-value = 0.0004163

data:  oldScore and data$CCL18 <<<<<<
t = 1.9644, df = 46, p-value = 0.05554

data:  oldScore and data$CCL22
t = 1.0917, df = 46, p-value = 0.2807

data:  oldScore and data$CCL27 <<<<<<
t = 3.9561, df = 46, p-value = 0.0002613

data:  oldScore and data$`IFN-γ` <<<<<<
t = 4.0143, df = 46, p-value = 0.0002179

data:  oldScore and data$IL13 <<<<<<
t = 2.7386, df = 46, p-value = 0.008748

data:  oldScore and data$IL18 <<<<<<
t = 3.5681, df = 46, p-value = 0.0008539

data:  oldScore and data$IL19
t = 0.99744, df = 46, p-value = 0.3238

data:  oldScore and data$IL31
t = 1.2785, df = 46, p-value = 0.2075

data:  oldScore and data$IL33 <<<<<<
t = 3.7493, df = 46, p-value = 0.0004944

data:  oldScore and data$IL4 <<<<<<
t = 3.5228, df = 46, p-value = 0.0009771

data:  oldScore and data$MMP12 <<<<<<
t = 2.7836, df = 46, p-value = 0.007776
```