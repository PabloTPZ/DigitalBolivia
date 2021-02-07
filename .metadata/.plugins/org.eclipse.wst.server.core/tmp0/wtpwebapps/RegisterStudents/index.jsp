<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<%@page import="entity.*"%>
<%@page import="connection.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>Student</title>
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
						aria-current="page" href="#">Estudiante</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="./class.jsp">Clases</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="constainer">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="home-tab" data-bs-toggle="tab"
				href="#home" role="tab" aria-controls="home" aria-selected="true">Buscar
					estudiante</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">Registrar
					estudiante</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- Busqueda de estudiante -->
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<form class="d-flex" action="./ListStudent" method="get">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search" name="textSearch">
							<button class="btn btn-outline-success" type="submit"
								name="action" value="searchButton">Search</button>
						</form>
					</div>
				</nav>


				<form action="./ListStudent" method="get">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombres</th>
								<th scope="col">Apellidos</th>
								<th scope="col">Clase</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.listStudents}" var="emp">
								<tr>
									<td><c:out value="${emp.getId()}"></c:out></td>
									<td><c:out value="${emp.getLast_name()}"></c:out></td>
									<td><c:out value="${emp.getFirst_name()}"></c:out></td>
									<td><c:out value="${emp.getTitle()}"></c:out></td>
									<td>
										<button type="button" class="btn btn-primary">Editar</button>
										<button type="button" class="btn btn-danger">Eliminar</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>

			<!-- Registro de estudiante -->
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<form action="./RegisterStudents" method="post">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Nombres</label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="nameRegister">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Apellidos</label>
							<input type="text" class="form-control"
								id="exampleInputPassword1" name="lastNameRegister">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Asignar
								materia</label> <select class="form-select form-select-lg mb-3"
								aria-label=".form-select-lg example">
								<option selected>Open this select menu</option>
								<c:forEach items="${requestScope.list}" var="sub">
									<option value="${sub.getId()}">${sub.getTitle()}"</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary" name="action"
							value="registerButton">Registrar</button>
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