<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="jQueryFunction.js"></script>
<title>Add Patient</title>

<style type="text/css">
input, select {
	margin: 5px;
	width: 150px;
}

table {
	width: 75%;
	height: auto;
	text-align: center;
}

div.dimen {
	border: 2px solid black;
	margin-left: 25%;
	text-align: center;
	padding: 4px;
	width: 50%;
}

tr, td {
	margin: 4px;
}
</style>
</head>

<body>
	<div class="dimen">
		<h1>
			<label id="title">${title}</label>
		</h1>
		<hr>
		<a href="home" style="margin-right: 40px;">${dashboard}</a> <a
			href="patients">${patients}</a><br> <input type="button"
			id="Back" value="BACK" style="float: left;"
			onclick="window.location.href='patients'"><br>
		<h3>
			<strong><label>Add Patient</label></strong>
		</h3>

		<form action="addpatients">
			<div>


				<label>Name</label> <input type="text" required="required" id="name"
					name="name"> <label>Birth</label> <input type="date"
					required="required" placeholder="dd-mm-yyyy" id="birth"
					name="birth"> <label>Document</label> <input type="number"
					required="required" id="document" name="document">

				<div style="float: center; color: red;">
					<p id="error"></p>${error}</div>

				<input type="submit" id="add" name="add" value="ADD"
					style="width: auto; float: center;">

			</div>
		</form>
	</div>

	<script type="text/javascript">
		function validate() {
			document.getElementById("error").style.display = "none";
			var name = document.getElementById("name");
			var birth = document.getElementById("birth");
			var docs = document.getElementById("document");

			var nameValid = true;
			var birthValid = true;
			var dcosValid = true;

			var valid = true;

			if (name.value.length<3 || firstName.value.length>20) {
				valid = false;
			} else if (docs.value.length<3 || firstName.value.length>20) {
				valid = false;
			}
			if (!valid) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Name / Document must be at least 3 characters long";
			} else {
				document.getElementById("error").innerHTML = "Invalid Input";
			}
			return valid;

			/*             Name must be at least 3 characters long; 
			 Name is mandatory; 
			 Birth is mandatory; 
			 Document is mandatory; 
			 Document must be at least 3 characters long; 
			 Invalid birth date; 
			 */
		}
	</script>
</body>
</html>
