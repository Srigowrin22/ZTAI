<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNUP</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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

input[type="text"], input[type="email"], input[type="password"], input[type="phone"],
	input[type="submit"], select {
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
	input[type="phone"]:hover, select:hover {
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

.captcha-box {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.captcha-text {
	padding: 10px;
	background-color: #333;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: 2px;
	color: #fff;
}

.alert {
	display: none;
	margin: 20px 0;
	padding: 10px;
	color: white;
	background-color: #f44336; /* Red */
	border-radius: 5px;
}

.image-container {
	margin-left: 100px; /* Space from the left edge */
}

.image-container img {
	max-width: 400px; /* Adjust max width of the image */
	height: auto; /* Maintain aspect ratio */
	border-radius: 5px;
}

.captcha-refresh-button {
	background-color: #333;
	color: white;
	border: none;
	padding: 5px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	margin-left: 10px;
}

.captcha-refresh-button:hover {
	background-color: #555; /* Darker background on hover */
}
</style>
</head>
<body>
	<div class="image-container">
		<img src="images/ztailogo4.png" alt="logo">
	</div>
	<div class="container">
		<h2>Signup</h2>
		<div id="alert" class="alert">Passwords do not match!</div>
		<div id="captchaAlert" class="alert">Captcha is incorrect!</div>
		<form id="signupForm" action="signup" method="post">
			<input type="text" name="ZTAIID" placeholder="ZTAI-ID" required>
			<input type="text" name="name" placeholder="Name" required> <input
				type="email" name="email" placeholder="Email" required> <input
				type="phone" name="phone" placeholder="Phone" required> <input
				type="password" id="password" name="password" placeholder="Password"
				required> <input type="password" id="confirm_password"
				name="confirm_password" placeholder="Re-enter Password" required>

			<div class="captcha-box">
				<span id="captcha" class="captcha-text"></span> <input type="button"
					class="captcha-refresh-button" onclick="generateCaptcha()"
					value="Refresh">
			</div>
			<input type="text" id="captchaInput" name="captchaInput"
				placeholder="Enter Captcha" required> <input type="submit"
				value="Signup">
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script>
    window.onload = function() {
        generateCaptcha();

        document.getElementById('signupForm').addEventListener('submit', function(event) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            var captcha = document.getElementById('captcha').textContent;
            var captchaInput = document.getElementById('captchaInput').value;

            var isFormValid = true;

            if (password !== confirmPassword) {
                event.preventDefault();
                isFormValid = false;
                document.getElementById('alert').style.display = 'block';
                toastr.error('Passwords do not match!');
            } else {
                document.getElementById('alert').style.display = 'none';
            }

            if (captcha !== captchaInput) {
                event.preventDefault();
                isFormValid = false;
                document.getElementById('captchaAlert').style.display = 'block';
                toastr.error('Captcha is incorrect!');
                generateCaptcha();
            } else {
                document.getElementById('captchaAlert').style.display = 'none';
            }

            if (!isFormValid) {
                return false;
            }
        });
    };

    function generateCaptcha() {
        var captchaText = Math.random().toString(36).substring(2, 8).toUpperCase();
        document.getElementById('captcha').textContent = captchaText;
    }
</script>
</body>
</html>
