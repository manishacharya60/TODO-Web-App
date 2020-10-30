<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.example.demo.DAO.Todo"%>
<%@ page import="com.example.demo.DAO.TodoRepo"%>
<%@ page import="org.springframework.beans.factory.annotation.Autowired"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TODO - Don't Forget!</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
	
<!-- Material icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<!-- custom css -->
<link rel="stylesheet" href="style.css" />

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<!-- title icon -->
<link rel="shortcut icon" href="logo.png">

</head>
<body>
	<%
	LocalDateTime myDateObj = LocalDateTime.now();
	DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("EEEE, MMMM dd");

	String formattedDate = myDateObj.format(myFormatObj);
	%>

	<%
		Calendar c = Calendar.getInstance();
	int timeOfDay = c.get(Calendar.HOUR_OF_DAY);
	%>

	<div class="row">
		<div class="col s12 m6 l4 offset-l4">
			<div class="card">
				<%
					if (timeOfDay >= 0 && timeOfDay < 12) {
				%>
				<div class="top-content-m">
					<span class="card-title"><h3>Good Morning</h3>
						<h5>
							<%= formattedDate %>
						</h5></span>
				</div>
				<div class="mid-content-m">
					<div class="row">
						<div class="col s6 offset-s3">${totalTask} Tasks</div>
					</div>
				</div>
				<%
					} else if (timeOfDay >= 12 && timeOfDay < 16) {
				%>
				<div class="top-content-a">
					<span class="card-title"><h3>Good Afternoon</h3>
						<h5>
							<%= formattedDate %>
						</h5></span>
				</div>
				<div class="mid-content-a">
					<div class="row">
						<div class="col s6 offset-s3">${totalTask} Tasks</div>
					</div>
				</div>
				<%
					} else if (timeOfDay >= 16 && timeOfDay < 21) {
				%>
				<div class="top-content-e">
					<span class="card-title"><h3>Good Evening</h3>
						<h5>
							<%= formattedDate %>
						</h5></span>
				</div>
				<div class="mid-content-e">
					<div class="row">
						<div class="col s6 offset-s3">${totalTask} Tasks</div>
					</div>
				</div>
				<%
					} else if (timeOfDay >= 21 && timeOfDay < 24) {
				%>
				<div class="top-content-n">
					<span class="card-title"><h3>Good Night</h3>
						<h5>
							<%= formattedDate %>
						</h5></span>
				</div>
				<div class="mid-content-n">
					<div class="row">
						<div class="col s6 offset-s3">${totalTask} Tasks</div>
					</div>
				</div>
				<%
					}
				%>

				<div class="bottom-content">
					<div class="row">
						<a href="/all">
                <div class="col l6 m6 s6">
                  <div class="task-card">
                    <span class="material-icons"> list </span> <br />
                    All
                  </div>
                </div>
						</a> <a href="/personal">
                <div class="col l6 m6 s6">
                  <div class="task-card">
                    <span class="material-icons"> face </span><br />Personal
                  </div>
                </div>
						</a>
					</div>

					<div class="row">
						<a href="/work">
                <div class="col l6 m6 s6">
                  <div class="task-card">
                    <span class="material-icons"> work_outline </span><br />Work
                  </div>
                </div>
						</a> <a href="/groceries">
               <div class="col l6 m6 s6">
                  <div class="task-card">
                    <span class="material-icons"> storefront </span
                    ><br />Groceries
                  </div>
                </div>
						</a>
					</div>
					<div class="row">
						<a href="/school">
                <div class="col l6 m6 s6">
                  <div class="task-card">
                    <span class="material-icons"> school </span><br />School
                  </div>
                </div>
						</a>

						<div class="col l6 m6 s6">
							<a
							href="/add"
								class="btn-floating btn-large waves-effect waves-light right"><i
								class="material-icons">add</i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>