# Let's predict cryptocurrency with AI Algorithm
# Hyeran Keum
# 2018-02-26

#0. versioning with git..... aborting error

#1. Getting Data - CoinAPI - Cryptocurrency Data API (https://www.coinapi.io)
#API Key: 1CA98564-ADAC-44EA-8DCA-EC1B3DC2AE2B
#Plan name: Free
#API : RESTful

#coinapi-sdk/r-rest/example.R

install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)

## I got a free account at coinapi.io
## Free account provides 100 daily requests free.
## The next tier allows 1000 daily requests for US$79/month

base     <- "https://rest.coinapi.io"
endpoint3 <- "/v1/ohlcv/BINANCE_SPOT_BTC_USDT/latest?period_id=1DAY&"
api_key  <- "apikey=1CA98564-ADAC-44EA-8DCA-EC1B3DC2AE2B"



## Create 
call <- paste0(base, endpoint3, api_key)
# call
## Retrieve data via GET call
get_prices <- GET(call)
get_prices$status_code#200 
http_status(get_prices)#check

headers(get_prices)
str(get_prices)

## Returns class "response"
class(get_prices)

## Process into a data table
get_prices_text <- content(get_prices, "text")  # Convert to "character" -> No encoding supplied: defaulting to UTF-8.
get_prices_json <- fromJSON(get_prices_text, flatten = TRUE) # Flatten into list
get_prices_df <- as.data.frame(get_prices_json)

## LINE CHART
install.packages("lubridate")
library(lubridate)
install.packages("ggplot2")
library(ggplot2)

ggplot(get_prices_df, aes(x=time_period_start, y=price_close, group=1))+geom_line(colour="red")+geom_point()+ggtitle("BINANCE_SPOT_BTC_USDT_A_DAY")

#2. Data processing with AI Algorithm, Checking a 
#2.1 lag model
install.packages("dlnm")
library(dlnm)
help(dlnm)




#2.2 single point prediction
#2.3 multi point prediction 
#2.4 long short Term memory -> Keras
#2.5
#2.6
#2.7
#2.8 알고리즘 간 정확도 비교















#3. Visualization 
#각 모델별 line 표시

