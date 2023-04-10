<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/main.css"/>
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Book Club</title>
</head>
<body>
<div class="container-fluid" style="width:800px;">
	<div class="d-flex mx-auto mt-5" >
		<div class="me-5" style="width:800px;">
			<div class="d-flex align-items-center justify-content-between">
				<h1>Welcome <c:out value="${user.userName}"/></h1>
				<a href="/logout">logout</a>
			</div>
			<div class="d-flex align-items-center justify-content-between">
				<h4>Books from everyone's shelves:</h4>
				<a href="/books/new">+ add a book to my shelf</a>
			</div>
			<div>
			<table class="table table-hover table-borderless" style="background-color:;">
			<thead>
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Author Name</th>	
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="books" items = "${books}">
					<tr>
						<td><c:out value="${books.id}"></c:out></td>
						<td><a href="/books/${books.id}"><c:out value="${books.title}"></c:out></a></td>
						<td><c:out value="${books.author}"></c:out></td>
						<td><c:out value="${books.user.userName}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>