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
<title>Comment</title>
<%@include file="../component/allcss.jsp"%>
<style>
.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/image3.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3 m-auto">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-4">Patient Comment</p>
                    
                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
                    Appointment app = dao.getAllAppointmentById(id);%>
                    
                    <form action="../updateStatus" method="post" class="row">
                        <div class="col-md-6">
                            <label>Patient Name</label>
                            <input type="text" readonly value="<%=app.getFullName() %>" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label>Age</label>
                            <input type="text" readonly value="<%=app.getAge() %>" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <br><label>Mob No</label>
                            <input type="text" readonly value="<%=app.getPhNo() %>" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <br><label>Diseases</label>
                            <input type="text" readonly value="<%=app.getDiseases() %>" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <br><label>Comment</label>
                            <textarea required name="comm" class="form-control" rows="3"></textarea>
                        </div>
                        <input type="hidden" name="id" value="<%=app.getId()%>">
                        <input type="hidden" name="did" value="<%=app.getDoctorId()%>">
                        <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>