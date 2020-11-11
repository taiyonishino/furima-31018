window.addEventListener('load', () => {
  
  // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const num1 = Math.floor(inputValue * 0.1)
  addTaxDom.innerHTML = num1
  
  const priceProfit = document.getElementById("profit");
  num2 = Math.floor(inputValue - num1)
  priceProfit.innerHTML = num2
})
});