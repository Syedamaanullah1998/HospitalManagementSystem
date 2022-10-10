<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.dataobjects.*"%>
<%@ page import="com.util.ConnectionManager"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctors</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3 m-auto">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 test-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 test-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" required class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" required class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" required class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option>--select--</option>
									<%
										SpecialistDao dao = new SpecialistDao(ConnectionManager.getDBConn());
										List<Specialist> list = dao.getAllSpecialist();
										for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
										}
									%>
								</select>

							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									name="email" required class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" required class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" required class="form-control">
							</div>
							<button type="submit" class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>
			</div>
			

		</div>
	</div>



	<%@include file="footer.jsp"%>
</body>
</html>