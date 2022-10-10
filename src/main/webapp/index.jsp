<%@page import = "com.util.*" %>
<%@page import = "java.sql.Connection" %>
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


	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="img"><img src="img/image1.jpg" class=".img-fluid w-100" style="object-fit: cover;"
					height="500px" ></div>
			</div>
			<div class="carousel-item">
				<div class="img"><img src="img/image2.jpg" class=".img-fluid w-100" style="object-fit: cover;"
					height="500px" ></div>
			</div>
			<div class="carousel-item">
				<div class="img"><img src="img/image3.jpg" class=".img-fluid w-100" style="object-fit: cover;"
					height="500px" ></div>
			</div>
			<div class="carousel-item">
				<div class="img"><img src="img/image4.jpg" class=".img-fluid w-100" style="object-fit: cover;"
					height="500px" ></div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>




	<div class="container">
		<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quia fugit placeat voluptatum quo consectetur iusto aperiam
									ipsam minima sapiente illum!</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quia fugit placeat voluptatum quo consectetur iusto aperiam
									ipsam minima sapiente illum!</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quia fugit placeat voluptatum quo consectetur iusto aperiam
									ipsam minima sapiente illum!</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Quia fugit placeat voluptatum quo consectetur iusto aperiam
									ipsam minima sapiente illum!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="img/image6.jpg" height="450px">
			</div>
		</div>
		</div>
		<hr>


		<div class="container p-2">
			<p class="text-center fs-2">Our Team</p>
			<div class="row">
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/doc1.jpg" class="img-fluid" style="width: auto; height:195px; object-fit: cover;">
							<p class="fs-7">(CEO & Chairman)</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/doc2.jpg" class="img-fluid" style="width: auto; height: 195px; object-fit: cover;">
							<p class="fs-7">(Chief Doctor)</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/doc3.jpg" class="img-fluid" style="width: auto; height: 195px; object-fit: cover;">
							<p class="fs-7">(Chief Doctor)</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card paint-card">
						<div class="card-body text-center">
							<img src="img/doc4.jpg" class="img-fluid" style="width: auto; height: 195px; object-fit: cover;">
							<p class="fs-7">(Chief Doctor)</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>