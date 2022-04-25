<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 입력</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
 
   <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<div class = "container bg-secondary shadow mx-auto mt-5 p-5 w-75" >
<div class="alert alert-secondary" role="alert" align="center">
  위도 경도입력
</div>

<form class="row g-3" action="map2.jsp" method="post">
    
  <div class="col-12">
    <label for="inputAddress" class="form-label">위도</label>
    <input type="text" name="lat" class="form-control" id="inputAddress" >
  </div>
  <div class="col-12">
    <label for="inputAddress2" class="form-label">경도</label>
    <input type="text" name="lng" class="form-control" id="inputAddress2">
  </div>
    <div class="col-12">
    <label for="inputAddress2" class="form-label">메세지</label>
    <input type="text" name="message" class="form-control" id="inputAddress2">
  </div>

  
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign in</button>
  </div>
</form>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>