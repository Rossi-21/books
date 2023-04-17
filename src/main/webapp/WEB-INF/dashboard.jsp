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
				<h1>Welcome to the Book Club <c:out value="${user.userName}"/></h1>
				<a href="/logout">logout</a>
			</div>
			<div class="d-flex mt-3 align-items-center justify-content-between">
				<h4>Books from everyone's shelves:</h4>
				<a href="/books/new">+ add a book to my shelf</a>
			</div>
			<div>
				<table class="table table-hover table-borderless table-width" style="background-color:;">
					<thead>
						<tr>
							<th>Id</th>
							<th>Title</th>
							<th>Author Name</th>	
							<th>Posted By</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="books" items = "${books}">
							<c:if test="${books.borrower.id != user.id}">
								<tr>
									<td style="width:5%;"><c:out value="${books.id}"></c:out></td>
									<td style="width:30%;"><a href="/books/${books.id}"><c:out value="${books.title}"></c:out></a></td>
									<td style="width:25%;"><c:out value="${books.author}"></c:out></td>
									<td style="width:18%;"><c:out value="${books.user.userName}"></c:out></td>							
									<c:choose>
										<c:when test="${books.user.id == user.id}">
											<td class="d-flex align-items-center">
												<a href="/books/${books.id}/edit">edit</a>
												<form action="/books/${books.id}/delete" method="post">
												    <input type="hidden" name="_method" value="delete">
												    <input class="btn text-primary text-decoration-underline" type="submit" value="delete">
												</form>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<a href="/books/${books.id}/borrow">borrow</a>
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<h4>Books I am Borrowing:</h4>
					<table class="table table-hover table-borderless table-width" style="background-color:;">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Author Name</th>	
								<th>Posted By</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="books" items = "${books}">
								<c:if test="${books.borrower.id == user.id}">
									<tr>
										<td style="width:5%;"><c:out value="${books.id}"></c:out></td>
										<td style="width:30%;"><a href="/books/${books.id}"><c:out value="${books.title}"></c:out></a></td>
										<td style="width:25%;"><c:out value="${books.author}"></c:out></td>
										<td style="width:18%;"><c:out value="${books.user.userName}"></c:out></td>
										<td><a href="/books/${books.id}/return">return</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>