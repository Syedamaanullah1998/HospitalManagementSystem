<%@page import = "com.util.*" %>
<%@page import = "com.dao.*" %>
<%@page import = "com.dataobjects.*" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.util.*" %>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3 m-auto">
		<div class="row mt-4">
			<div class="img col-md-6 p-5">
				<img height="500px" class="img-fluid" src="img/image6.jpg">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 test-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 test-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="appointment" method="post" class="row g-3">
							<input type="hidden" name="userid" value="${userObj.id}">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" name="fullname" required class="form-control">
							</div>
							<div class="col-md-6">
								<label>Gender</label> <select name="gender" class="form-control">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									maxlength="2" type="number" name="age" required
									class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" name="appoint_date" required
									class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" name="email" required class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" type="number" name="phno" required
									class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" name="diseases" required class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> 
								<select name="doct" required class="form-control">
									<option value="">--select--</option>
									<%DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
										List<Doctor> list = dao.getAllDoctors();
										for(Doctor doc:list){%>
										<option value="<%=doc.getId()%>"><%=doc.getFullName()%> (<%=doc.getSpecialist() %>)</option>
										<%} %>
								</select>
							</div>
							<div class="col-md-6">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" cols=""
									rows="3"></textarea>
							</div>
							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
	<%@include file="component/footer.jsp"%>

</body>