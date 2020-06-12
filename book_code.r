library(ggplot2)
library(fpp)
library(fpp2)
library(mts)
library(readr)
library(readxl)


# ts object usong the ts() function
# frequency is to map with months
y <- ts(c(123, 39, 78, 52, 110), start=2012, frequency = 12)

# ----------- simple line plots
# vosualizing individual series - explore relationships between series
autoplot(melsyd[, "Economy.Class"]) +
  ggtitle("Economy class passengers: Melbourne-Sydney") +
  xlab("Yrear") +
  ylab("Thousands")

# plotting a10 with just using autoplot gives a line time plot
autoplot(a10) +
  ggtitle("Antidiabetic drug sales") +
  ylab("$ million") +
  xlab("Year")

# seasonal plot
ggseasonplot(a10, year.label=TRUE, year.labels.left=TRUE) +
  ylab("$ million") +
  ggtitle("Seasonal plot: antidiabetic drug sales")

# polar seasonal plot
ggseasonplot(a10, polar=TRUE) +
  ylab("$ million") +
  ggtitle("Seasonal plot: antidiabetic drug sales")

# seasonal subseries plot
ggsubseriesplot(a10) +
  ylab("$ million") +
  ggtitle("Seasonal subseries plot: antidiabetic drug sales")

# between series
# line graphs for two different independent variables
# elecdemand is a half-hourly time series matrix with three columns
autoplot(elecdemand[, c("Demand", "Temperature")], facets=TRUE) +
  xlab("Year: 2014") + ylab("") +
  ggtitle("Half-hourly electricity demand: Victoria, Australia")

# ---------- scatter plots
# plotting one series against the other
qplot(Temperature, Demand, data=as.data.frame(elecdemand)) +
  ylab("Demand (GW)") + xlab("Temperature (Celsius)")

# plot many variables against each other
autoplot(visnights[, 1:5], facets=TRUE) +
  ylab("Number of visitor nights each quarter (millions)")

# --------------lag plots
beer2 <- window(ausbeer, start=1992)
gglagplot(beer2)

# correlogram or autocorrelation coefficients plots that shows the autocorrelation funcion ACF
ggAcf(beer2)

# autocorrelation for data with trend and seasonality
aelec <- window(elec, start=1980)
autoplot(aelec) + xlab("Year") + ylab("GWh")
ggAcf(aelec, lag=48)


# autocorrelation and white noise
set.seed(30)
y <- ts(rnorm(50))
autoplot(y) + ggtitle("White noise")
ggAcf(y)

# exercises - find links to datasets here: https://otexts.com/fpp2/graphics-exercises.html
autoplot(gold)
autoplot(woolyrnq)
autoplot(gas)
#find frequency
frequency(woolyrnq)
frequency(gas)
# find x value of max outlier
which.max(gold)
tute1 <- read.csv("Documents/r_playing_around/forecasting_principles_and_practice/tute1.csv")
mytimeseries <- ts(tute1[, -1], start=1981, frequency = 4)
# simple 3-line plot
autoplot(mytimeseries)
# same plot but with facets
autoplot(mytimeseries, facets=TRUE)

retaildata <- read_excel("Documents/r_playing_around/forecasting_principles_and_practice/retail.xlsx", skip=1)

# chose a column - make columns per month
myts <- ts(retaildata[,"A3349873A"],
           frequency=12, start=c(1982,4))
myts2 <- ts(retaildata[,"A3349349F"],
            frequency=12, start=c(1982,4))
#explore
# simpleplot
autoplot(myts)
#seasonal plot per year
ggseasonplot(myts)
# seasonal plot
ggsubseriesplot(myts)
# lagplot
gglagplot(myts)
# autocorrelation plot
ggAcf(myts)
# timeplots
autoplot(bicoal)
autoplot(chicken)
autoplot(dole)
autoplot(usdeaths)
autoplot(lynx)
autoplot(goog)
autoplot(writing)
autoplot(fancy)
autoplot(a10)
autoplot(h02)
