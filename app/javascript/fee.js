
function fee() {
  const price = document.getElementById("item-price");
  price.addEventListener("input", ()=>{
    const sales_commission = document.getElementById("add-tax-price")
    const sales_profit = document.getElementById("profit")
    const commission = Math.floor(price.value * 0.1)
    const profit = Math.floor(price.value * 0.9)
    sales_commission.innerHTML = commission;
    sales_profit.innerHTML = profit;
  });
};

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
window.addEventListener("load", fee);}