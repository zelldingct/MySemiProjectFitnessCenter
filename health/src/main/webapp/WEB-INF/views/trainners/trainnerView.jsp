<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.ReviewsDto"%>
<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerView Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
table{

float:right;

}
</style>
</head>
<body>
<%
UsersDto user = (UsersDto)session.getAttribute("login");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
List<ReviewsDto> reviewList = (List<ReviewsDto>)request.getAttribute("reviewList");
%>
<div id=view class="card" style="width: 18rem; margin-top:100px; margin-left:173px;">
  <img src="resources/images/trainer/<%=trainner.getTid() %>.jpg" width="400px" height="400px"
   onerror="this.src='resources/images/trainer/null.jpg'" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">이름 : <%= trainner.getName()%></h5>
    <p class="card-text">
    
  <div class="card-header">
    소개
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">분야 : <%= trainner.getField()==1?"pt트레이너":"필라테스"%></li> 
    <li class="list-group-item">양력 : <%= trainner.getCareer()%></li>
    <li class="list-group-item">한마디 : <%= trainner.getContent()%></li>
  </ul>
    <br><a onclick="moveReviewWrite()" class="btn btn-primary">리뷰작성</a>
  </div>
</div>

<table style="width:1200px" class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">평점</th>
      <th scope="col">추천</th>
      <th scope="col">비추천</th>
    </tr>
  </thead>
  
<%for(int i=0;i<reviewList.size();i++)
	{%>		
  <tbody>
    <tr>
      <th scope="row"><%=reviewList.get(i).getRnum() %></th>
      <td><a href="moveReviewView.do?rnum=<%=reviewList.get(i).getRnum()%>"><%=reviewList.get(i).getTitle() %></a></td>
      <td><%=reviewList.get(i).getMid() %></td>
      <td><%=reviewList.get(i).getWdate() %></td>
      <td><%=reviewList.get(i).getGrade() %></td>
      <td><%=reviewList.get(i).getRcm() %></td>
      <td><%=reviewList.get(i).getOps() %></td>
    </tr>
  </tbody>
  		<%
	}
	%>
</table>




<script type="text/javascript">
function moveReviewWrite(){
	<%
	if(user.getAuth()==2)
	{
		%>
		alert("트레이너는 리뷰를 남길 수 없습니다.");
		return false;
		<%
	}
	else
	{
		%>
		location.href="moveReviewWrite.do?tid=<%=trainner.getTid()%>";
		<%
	}
	%>
}
</script>
</body>
</html>