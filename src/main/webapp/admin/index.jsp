<%@page import="com.util.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.dataobjects.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Portal</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 test-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<p class="fs-3 test-center text-success">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		
		
		<%
		
		DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());%>
		
		
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							View Doctor <br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-users fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%=dao.countUser()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-regular fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointment()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2">
				<div data-bs-toggle="modal" data-bs-target="#specialistModal"
					class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-notes-medical fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=dao.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>

			<div class="modal fade" id="specialistModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add a Specialist</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="../addSpecialist" method="post">
								<div class="form-group">
									<label>Enter Specialist Name:</label> <input type="text"
										name="specName" class="form-control mt-2">
								</div>
								<div class="d-grid gap-2 col-6 mx-auto mt-3">
								<button type="submit" class="btn btn-lg btn-secondary"><i class="fa-solid fa-plus"></i></button>
								</div>
							</form>




						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>