<%@page import="com.util.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.dataobjects.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
<%@include file="component/allcss.jsp"%>

</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointments List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
									User user = (User)session.getAttribute("userObj");
									AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
									DoctorDao dao2 = new DoctorDao(ConnectionManager.getDBConn());
									List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
									for (Appointment app : list) {
										Doctor doc = dao2.getDoctorById(app.getDoctorId());
								%>
								<tr>
									<th><%=app.getFullName()%></th>
									<td><%=app.getGender()%></td>
									<td><%=app.getAge()%></td>
									<td><%=app.getAppoinDate()%></td>
									<td><%=app.getDiseases()%></td>
									<td><%=doc.getFullName()%></td>
									<td>
										<%
											if ("pending".equals(app.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a>
										<%} else {%> 
 										<%=app.getStatus()%> 
 										<%}%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img height="500px" src="img/image6.jpg">
			</div>
		</div>
	</div>





	<%@include file="component/footer.jsp"%>
</body>
</html>