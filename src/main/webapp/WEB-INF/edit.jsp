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
				<h1>Edit <c:out value="${book.title}"/></h1>
				<a href="/books">Back to the Shelves</a>
			</div>
			<form:form class="width mt-3" action="/books/${book.id}" method="post" modelAttribute="book">
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
	    		<input class="btn btn-primary mt-3 border border-dark rounded" type="submit" value="Submit"/>
		    </form:form>
		</div>
	</div>

</body>
</html>