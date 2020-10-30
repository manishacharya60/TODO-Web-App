<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.example.demo.DAO.Todo"%>
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
					<span>Add New Task</span>
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
					<span>Add New Task</span>
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
					<span>Add New Task</span>
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
					<span>Add New Task</span>
				</div>
				<%
					}
				%>

				<div class="bottom-content">
					            <form action="addTask" method="POST">
              <div class="row">
                <div class="input-field col s12">
                  <input
                    id="task"
                    type="text"
                    name="task"
                    class="validate"
                    required
                  />
                  <label for="disabled">Task</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s12">
                  <select name="category" required="required">
                    <option value="" disabled selected>
                      Choose your option
                    </option>
                    <option value="Personal">Personal</option>
                    <option value="Work">Work</option>
                    <option value="Groceries">Groceries</option>
                    <option value="School">School</option>
                  </select>
                  <label>Profession</label>

                  <div class="row">
                    <div class="col s8">
                      <div class="left submit-btn">
                        <a class="waves-effect waves-light btn red z-depth-3"
                          ><input
                            type="submit"
                            value="Submit"
                            class="submit"
                          /><i class="material-icons left submit">send</i></a
                        >
                      </div>
                    </div>

                    <div class="col s4">
                      <div class="right back-btn">
                        <a
                        href="/"
                          class="btn-floating btn-large waves-effect waves-light red"
                          ><i class="material-icons">arrow_back</i></a
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
				</div>
			</div>
		</div>
	</div>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var elems = document.querySelectorAll("select");
        var instances = M.FormSelect.init(elems, options);
      });

      // Or with jQuery

      $(document).ready(function () {
        $("select").formSelect();
      });
    </script>
</body>
</html>