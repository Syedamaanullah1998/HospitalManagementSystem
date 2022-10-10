<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<div class="container p-4 m-auto">
		<div class="row">
			<div class="col-md-4 offset-md-4">
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
						<form action="changePassword" method="post">
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
							<input type="hidden" value="${userObj.id}" name="uid">
							<button id="btn" class="btn btn-success col-md-12 mt-3 mb-3">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../component/footer.jsp"%>


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
</body>
</html>