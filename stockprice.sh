curl -s $1 | grep nsecp |awk -F '[<>]' '{print $3}'

function stock_price() {
  curl -s "https://www.nseindia.com/market-data/live-equity-market?symbol=NIFTY%2050"
}
echo stock_price
