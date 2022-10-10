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
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 test-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 test-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table .table-striped">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao dao2 = new DoctorDao(ConnectionManager.getDBConn());
									List<Doctor> list2 = dao2.getAllDoctors();
									for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-success">Edit</a> <a
										href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-success">Delete</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>



	<%@include file="footer.jsp"%>
</body>
</html>