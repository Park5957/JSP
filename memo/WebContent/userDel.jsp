<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">


  </head>
  <body class="text-center">
    
 <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <div class = "container bg-Light shadow mx-auto mt-5 p-5 w-75" >
		<%@include file="utilMenu.jsp" %>
  
    
<main class="form-signin">
  <form action ="userDelDb.jsp">
    <h1 class="h3 mb-3 fw-normal">회원탈퇴</h1>

    <div class="form-floating">
      <input name="userid" type="text" class="form-control" id="floatingInput" placeholder="사용할 아이디를 입력하세요">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input name="userpw" type="password" class="form-control" id="floatingPassword" placeholder="사용할 암호를 입력하세요">
      <label for="floatingPassword">암호</label>
    </div>



    <button class="w-100 btn btn-lg btn-primary" type="submit">회원탈퇴</button>
    
  </form>
</main>



<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>