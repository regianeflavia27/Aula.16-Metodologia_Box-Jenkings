> remove.packages("readxl")
Removing package from 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
> install.packages("readxl", dependencies = T)
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/readxl_1.1.0.zip'
Content type 'application/zip' length 1499886 bytes (1.4 MB)
downloaded 1.4 MB

package 'readxl' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpyyzXod\downloaded_packages
> remove.packages("aTSA")
Removing package from 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
> install.packages("aTSA", dependencies = T)
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/aTSA_3.1.2.zip'
Content type 'application/zip' length 181302 bytes (177 KB)
downloaded 177 KB

package 'aTSA' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpyyzXod\downloaded_packages
> remove.packages("tseries")
Removing package from 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
> install.packages("tseries", dependencies = T)
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/tseries_0.10-45.zip'
Content type 'application/zip' length 415079 bytes (405 KB)
downloaded 405 KB

package 'tseries' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpyyzXod\downloaded_packages
> library(readxl)
> library(aTSA)

Attaching package: 'aTSA'

The following object is masked from 'package:graphics':
  
  identify

> library(tseries)

'tseries' version: 0.10-45

'tseries' is a package for time series analysis and computational
finance.

See 'library(help="tseries")' for details.


Attaching package: 'tseries'

The following objects are masked from 'package:aTSA':
  
  adf.test, kpss.test, pp.test

> library("urca")
> library(readxl)
> Bancor_xls <- read_excel("C:/EconometriaA/Bancor.xls.xlsx", 
                           +     col_types = c("date", "numeric"))
There were 50 or more warnings (use warnings() to see the first 50)
> View(Bancor_xls)
> Bitcoin <-  ts(log(Bancor_xls$Close), start = 2018, frequency = 365)
> plot(Bitcoin, type="l", main="Logaritmos do Preço do Bitcoin", ylab="Log Preço", xlab="Data", col="Blue")
> grid(col = "black", lty = "dotted")
> acf(log(Bancor_xls$Close),lend=2, lwd=5,col="darkblue",main= "Função Autocorrelação - FAC")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> pacf(log(Bancor_xls$Close),lend=60, lwd=5,col="darkblue",main= "Função Autocorrelação Parcial - FACP")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> summary(ur.df(Bitcoin, "none", lags = 1))

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression none 


Call:
  lm(formula = z.diff ~ z.lag.1 - 1 + z.diff.lag)

Residuals:
  Min        1Q    Median        3Q       Max 
-0.251568 -0.032529  0.001476  0.031419  0.236586 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
z.lag.1    -0.0008876  0.0026341  -0.337    0.736
z.diff.lag  0.0819256  0.0524690   1.561    0.119

Residual standard error: 0.06104 on 362 degrees of freedom
Multiple R-squared:  0.00691,	Adjusted R-squared:  0.001424 
F-statistic: 1.259 on 2 and 362 DF,  p-value: 0.285


Value of test-statistic is: -0.3369 

Critical values for test statistics: 
  1pct  5pct 10pct
tau1 -2.58 -1.95 -1.62

> pp.test(Bitcoin)

Phillips-Perron Unit Root Test

data:  Bitcoin
Dickey-Fuller Z(alpha) = -3.4654, Truncation lag parameter = 5, p-value =
  0.913
alternative hypothesis: stationary

> kpss.test(Bitcoin)

KPSS Test for Level Stationarity

data:  Bitcoin
KPSS Level = 1.9678, Truncation lag parameter = 4, p-value = 0.01

Warning message:
  In kpss.test(Bitcoin) : p-value smaller than printed p-value
> IntOrdem1 <- diff(log(Bancor_xls$Close))
> IntegradaOrdem1 <- ts(IntOrdem1, start = 2018, frequency = 365)
> plot(IntegradaOrdem1, type="l", main="Primeira Diferança dos Logs do Bitcoin - LogReturn", ylab="Log Preço", xlab="Data", col="Blue")
> grid(col = "black", lty = "dotted")
> acf(IntOrdem1,lend=2, lwd=5,col="darkblue",main= "Função Autocorrelação - FAC")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> pacf(IntOrdem1,lend=60, lwd=5,col="darkblue",main= "Função Autocorrelação Parcial - FACP")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> ur.df(IntegradaOrdem1, "none", lags = 1)

############################################################### 
# Augmented Dickey-Fuller Test Unit Root / Cointegration Test # 
############################################################### 

The value of the test statistic is: -12.3111 

> pp.test(IntegradaOrdem1)

Phillips-Perron Unit Root Test

data:  IntegradaOrdem1
Dickey-Fuller Z(alpha) = -339.79, Truncation lag parameter = 5, p-value =
  0.01
alternative hypothesis: stationary

Warning message:
  In pp.test(IntegradaOrdem1) : p-value smaller than printed p-value
> kpss.test(IntegradaOrdem1)

KPSS Test for Level Stationarity

data:  IntegradaOrdem1
KPSS Level = 0.28081, Truncation lag parameter = 4, p-value = 0.1

Warning message:
  In kpss.test(IntegradaOrdem1) : p-value greater than printed p-value
> AR1 <- arima(IntegradaOrdem1, order = c(1,1,0))
> AR1 <- arima(IntegradaOrdem1, order = c(1,1,1))
> estimacoes <- list(AR1)
> sapply(estimacoes, AIC)
[1] -993.2912
> sapply(estimacoes, BIC)
[1] -981.5997
> AIC <- sapply(estimacoes, AIC)
> BIC <- sapply(estimacoes, BIC)
> AR1 <- arima(IntegradaOrdem1, order = c(1,1,1))
> MA1 <- arima(IntegradaOrdem1, order = c(1,1,1))
> estimacoes <- list(AR1, MA1)
> sapply(estimacoes, AIC)
[1] -993.2912 -993.2912
> sapply(estimacoes, BIC)
[1] -981.5997 -981.5997
> Modelo <- c("AR1", "MA1")
> Resultados <- data.frame(Modelo, AIC, BIC)
> View(Resultados)
> AR1 <- arima(IntegradaOrdem1, order = c(1,1,0))
> MA1 <- arima(IntegradaOrdem1, order = c(0,1,1))
> predict(AR1,15)
$`pred`
Time Series:
  Start = c(2019, 1) 
End = c(2019, 15) 
Frequency = 365 
[1] 0.04065863 0.04860173 0.04477787 0.04661870 0.04573251 0.04615913 0.04595375
[8] 0.04605262 0.04600503 0.04602794 0.04601691 0.04602222 0.04601966 0.04602089
[15] 0.04602030

$se
Time Series:
  Start = c(2019, 1) 
End = c(2019, 15) 
Frequency = 365 
[1] 0.07247832 0.08164480 0.09809929 0.10847552 0.11952410 0.12892044 0.13799617
[8] 0.14636543 0.15434760 0.16190637 0.16914166 0.17607342 0.18274544 0.18918090
[15] 0.19540518

> library(forecast)

Attaching package: 'forecast'

The following object is masked from 'package:aTSA':
  
  forecast

> forecast(AR1,15)
Point Forecast       Lo 80     Hi 80      Lo 95     Hi 95
2019.0000     0.04065863 -0.05222608 0.1335433 -0.1013963 0.1827135
2019.0027     0.04860173 -0.05603029 0.1532338 -0.1114191 0.2086226
2019.0055     0.04477787 -0.08094143 0.1704972 -0.1474932 0.2370489
2019.0082     0.04661870 -0.09239827 0.1856357 -0.1659894 0.2592268
2019.0110     0.04573251 -0.10744378 0.1989088 -0.1885304 0.2799954
2019.0137     0.04615913 -0.11905906 0.2113773 -0.2065203 0.2988386
2019.0164     0.04595375 -0.13089545 0.2228030 -0.2245138 0.3164213
2019.0192     0.04605262 -0.14152223 0.2336275 -0.2408184 0.3329236
2019.0219     0.04600503 -0.15179938 0.2438094 -0.2565107 0.3485208
2019.0247     0.04602794 -0.16146342 0.2535193 -0.2713027 0.3633586
2019.0274     0.04601691 -0.17074685 0.2627807 -0.2854947 0.3775285
2019.0301     0.04602222 -0.17962495 0.2716694 -0.2990753 0.3911198
2019.0329     0.04601966 -0.18817804 0.2802174 -0.3121548 0.4041941
2019.0356     0.04602089 -0.19642418 0.2884660 -0.3247669 0.4168086
2019.0384     0.04602030 -0.20440151 0.2964421 -0.3369668 0.4290074
> plot(forecast(AR1,5), type="o", xlim=c(2018.75,2018.85), ylim=c(-0.03,0.06))
> grid(col = "black", lty = "dotted")
> arch.test(AR1)
ARCH heteroscedasticity test for residuals 
alternative: heteroscedastic 

Portmanteau-Q test: 
  order    PQ  p.value
[1,]     4  42.0 1.69e-08
[2,]     8  60.8 3.32e-10
[3,]    12  70.3 2.78e-10
[4,]    16  85.0 2.02e-11
[5,]    20 112.3 7.33e-15
[6,]    24 127.8 4.44e-16
Lagrange-Multiplier test: 
  order    LM  p.value
[1,]     4 141.0 0.00e+00
[2,]     8  64.6 1.81e-11
[3,]    12  38.9 5.51e-05
[4,]    16  23.3 7.76e-02
[5,]    20  17.7 5.41e-01
[6,]    24  13.5 9.41e-01
> residuos <- AR1$residuals
> plot(residuos, type="o", main="Residuos do AR1")
> grid(col = "black", lty = "dotted")
> acf(residuos,lend=2, lwd=5,col="darkblue",main= "Função Autocorrelação - FAC")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> pacf(residuos,lend=60, lwd=5,col="darkblue",main= "Função Autocorrelação Parcial - FACP")
> axis(1,tck = 1, col = "lightgrey", lty = "dotted")
> GARCH202=garch(residuos,c(20,2),trace=F)