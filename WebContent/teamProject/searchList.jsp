<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel=stylesheet href="<c:url value='/css/bootstrap.css' />">
<title>팀플게시판</title>
</head>
<style>
#search {padding: 40px;}
h4 {padding:10px;}
li {padding: 8px 16px;}
h6 {padding:10px;}
</style>
<script>
function teamProSearch() {
	if (form.courseTitle.value == "") {
		alert("과목명을 입력해주세요");
		form.title.focus();
		return false;
	}
	form.submit();
}

function userLogout(targetUri) {
	form3.action = targetUri;
	form3.submit();
}

function myPage(targetUri) {
	form3.action = targetUri;
	form3.submit();
}
</script>
<body>
<header class="blog-header py-4">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1"> 
      	<p class="text-info">&nbsp;&nbsp;&nbsp;naibulmunyeong</p>      
      </div>
      <div class="col-4 text-center">
        <h4 class="blog-header-logo text-dark">팀플 게시판</h4>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
	      <nav class="my-2 my-md-0 mr-md-3">
	      	<form name="form3" method="post" action="<c:url value='/user/logout' />">
				<input type="button" class="btn btn-sm btn-outline-secondary" value="로그아웃(&nbsp;${curUserId}&nbsp;)" onClick="userLogout('<c:url value='/user/logout' />')">&nbsp;
				<input type="button" class="btn btn-sm btn-outline-secondary" value="내정보" onClick="myPage('<c:url value='/user/view'>
				<c:param name='stuId' value='${curUserId}'/></c:url>')" />
			</form>
		  </nav>
      </div>
    </div>
  </header>
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active p-2 text-muted"  href="<c:url value='/review/list ' />">
              HOME
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link p-2 text-muted" href="<c:url value='/review/list' />">
            	수업추천
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link p-2 text-muted" href="<c:url value='/teamProject/list' />">
              	팀플찾기
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link p-2 text-muted" href="<c:url value='/club/list' />">
              	동아리 추천
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link p-2 text-muted" href="<c:url value='/study/list' />">
              	튜터튜티
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap pt-3 pb-2 mb-3">
      	<div id="search">
			<form class="form-inline mt-2 mt-md-0" name="form" method="post" action="<c:url value='/teamProject/search/view' />">
			    <input name = "courseTitle" class="form-control mr-sm-2 w-90" type="text" placeholder="수업 검색" aria-label="Search" requried>
			    <input type="button" class="btn btn-outline-success my-2 my-sm" onClick="teamProSearch()" value="Search">
			</form>
		</div>
	  </div>
	  <div class="table-responsive">
	  <table class="table table-shopping">
	  <thead>
	  <tr>
	  	<th class="text-description" width="190" height="22">과목명</th>
		<th class="text-center" width="200" height="20">교수명</th>
		<th class="text-center" width="200" height="20">선택</th>
	  </tr>
	  </thead>
	  <tbody>
		  <c:forEach var="c" items="${classList}">
			<tr>
				<td width="100" bgcolor="FFFFFF" style="padding-left: 10" height="20">
					${c.courseTitle}	 
				</td>
				<td width="100" bgcolor="FFFFFF" style="padding-left: 10" align="center">
					${c.profName}
				</td>
				<td width="100" align="center" bgcolor="FFFFFF">
					<a href="<c:url value='/teamProject/view'>
					<c:param name='courseId' value='${c.courseId}'/>
					<c:param name='profId' value='${c.profId}'/>
					<c:param name='courseTitle' value='${c.courseTitle}'/>
					<c:param name='profName' value='${c.profName}'/>
					</c:url>">
					선택
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
    </main>
    </div>
    </div>
</body>
</html>
