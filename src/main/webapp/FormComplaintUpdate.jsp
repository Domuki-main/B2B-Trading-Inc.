<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<title>Updating a complaint</title>
<script type="text/javascript">
	function validateForm() {
		if (document.myForm.complaintid.value == null
				|| document.myForm.complaintid.value == "") {
			alert("Please key-in complaint id");
			return false;
		}
		if (document.myForm.department.checked == false
				|| document.myForm.department.value == "") {
			alert("Please choose a department");
			return false;
		}
		if (document.myForm.issue.checked == false
				|| document.myForm.issue.value == "") {
			alert("Please choose a issue");
			return false;
		}
		if (document.myForm.state.checked == false
				|| document.myForm.state.value == "") {
			alert("Please choose a state");
			return false;
		}
		if (document.myForm.subject.value == null
				|| document.myForm.subject.value == "") {
			alert("Please input the subject");
			return false;
		}

		if (document.myForm.message.value == null
				|| document.myForm.message.value == "") {
			alert("Please input the message");
			return false;
		}

		if (document.myForm.email.value == null
				|| document.myForm.email.value == "") {
			alert("Please key-in email");
			return false;
		}
	}
</script>
<body>
	<div class="container">
		<h2>Complaint Details</h2>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form name="myForm" action="Controller?action=UPDATE"
					onSubmit="return validateForm()" method="post">
					
					
					<div class="form-group">
						Complaint ID: <input type="text" class="form-control"
							name="complaintid" placeholder="Enter Complaint ID"
							value="${complaint.complaintid}" onkeyup="value=value.replace(/[^(\d)]/g,'')" />
					</div>

					<c:set var="department" value="${complaint.department}" />
					Which department did you do business with?
					<div class="form-group">
						<input type="radio" name="department" value="Sales"
							<c:if test="${complaint.department=='Sales'}">checked</c:if>>Sales
					</div>
					<div class="form-group">
						<input type="radio" name="department" value="Marketing"
							<c:if test="${complaint.department=='Marketing'}">checked</c:if>>Marketing
					</div>
					<div class="form-group">
						<input type="radio" name="department" value="Accounting"
							<c:if test="${complaint.department=='Accounting'}">checked</c:if>>Accounting
					</div>
					<div class="form-group">
						<input type="radio" name="department" value="Customer Service"
							<c:if test="${complaint.department=='Customer Service'}">checked</c:if>>Customer
						Service
					</div>

					<c:set var="issue" value="${complaint.issue}" />
					My complaint involves:
					<div class="form-group">
						<input type="radio" name="issue" value="A Pre-Purchase Problem"
							<c:if test="${complaint.issue=='A Pre-Purchase Problem'}">checked</c:if>>A
						Pre-Purchase Problem
					</div>
					<div class="form-group">
						<input type="radio" name="issue" value="A Post-Purchase Problem"
							<c:if test="${complaint.issue=='A Post-Purchase Problem'}">checked</c:if>>A
						Post-Purchase Problem
					</div>
					<div class="form-group">
						<input type="radio" name="issue" value="A problem during purchase"
							<c:if test="${complaint.issue=='A problem during purchase'}">checked</c:if>>A
						problem during purchase
					</div>
					<div class="form-group">
						<input type="radio" name="issue" value="Other Problem"
							<c:if test="${complaint.issue=='Other Problem'}">checked</c:if>>Other
						Problem
					</div>

					<c:set var="state" value="${complaint.state}" />
					State of Residence:
					<div class="form-group">
						<select name="state">
						<option value="" <c:if test="${complaint.state==''}">selected</c:if>> Choose your State or Residence </option>
							<option value="Johor"
								<c:if test="${complaint.state=='Johor'}">selected</c:if>>Johor</option>
							<option value="Kedah"
								<c:if test="${complaint.state=='Kedah'}">selected</c:if>>Kedah</option>
							<option value="Kelantan"
								<c:if test="${complaint.state=='Kelantan'}">selected</c:if>>Kelantan</option>
							<option value="Selangor"
								<c:if test="${complaint.state=='Selangor'}">selected</c:if>>Selangor</option>
							<option value="Sabah"
								<c:if test="${complaint.state=='Sabah'}">selected</c:if>>Sabah</option>
							<option value="Sarawak"
								<c:if test="${complaint.state=='Sarawak'}">selected</c:if>>Sarawak</option>
							<option value="Pahang"
								<c:if test="${complaint.state=='Pahang'}">selected</c:if>>Pahang</option>
							<option value="Melaka"
								<c:if test="${complaint.state=='Melaka'}">selected</c:if>>Melaka</option>
							<option value="Terengganu"
								<c:if test="${complaint.state=='Terengganu'}">selected</c:if>>Terengganu</option>
							<option value="Wilayah Persekutuan"
								<c:if test="${complaint.state=='Wilayah Persekutuan'}">selected</c:if>>Wilayah
								Persekutuan</option>
							<option value="Negeri Sembilan"
								<c:if test="${complaint.state=='Negeri Sembilan'}">selected</c:if>>Negeri
								Sembilan</option>
							<option value="Perlis"
								<c:if test="${complaint.state=='Perlis'}">selected</c:if>>Perlis</option>
						</select>
					</div>

					<div class="form-group">
						Subject * <input type="text" class="form-control" name="subject"
							maxlength='50' placeholder="Enter the Subject" value="${complaint.subject}" />
					</div>
					<div class="form-group">
						Message * <input type="text" class="form-control" name="message"
							maxlength='200' placeholder="Enter the Message" value="${complaint.message}" />
					</div>
					<div class="form-group">
						<p>Please enter your email if you'd like us to follow up with
							you</p>
						<input type="text" class="form-control" name="email"
							maxlength='30' placeholder="Enter your Email" value="${complaint.email}" />
					</div>

					<input type="submit" class="btn btn-success"
						onclick="return confirm('Are you sure you want to update the data?');"
						name="submit" value="Update" /> <input type="button"
						class="btn btn-success"
						onclick="window.location.href = '/B2B-FinalProject/index.jsp'"
						value="Back" />

					<p>
						<span id="datetime"></span>
					</p>

					<script type="text/javascript">
						var dt = new Date();
						document.getElementById("datetime").innerHTML = dt
								.toLocaleString();
					</script>
				</form>
			</div>
		</div>
	</div>
</body>
</html>