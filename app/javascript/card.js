const pay = () =>{
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  console.log(123)
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // フォーム情報の取得
    const card = {
      number: formData.get("order_shipping[number]"),
      cvc: formData.get("order_shipping[cvc]"),
      exp_month: formData.get("order_shipping[exp_month]"),
      exp_year: `20${formData.get("order_shipping[exp_year]")}`,
    };
    // カード情報をトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // クレジットカード情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // フォームの情報をサーバーサイドへ送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);