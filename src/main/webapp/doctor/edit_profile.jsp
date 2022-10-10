<%@page import="com.dataobjects.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.util.ConnectionManager"%>
<%@page import="com.dao.SpecialistDao"%>
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
	<div class="container p-4 m-auto">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3 mt-3">Change Password</p>
					<c:if test="${not empty succMsg}">
						<p class="text-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctorChangePassword" method="post">
							<div class="mb-4">
								<input id="oldpass" placeholder="Old Password" type="text"
									name="oldPassword" required class="form-control" value="">
							</div>
							<div class="mb-4">
								<input id="newpass" placeholder="New Password" type="text"
									name="newPassword" required class="form-control">
							</div>
							<div class="mb-4">
								<input id="newpass2" placeholder="Re-Enter Password" type="text"
									name="newPassword2" required class="form-control">
							</div>
							<input type="hidden" value="${doctorObj.id}" name="docid">
							<button id="btn" class="btn btn-primary col-md-12 mt-3 mb-3">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-6 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3 mt-3">Edit Profile</p>
				<c:if test="${not empty succMsg2}">
						<p class="text-center text-success fs-5">${succMsg2}</p>
						<c:remove var="succMsg2" scope="session" />
					</c:if>
					<c:if test="${not empty errorMsg2}">
						<p class="text-center text-danger fs-5">${errorMsg2}</p>
						<c:remove var="errorMsg2" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../editDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" required class="form-control" value="${doctorObj.fullName}">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" required class="form-control" value="${doctorObj.dob}">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" required class="form-control" value="${doctorObj.qualification}">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									name="specialist" required class="form-control">
									<option>${doctorObj.specialist}</option>
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
								<label class="form-label">Email</label> <input readonly
									type="text" name="email" required class="form-control" value="${doctorObj.email}">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" required class="form-control" value="${doctorObj.mobNo}">
							</div>
							<input type="hidden" name="docid" value="${doctorObj.id }">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>

	<script>
		document
				.querySelector("#btn")
				.addEventListener(
						"click",
						function(event) {
							var oldPass = document.querySelector("#oldpass").value;
							var newPass = document.querySelector("#newpass").value;
							var newPass2 = document.querySelector("#newpass2").value;
							if (oldPass !== "" && newPass !== ""
									&& newPass2 !== "") {
								if (oldPass === newPass) {
									alert("please enter a password different from the oldPassword");
									event.preventDefault();
								}

								if (newPass !== newPass2) {
									alert("password does not match");
									event.preventDefault();
								}
							}
						});
	</script>
<%@include file="footer.jsp"%>
</body>
</html>