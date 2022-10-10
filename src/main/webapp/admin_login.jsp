<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="component/navbar.jsp"%>
	
	<div class="container p-5 m-auto">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
						<form action="adminLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label><input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label><input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>