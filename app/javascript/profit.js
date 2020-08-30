window.addEventListener('load', function () {
  const inputElement = document.getElementById('item-price')
  const addTaxPrice = document.getElementById('add-tax-price')
  const profitElement = document.getElementById('profit')

  inputElement.addEventListener('keyup', function () {
    //inputElementのitem-priceに入力した値を取得して、変数に代入
    const input_price = document.getElementById("item-price").value
    //その変数を用いて手数料と取引利益を計算する
    const tax_price = Math.floor(input_price * 0.1)
    const profit_price = input_price - tax_price
    console.log(profit_price)
    //計算した値をinnerHTMLを使い、addTaxPlace,profitElementに反映させる
    addTaxPrice.innerHTML = tax_price
    profitElement.innerHTML = profit_price
  })
})