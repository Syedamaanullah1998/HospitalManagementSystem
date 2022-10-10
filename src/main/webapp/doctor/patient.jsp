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
<title>Patients</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="navbar.jsp"%>
	
	<div class="container p-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Patient Details</p>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-3 test-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty succMsg}">
                        <p class="fs-3 test-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appoint Date</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
									Doctor doctor = (Doctor)session.getAttribute("doctorObj");
									AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
									List<Appointment> list = dao.getAllAppointmentByDoctorLogin(doctor.getId());
									for (Appointment app : list) {
								%>
								<tr>
									<th><%=app.getFullName()%></th>
									<td><%=app.getGender()%></td>
									<td><%=app.getAge()%></td>
									<td><%=app.getAppoinDate()%></td>
									<td><%=app.getEmail()%></td>
									<td><%=app.getPhNo()%></td>
									<td><%=app.getDiseases()%></td>
									<td><%=app.getStatus()%></td>
									<td>
									<%if("pending".equals(app.getStatus())){%>
										<a href="comment.jsp?id=<%=app.getId()%>" class="btn btn-sm btn-success">Comment</a>
									<%}else{%>
									<a href="#" class="disabled btn btn-sm btn-success">Comment</a>
									<%}%>	
									</td>
								</tr>
								<%}%>
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