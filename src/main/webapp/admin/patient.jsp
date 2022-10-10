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
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="navbar.jsp"%>

	<div class="col-md-12 m-auto">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table table-success">
					<thead>
						<tr>
							<th scope="col">Full name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
							AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
							DoctorDao dao2 = new DoctorDao(ConnectionManager.getDBConn());
							
							List<Appointment> list = dao.getAllAppointment();
							for (Appointment app : list) {
								Doctor doc = dao2.getDoctorById(app.getDoctorId());
						%>
						<tr>
							<th><%=app.getFullName()%></th>
							<td><%=app.getGender()%></td>
							<td><%=app.getAge()%></td>
							<td><%=app.getAppoinDate()%></td>
							<td><%=app.getEmail()%></td>
							<td><%=app.getPhNo()%></td>
							<td><%=app.getDiseases()%></td>
							<td><%=doc.getFullName() %></td>
							<td><%=app.getAddress()%></td>
							<td><%=app.getStatus()%></td>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>