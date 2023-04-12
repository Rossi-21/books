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
	<div class="mx-auto mt-5" style="width:500px;">
		
		<form:form class="p-4 border border-3 border-dark rounded" action="/books/${book.id}" method="post" modelAttribute="book">
		<h1>Edit a Book</h1>
			<input type="hidden" name="_method" value="put">
			<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			<div>
				<form:label class="form-label fw-bold mt-2" path='title'>Title:</form:label>
				<form:errors class="text-danger" path="title"/>
	   			<form:input class="form-control" path='title'/>
			</div>
			<div>
				<form:label class="form-label fw-bold mt-2" path='author'>Author Name:</form:label>
				<form:errors class="text-danger" path="author"/>
	    		<form:input class="form-control" path='author'/>
			</div>
    		<div>
    			<form:label class="form-label fw-bold mt-2" path="thoughts">Thoughts:</form:label>
    			<form:errors class="text-danger" path="thoughts"/>
    			<form:textarea class="form-control" path="thoughts" cols="20" rows="3"></form:textarea>
    			
    		</div>
    		<input class="mt-3 border border-dark rounded" type="submit" value="Submit"/>
	    	</div>
	    </form:form>
	</div>
</body>
</html>