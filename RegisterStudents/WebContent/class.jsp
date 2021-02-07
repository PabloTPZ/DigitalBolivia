<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<%@page import="entity.*"%>
<%@page import="connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>Class</title>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="./index.jsp">Estudiante</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Clases</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="constainer">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="home-tab" data-bs-toggle="tab"
				href="#home" role="tab" aria-controls="home" aria-selected="true">Buscar
					clase</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">Registrar clase</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- Busqueda de estudiante -->
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search" name="textSearch">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Título</th>
							<th scope="col">Descripción</th>
							<th scope="col">Acción</th>
						</tr>
					</thead>
					<tbody>

						<%
						RegisterDao service = new RegisterDao();
						%>
						<c:choose>
							<c:when test="${param.textSearch == ''}">
								<%
								List<Subject> listSubjects = service.getLitsSubject();
								request.setAttribute("subjects", listSubjects);
								%>
							</c:when>
							<c:otherwise>
								<%
								List<Subject> listSubjects = service.getSubjectDataList(request.getParameter("textSearch"));
								request.setAttribute("subjects", listSubjects);
								%>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${subjects}" var="emp">
							<tr>
								<td><c:out value="${emp.getId()}"></c:out></td>
								<td><c:out value="${emp.getTitle()}"></c:out></td>
								<td><c:out value="${emp.getDescription()}"></c:out></td>
								<td>
									<form class="d-flex" action="./ListStudent" method="post">
										<button type="button" class="btn btn-primary"
											value="edithButton" name="action">Editar</button>
										<button type="button" class="btn btn-danger"
											value="deleteButton" name="action">Eliminar</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Registro de materia -->
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<form action="./RegisterSubject" method="post">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Titulo</label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="titleSubject">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Descripción</label>
							<input type="text" class="form-control"
								id="exampleInputPassword1" name="descriptionSubject">
						</div>
						<button type="submit" class="btn btn-primary">Registrar</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		crossorigin="anonymous"></script>
</body>
</html>