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
<body class="bg">
	<div class="container-fluid">
		<div class="p-5">
			<div class="d-flex align-items-center justify-content-between border-bottom border-dark">
				<h1><c:out value="${book.title}"></c:out></h1>
				<a href="/books">Back to the Shelves</a>
			</div>
			<p class="fs-3"><span class="text-danger"><c:out value="${book.user.userName}"/></span> read <span class="purple"><c:out value="${book.title}"/> </span>by <span class="text-success"><c:out value="${book.author}"/></span> </p>
			<p class="fs-4">Here are <c:out value="${book.user.userName}"/>'s thoughts:</p>
			<div class="border-top border-bottom border-dark pt-3 width">
				<p><c:out value="${book.thoughts}"/></p>
			</div>
			
			<c:if test="${book.user.id == user.id}">
				<div class="d-flex mt-3">
						<!-- Edit Button -->
					<a href="/books/${book.id}/edit"><button type="button" class="btn btn-primary ms-3">Edit</button></a>
					<!-- Delete Button -->
			        <form action="/books/${book.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input class="btn btn-danger" type="submit" value="Delete">
					</form>
				</div>
				
		    </c:if>
		</div>
	</div>
</body>
</html>