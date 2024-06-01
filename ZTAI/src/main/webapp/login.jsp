<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #071a30; /* Dark background color */
	display: flex;
	justify-content: space-between; /* Space between the image and form */
	align-items: center;
	height: 100vh;
}

.container {
	width: 400px; /* Original size for the form */
	padding: 20px;
	background: #000; /* Black background for the form */
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	color: #fff; /* White text */
	margin-right: 100px;
	/* Positioning the form between center and right */
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #fff; /* White text */
}

input[type="text"], input[type="email"], input[type="password"], input[type="submit"],
	select {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px hidden #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	background: #000; /* Dark background for inputs */
	color: #fff; /* White text for inputs */
	transition: background-color 0.3s, color 0.3s;
	/* Smooth transition for hover effect */
}

input[type="text"]:hover, input[type="email"]:hover, input[type="password"]:hover,
	select:hover {
	background-color: #555; /* Darker background on hover */
}

input[type="submit"] {
	background-color: #4caf50;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.image-container {
	margin-left: 100px; /* Space from the left edge */
}

.image-container img {
	max-width: 400px; /* Adjust max width of the image */
	height: auto; /* Maintain aspect ratio */
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="image-container">
		<img src="images/ztailogo4.png" alt="logo">
	</div>
	<div class="container">
		<h2>Login</h2>
		<form action="login" method="post">
			<input type="text" name="name" placeholder="Name" required> <input
				type="email" name="email" placeholder="Email" required> <input
				type="password" name="password" placeholder="Password" required>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>
