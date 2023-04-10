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
<h1><c:out value="${book.title}"></c:out></h1>
<a href="/books">Back to the Shelves</a>
<p><c:out value="${book.user.userName}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/></p>
<p>Here are <c:out value="${book.user.userName}"/>'s thoughts:</p>
<p><c:out value="${book.thoughts}"/></p>
	<c:if test="${book.user.id == user.id}">
		<!-- Edit Button -->
		<a href="/books/${book.id}/edit"><button type="button" class="btn btn-primary">Edit</button></a>
		<!-- Delete Button -->
        <form action="/books/${book.id}" method="post">
		    <input type="hidden" name="_method" value="delete">
		    <input class="btn btn-danger" type="submit" value="Delete">
		</form>
    </c:if>
   
</body>
</html>