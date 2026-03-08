<%@ page contentType="text/html; charset=UTF-8" %>

<%
/* ログイン確認  */
String userName = (String)session.getAttribute("loginUser");
if(userName == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moon mood</title>

<link href=
"https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500&display=swap"
rel="stylesheet">

<style>

/*  画面全体  */
body{
  margin:0;
  min-height:100vh;
  background-color:#DCC8B8;
  font-family:'Zen Maru Gothic', sans-serif;
  color:#5a3e32;
  text-align:center;
}

/*  タイトル  */
.title{
  margin-top:80px;
  font-size:42px;
  letter-spacing:8px;
  font-weight:500;
}

/*  名前メッセージ  */
.subtitle{
  margin-top:40px;
  font-size:18px;
}

/*  アイコン配置  */
.mood-container{
  margin-top:30px;
  display:flex;
  justify-content:center;
  gap:35px;

}

.mood-icon{
  width:100px;
  cursor:pointer;
  transition:transform 0.25s ease, filter 0.35s ease;

}

.mood-icon:hover{
  transform:scale(1.08);

}

input[type="radio"]{
  display:none;

}

input[type="radio"]:checked + .mood-icon{
  transform:scale(1.12);
  filter:
  drop-shadow(0 0 15px rgba(255,255,255,1.0));

}

/* テキスト  */

.question{
  margin-top:40px;
  font-size:16px;
}

/*  テキストエリア */

textarea{
  margin-top:15px;
  width:420px;
  height:90px;
  border-radius:15px;
  border:none;
  padding:12px;
  resize:none;
  font-family:'Zen Maru Gothic', sans-serif;
  background:white;
}

/* ボタン  */

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

<div class="title">moon mood</div>

<form action="<%= request.getContextPath() %>/registerMood" method="post">

  <!-- 名前 -->

  <div class="subtitle">

    <%= userName %>さん、今日の気分は？

  </div>

  <!-- アイコン -->

  <div class="mood-container">

    <label>

      <input type="radio" name="mood" value="happy" required>

      <img src="images/happy.png" class="mood-icon">

    </label>



    <label>

      <input type="radio" name="mood" value="relax">

      <img src="images/relax.png" class="mood-icon">

    </label>



    <label>

      <input type="radio" name="mood" value="neutral">

      <img src="images/emotionless.png" class="mood-icon">

    </label>



    <label>

      <input type="radio" name="mood" value="sad">

      <img src="images/sad.png" class="mood-icon">

    </label>

    <label>

      <input type="radio" name="mood" value="angry">

      <img src="images/angry.png" class="mood-icon">

    </label>

  </div>

  <!-- テキスト -->

  <div class="question">

    どんな日だった？

  </div>

  <textarea name="message"></textarea>

  <br>

  <input type="submit" value="きろくする">

</form>

</body>

</html>





