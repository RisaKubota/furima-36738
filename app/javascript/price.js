window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  const Fee = 10
    priceInput.addEventListener("input", () => {
    
      const inputValue = priceInput.value;
      // 販売手数料
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue * Fee/100);
      // 販売利益
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
    })
})