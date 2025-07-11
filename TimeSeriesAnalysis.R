library(TSA)
library(sandwich)
library(lmtest)

#Exercise 3.7 The data file winnebago contains monthly unit sales of 
# recreational vehicles from Winnebago, Inc., from November 1966 through 
# February 1972.
data(winnebago)
#(a) Display and interpret the time series plot for these data.
plot(winnebago, ylab='Unit Sales', type='l', main = 'Winnebago Sales',)
points(y=winnebago, x=time(winnebago), pch=as.vector(season(winnebago)))


#(b) Use least squares to fit a line to these data. Interpret the 
#regression output. Plot the standardized residuals from the fit as a 
# time series. Interpret the plot.
winnebago.lm <- lm(winnebago~time(winnebago))
plot(rstandard(winnebago.lm), ylab='Standardized Residuals', type='l')

#(c) Now take natural logarithms of the monthly sales figures and 
#display and interpret the time series plot of the transformed values.
log.winnebago <- log(winnebago)
plot(log.winnebago, ylab='unit sales', type='l')
points(y=log.winnebago, x=time(log.winnebago), pch=as.vector(season(log.winnebago)))

#(d)  Use least squares to fit a line to the logged data. 
#Display and interpret the time series plot of the standardized 
# residuals from this fit.
log.winnebago.lm <- lm(log.winnebago~time(log.winnebago))
plot(rstandard(log.winnebago.lm), ylab='Standardized Residuals', type='l')

#(e)  Now use least squares to fit a seasonal-means plus linear time 
#trend to the logged sales time series and save the standardized residuals 
#for further analysis. Check the statistical significance of each of the 
#regression coefficients in the model.
month <- season(winnebago)
seasonal.log.winnebago.lm <- lm(log.winnebago ~ month + time(log.winnebago))
summary(seasonal.log.winnebago.lm)

#(f) Display the time series plot of the standardized residuals 
# obtained in part (e). Interpret the plot.
plot(rstandard(seasonal.log.winnebago.lm), ylab='Standardized Residuals', type='l')

#Exercise 3.8 The data file retail lists total U.K. (United Kingdom) 
#retail sales (in billions of pounds) from January 1986 through March 2007. The data are not “seasonally adjusted,” and year 2000 = 100 is the base year.
data(retail)
#(a)  Display and interpret the time series plot for these data. Be sure to use plotting
#symbols that permit you to look for seasonality.
plot(retail, ylab='Retail Sales', type='l')
points(y=retail, x=time(retail), pch=as.vector(season(retail)))

#(b)  Use least squares to fit a seasonal-means plus linear time trend to this time
#series. Interpret the regression output and save the standardized residuals from
#the fit for further analysis.
month <- season(retail)
seasonal.retail.lm <- lm(retail ~ month + time(retail))
summary(seasonal.retail.lm)

#(c)  Construct and interpret the time series plot of the standardized residuals from
#part (b). Be sure to use proper plotting symbols to check on seasonality.
plot(rstandard(seasonal.retail.lm) ~ time(retail), ylab='Standardized Residuals', type='l')


#Exercise 3.9 The data file prescrip gives monthly U.S. prescription costs for the months August 1986 to March 1992. These data are from the State of New Jersey’s Prescription Drug Program and are the cost per prescription claim.
data(prescrip)
#(a)  Display and interpret the time series plot for these data. Use plotting symbols
#that permit you to look for seasonality.
plot(prescrip, ylab='Average prescription cost', type='l')
points(y=prescrip, x=time(prescrip), pch=as.vector(season(prescrip)))

#(b)  Calculate and plot the sequence of month-to-month percentage changes in the
#prescription costs. Again, use plotting symbols that permit you to look for seasonality.
prescrip_lag <- lag(prescrip, -1)
prescrip_percent_change <- 100*((prescrip - prescrip_lag)/prescrip_lag)
plot(prescrip_percent_change, ylab='prescription cost % change', type='l')
points(y=prescrip_percent_change, x=time(prescrip_percent_change), pch=as.vector(season(prescrip_percent_change)))

#(c)  Use least squares to fit a cosine trend with fundamental frequency 1/12 to the
#percentage change series. Interpret the regression output. Save the standardized residuals.
har <- harmonic(prescrip_percent_change, m=1)
prescrip_percent_change.har.lm <- lm(prescrip_percent_change ~ har)
summary(prescrip_percent_change.har.lm)

#(d)  Plot the sequence of standardized residuals to investigate the adequacy of the
#cosine trend model. Interpret the plot.
plot(rstandard(prescrip_percent_change.har.lm), ylab='Standardized Residuals', type='l')

#Exercise 3.13 (Continuation of Exercise 3.7) Return to the winnebago time series.
#(a)  Calculate the least squares residuals from a seasonal-means plus linear 
# time trend model on the logarithms of the sales time series.
month <- season(log.winnebago)
log.winnebago <- log(winnebago)
seasonal.log.winnebago.lm <- lm(log.winnebago ~ month + time(log.winnebago))
resid1 <- rstandard(seasonal.log.winnebago.lm)
print(resid1)

#(b)  Perform a runs test on the standardized residuals and interpret the results.
runs(resid1)

#(c)  Calculate and interpret the sample autocorrelations for the standardized residuals.
acf(resid1, main = 'Winnebago Autocorrelations')

#(d)  Investigate the normality of the standardized residuals (error terms). Consider
#histograms and normal probability plots. Interpret the plots.
hist(resid1, main = 'standardized residuals')
qqnorm(resid1)
qqline(resid1)

#Exercise 3.14 (Continuation of Exercise 3.8) The data file retail contains U.K. 
#monthly retail sales figures
#(a)  Obtain the least squares residuals from a seasonal-means plus linear time
#trend model.
month <- season(retail)
seasonal.retail.lm <- lm(retail ~ month + time(retail))
resid2 <- rstandard(seasonal.retail.lm)
print(resid2)

#(b)  Perform a runs test on the standardized residuals and interpret the results.
runs(resid2)

#(c)  Calculate and interpret the sample autocorrelations for the standardized residuals.
acf(resid2, main = 'Retail UK sales Autocorrelation')

#(d)  Investigate the normality of the standardized residuals (error terms). Consider
#histograms and normal probability plots. Interpret the plots.
hist(resid2, main = 'UK Sales standardized residuals')
qqnorm(resid2)
qqline(resid2)

#Exercise 3.15 (Continuation of Exercise 3.9) Consider again the prescrip time series.
#(a)  Save the standardized residuals from a least squares fit of a cosine trend 
# with fundamental frequency 1/12 to the percentage change time series.
har <- harmonic(prescrip_percent_change, m=1)
prescrip_percent_change.har.lm <- lm(prescrip_percent_change ~ har)
resid3 <- rstandard(prescrip_percent_change.har.lm)
print(resid3)

#(b)  Perform a runs test on the standardized residuals and interpret the results.
runs(resid3)

#(c)  Calculate and interpret the sample autocorrelations for the standardized residuals.
acf(resid3, main = 'Autocorrelations of Prescrip')

#(d)  Investigate the normality of the standardized residuals (error terms). Consider
#histograms and normal probability plots. Interpret the plots
hist(resid3, main = 'Prescrip Standardized Residuals')
qqnorm(resid3)
qqline(resid3)

