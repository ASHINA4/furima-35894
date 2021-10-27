// 変数payにアロー関数を代入する設定
const pay = () => {
// 変数payにアロー関数を代入する設定

  // PAY.JPテスト公開鍵
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // PAY.JPテスト公開鍵

  // フォームへ送信するイベント発火のタイミングの設定
  const submit = document.getElementById("button");
  if (!submit){ return false;}
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    // フォームへ送信するイベント発火のタイミングの設定

    // フォームの情報を取得する設定
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // フォームの情報を取得する設定

    // カードの情報を取得する設定
    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    };
    // カードの情報を取得する設定

    // トークン情報をフォームに追加する設定
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // トークン情報をフォームに追加する設定

      // クレジットカード情報の属性値を削除する設定
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      // クレジットカード情報の属性値を削除する設定

      // charge_formの属性値を削除する設定
      document.getElementById("charge-form").submit();
      // charge_formの属性値を削除する設定
    });
  });
};

// ページが読み込まれた後javascriptのコードが実行される設定
window.addEventListener("load", pay);
// ページが読み込まれた後javascriptのコードが実行される設定