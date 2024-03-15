
function stock_price() {
  curl -s "https://www.moneycontrol.com/india/stockpricequote/auto-lcvshcvs/tatamotors/TM03"
}
alias stockprice=stock_price

echo stock_price
