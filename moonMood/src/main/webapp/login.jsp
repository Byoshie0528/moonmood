<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moon mood</title>

<!-- Googleフォント -->
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500&display=swap" rel="stylesheet">

<style>

/* ===== ページ全体の背景設定 ===== */
body{
  margin:0;
  min-height:100vh;
  background-color:#DCC8B8;
  font-family:'Zen Maru Gothic', sans-serif;
  color:#5a3e32;
}

/* ===== タイトル＋カードを縦並び中央にする箱 ===== */
.page{
  display:flex;
  flex-direction:column;
  align-items:center;
  padding-top:40px;
}

/* ===== 上に固定するアプリタイトル ===== */
.title{
  font-size:40px;
  letter-spacing:6px;
  font-weight:500;
  margin-bottom:30px;
}

/* ===== カード部分（中身） ===== */
.card{
  background:#f6efe8;
  padding:40px;
  border-radius:20px;
  width:420px;
  text-align:center;
  box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* ===== 入力欄 ===== */
input[type="text"]{
  width:100%;
  padding:10px;
  text-align:center;
  border-radius:12px;
  border:none;
  background:#fff;
}

button,
input[type="submit"]{
  margin-top:35px;
  padding:12px 40px;
  border:none;
  border-radius:30px;
  background:#a77b5e;
  color:white;
  font-size:15px;
  cursor:pointer;
  transition:0.3s;
}

button:hover,
input[type="submit"]:hover{
  background:#91664b;
  transform:translateY(-2px);
}


</style>
</head>

<body>

<!-- タイトルとカードをまとめる -->
<div class="page">

  <!-- 全ページ共通タイトル -->
  <div class="title">moon mood</div>

  <!-- ログインカード -->
  <div class="card">

    <form action="login" method="post">
      <div style="margin-bottom:10px;">名前をおしえてね</div>

      <input type="text" name="userName" required>

      <input type="submit" value="はじめる">
    </form>

  </div>

</div>

</body>
</html>