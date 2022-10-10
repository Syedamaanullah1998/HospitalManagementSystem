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
<title>Doctor Portal</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">

	<%@include file="navbar.jsp"%>

	<%
	Doctor doc = (Doctor)session.getAttribute("doctorObj");
	DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());%>

	<p class="text-center fs-3">Doctor Dashboard</p>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br><%=dao.countAppointmentByDoctorId(doc.getId()) %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>