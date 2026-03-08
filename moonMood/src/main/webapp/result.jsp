<%@ page contentType="text/html; charset=UTF-8" %>

<%
/* ===== ログイン確認 ===== */
String userName = (String)session.getAttribute("loginUser");
if(userName == null){
    response.sendRedirect("login.jsp");
    return;
}

/* ===== フォームデータ取得 ===== */
String mood = (String)request.getAttribute("mood");
String message = (String)request.getAttribute("message");

if(message == null){ message = ""; }

java.time.LocalDate today = java.time.LocalDate.now();

/* ===== 気分ごとの設定 ===== */
String comment = "";
String moodImage = "";

if("happy".equals(mood)){
    comment = "その笑顔、最高だよ 🌙";
    moodImage = "images/happy.png";
}else if("sad".equals(mood)){
    comment = "今日はゆっくり休もうね。";
    moodImage = "images/sad.png";
}else if("angry".equals(mood)){
    comment = "よくがんばってるよ。深呼吸しよ。";
    moodImage = "images/angry.png";
}else if("relax".equals(mood)){
    comment = "穏やかな時間、いいね。";
    moodImage = "images/relax.png";
}else if("neutral".equals(mood)){
    comment = "静かな日も大切だよ。";
    moodImage = "images/emotionless.png";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moon mood</title>

<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500&display=swap" rel="stylesheet">

<style>

/* ===== 基本背景 ===== */
body{
  margin:0;
  min-height:100vh;
  background:#DCC8B8;
  font-family:'Zen Maru Gothic', sans-serif;
  color:#5a3e32;
}

/* ===== レイアウト ===== */
.page{
  display:flex;
  flex-direction:column;
  align-items:center;
  padding-top:40px;
}

/* ===== タイトル ===== */
.title{
  margin-top:80px;
  font-size:42px;
  letter-spacing:8px;
  font-weight:500;
}

.card{
  background:#f6efe8;
  padding:40px;
  border-radius:20px;
  width:420px;
  text-align:center;
  box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

.date{ font-size:14px; opacity:0.8; }
.mood-img{ margin:15px 0; }
.comment{ margin-top:15px; color:#7a5b4b; }

a{
  display:inline-block;
  margin-top:25px;
  text-decoration:none;
  background:#b08a72;
  color:white;
  padding:10px 20px;
  border-radius:25px;
}

button,
input[type="submit"],
a.button{
  margin-top:35px;
  padding:12px 40px;
  border:none;
  border-radius:30px;
  background:#a77b5e;
  color:white;
  font-size:15px;
  cursor:pointer;
  transition:0.3s;
  text-decoration:none;
  display:inline-block;
}

button:hover,
input[type="submit"]:hover,
a.button:hover{
  background:#91664b;
  transform:translateY(-2px);
}

</style>
</head>

<body>

<div class="page">

  <div class="title">moon mood</div>

  <div class="card">

    <div>きろくしたよ 🌙</div>

    <div class="date"><%= today %></div>

    <div class="mood-img">
      <img src="<%= request.getContextPath() + "/" + moodImage %>" width="120">
    </div>

    <div><%= userName %>さん、今日もおつかれさま。</div>

    <div>「<%= message %>」</div>

    <div class="comment"><%= comment %></div>
  <p>
    <a href="moodForm.jsp" class="button">もう一度きろくする</a>
  </p>
  
  <p>
	<a href="moodList" class="button">今までのきろくを見る</a>
</p>
  </div>

</div>

</body>
</html>