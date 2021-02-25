function fee() {
  const price = document.getElementById("item-price");
  price.addEventListener("input", ()=>{
    const sales_commission = document.getElementById("add-tax-price")
    const sales_profit = document.getElementById("profit")
    // debugger
    sales_commission.innerHTML = price.value * 0.1;
    sales_profit.innerHTML = price.value * 0.9;
  });
};

window.addEventListener("load", fee);