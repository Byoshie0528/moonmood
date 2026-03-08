<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Mood" %>
<%
List<Mood> moodList = (List<Mood>)request.getAttribute("moodList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moon mood - 今までのきろく</title>

<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500&display=swap" rel="stylesheet">

<style>

body{
  margin:0;
  min-height:100vh;
  background-color:#DCC8B8;
  font-family:'Zen Maru Gothic', sans-serif;
  color:#5a3e32;
  text-align:center;
}

.title{
  margin-top:80px;
  font-size:42px;
  letter-spacing:8px;
  font-weight:500;
}

.list-container{
  margin:40px auto;
  width:500px;
}

/* カード */
.mood-card{
  position:relative;
  background:#ffffffcc;
  padding:20px 25px;
  border-radius:18px;
  margin-bottom:20px;
  text-align:left;
  transition:0.3s;
  position:relative;
}

.mood-card:hover{
  transform:translateY(-3px);
}

.date-row{
  display:flex;
  justify-content:space-between;
  align-items:center;
  font-size:14px;
  margin-bottom:10px;
}

.mood-icon{
  width:40px;
}

.comment{
  font-size:15px;
}

/* 削除フォーム */
.delete-form{
  position:absolute;
  top:-45px;
  right:-10px;
}

/* 初期状態は見えない */
.delete-btn{
  width:24px;
  height:24px;
  border-radius:50%;
  border:none;
  background:#a77b5e;
  color:white;
  font-size:13px;
  cursor:pointer;

  display:flex;
  align-items:center;
  justify-content:center;
  
  padding:0;
  line-height:1;

  opacity:0;
  transition:0.2s;
}

/* カードにカーソル乗ったら表示 */
.mood-card:hover .delete-btn{
  opacity:1;
}


/* ボタンエリア */
.button-area{
  margin:50px 0 80px 0;
}

.button-area a{
  margin:0 10px;
}

/* ボタン */
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
  display:inline-block;
  text-decoration:none;
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

<div class="title">moon mood</div>
<div style="margin-top:10px;">今までのきろく</div>

<div class="list-container">

<%
if(moodList != null){
  for(Mood mood : moodList){
%>

<div class="mood-card">


<form action="<%= request.getContextPath() %>/deleteMood" method="post" class="delete-form">
<input type="hidden" name="id" value="<%= mood.getId() %>">
<button type="submit" class="delete-btn"onclick="return confirm('このきろくを削除しますか？')">×</button>
</form>

<div class="date-row">

<div><%= mood.getDate() %></div>

<div>
<img src="<%= request.getContextPath() %>/images/<%= mood.getMood() %>.png"
class="mood-icon">
</div>

</div>

<div class="comment">
<%= mood.getMessage() %>
</div>

</div>

<%
  }
}
%>

</div>

<div class="button-area">

<a href="<%= request.getContextPath() %>/moodForm.jsp" class="button">
もう一度きろくする
</a>

<a href="<%= request.getContextPath() %>/logout" class="button">
とじる
</a>

</div>

</body>
</html>
