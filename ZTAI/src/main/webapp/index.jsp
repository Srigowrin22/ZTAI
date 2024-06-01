<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZS WebTech Session</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	width: 800px;
	margin: 50px auto;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h1 {
	font-size: 2em;
	margin-bottom: 20px;
}

.button-container {
	margin-top: 20px;
	text-align: center;
}

.button-container form {
	display: inline-block;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
	margin: 10px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h1>ZTAI</h1>
		<p>Practice makes a man perfect
		<p>
			<small> - Vince Lombardi </small>
		<div class="button-container">
			<form action="login.jsp">
				<input type="submit" value="login">
			</form>
			<form action="signup.jsp">
				<input type="submit" value="signup">
			</form>
		</div>
	</div>
</body>
</html>
