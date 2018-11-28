<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Quiz</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/radio.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

	<div class="wrapper">
		<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/quiz" user="root"
			password="Bahu@123" />

		<sql:query dataSource="${snapshot}" var="result">
select * from questions,solutions,category where questions.q_no=solutions.q_no and questions.category_id=(select category_id from category where category_name='${sessionScope.cat }' and category.category_name='${sessionScope.cat }');
      </sql:query>
		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">

						<h3 class="title">
							<b>${sessionScope.cat} Questions</b>
						</h3>
						<h6>${result.rows[1].instruction}</h6>
					</div>
					<div class="collapse navbar-collapse"></div>
				</div>
			</nav>


			<div class="content">
				<div class="container-fluid">

					<div class="col-md-12">
						<div class="card">
							<div class="header"></div>
							<br>
							<div class="content">
								<c:forEach var="row" items="${result.rows}">

									<p>${row.q_no}.${row.question}</p>

									<label class="containerRadio">${row.opt1} <input
										type="radio" checked="checked" name="q${row.q_no}"> <span
										class="checkmark"></span>
									</label>
									<br>

									<label class="containerRadio">${row.opt2} <input
										type="radio" name="q${row.q_no}"> <span
										class="checkmark"></span>
									</label>
									<br>

									<label class="containerRadio">${row.opt3} <input
										type="radio" name="q${row.q_no}"> <span
										class="checkmark"></span>
									</label>
									<br>

									<label class="containerRadio">${row.opt4} <input
										type="radio" name="q${row.q_no}"> <span
										class="checkmark"></span>
									</label>
									<br>
									<br>
								</c:forEach>
								<div class="footer"></div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="footer.html"%>


		</div>
	</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script >
$(document).ready(function(){
        alert('Attempt ${sessionScope.cat} quiz');
    });
</script>
</html>