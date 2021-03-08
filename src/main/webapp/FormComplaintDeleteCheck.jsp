<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<title>Delete Check</title>

<body>

	<div class="container">

		<h2>Delete Check</h2>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form name="myForm" action="Controller?action=DELETE"
					method="post">


					<div class="form-group">
						Complaint ID: <input type="text" class="form-control"
							name="complaintid" placeholder="Enter Complaint ID"
							value="${complaint.complaintid}" onkeyup="value=value.replace(/[^(\d)]/g,'')" />
					</div>

					<input type="submit" class="btn btn-success" name="submit"
						value="Submit" /> <input type="button" class="btn btn-success"
						onclick="window.location.href = '/B2B-FinalProject/index.jsp'"
						value="Back" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>