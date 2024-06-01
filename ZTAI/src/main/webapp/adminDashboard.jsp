<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ztai.model.*, java.util.*, com.ztai.database.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
	
</script>
<script>
window.onload = function() {
    var paragraph = document.getElementById("transition-paragraph");
    var text = paragraph.innerText;
    paragraph.innerText = ""; // Clear original text

    for (var i = 0; i < text.length; i++) {
        (function(i) {
            var span = document.createElement("span");
            span.className = "letter";
            if (text[i] === " ") {
                span.innerHTML = "&nbsp;";
            } else {
                span.innerText = text[i];
            }
            span.style.animationDelay = (i * 0.1) + "s";
            paragraph.appendChild(span);
        })(i);
    }
};


document.addEventListener('DOMContentLoaded', function() {
    const profile = document.querySelector('.profile');
    const profileInfo = document.querySelector('.profile-info');

    profile.addEventListener('click', function(event) {
        event.stopPropagation();
        profileInfo.style.display = (profileInfo.style.display === 'block') ? 'none' : 'block';
    });

    document.addEventListener('click', function(event) {
        if (!profile.contains(event.target) && !profileInfo.contains(event.target)) {
            profileInfo.style.display = 'none';
        }
    });
});

</script>
<title>Admin-Dashboard</title>
<style>
body {
	background-color: #000; /* Black background */
	color: #fff; /* White text */
}

.header {
	background-color: rgb(7, 33, 61); /* Dark gray header */
	padding: 5px 0;
}

.logo {
	max-width: 100px;
}

.nav .nav-link {
	color: #fff; /* White text for nav links */
	margin: 0 10px;
	transition: color 0.3s;
}

.nav .nav-link:hover {
	color: #f0ad4e; /* Change color on hover */
}

.btn-primary {
	background-color: #f0ad4e;
	border-color: #f0ad4e;
}

.btn-primary:hover {
	background-color: #ec971f;
	border-color: #d58512;
}

.btn-secondary {
	background-color: #5bc0de;
	border-color: #46b8da;
}

.btn-secondary:hover {
	background-color: #31b0d5;
	border-color: #269abc;
}

.content {
	padding: 20px 0;
}

h5 {
	color: #333;
	font-size: 24px;
}

p {
	font-size: 16px;
	color: #666;
}

#transition-paragraph {
	margin: 0; /* Remove default margin */
	padding-top: 140px;
	color: white;
	text-align: center; /* Center the text inside the element */
}

/* Styling for each letter */
.letter {
	display: inline-block;
	opacity: 0;
	transform: translateX(100%);
	animation: fadeIn 1s forwards;
}

/* Keyframes for the fade-in effect */
@
keyframes fadeIn {to { opacity:1;
	transform: translateX(0);
}

}

/* new code started  */
.profile-bug {
	display: flex;
	align-items: center;
	gap: 30px;
}

.profile-bug .profile {
	width: 50px;
	height: 50px;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-radius: 50%;
	background-color: #431f97;
}

.profile-bug .profile .profile-info {
	position: absolute;
	cursor: default;
	top: 60px;
	right: 5px;
	width: 400px;
	height: 300px;
	z-index: 1;
	border-radius: 10px;
	padding: 20px;
	border: 10px solid rgb(58, 58, 58);
	background-color: #181818;
	display: none;
}

.profile-bug .profile .profile-info #logout {
	text-decoration: none;
	color: #ffffff;
	background-color: rgb(0, 89, 190);
	padding: 10px 145px;
}

.bug {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #252525;
	border: 1px solid grey;
	margin-left: 100px;
}

.profile-bug .offcanvas {
	color: #ffffff;
	width: 700px; /* Reduced width to half of a typical 13-inch screen */
	background-color: #252525;
}

.profile-bug .offcanvas .offcanvas-header {
	border-bottom: 1px solid grey;
	padding: 12px;
}

.profile-bug .offcanvas .report-form {
	display: flex;
	flex-direction: column;
	align-items: start;
	gap: 10px;
	padding: 30px;
}

.profile-bug .offcanvas .report-form input, textarea#description {
	width: 100%;
	padding: 10px;
	height: 40px;
	color: #ffffff;
	background-color: #141414;
	border: 1px solid rgb(46, 46, 46);
}

.profile-bug .offcanvas .report-form textarea#description {
	height: 150px;
}

.profile-bug .offcanvas .report-form #file {
	height: 50px;
}

.profile-bug .offcanvas .report-form #submit {
	padding: 10px 20px;
	margin-top: 20px;
	border: none;
	color: #ffffff;
	border-radius: 5px;
	background-color: rgb(0, 89, 190);
}

.profile-bug .offcanvas .report-form #submit:hover {
	background-color: rgb(0, 66, 141);
}

/* Keyframes for the fade-in effect */
@
keyframes fadeIn {to { opacity:1;
	transform: translateX(0);
}
}
</style>
</head>
<body>
	<% Admin admin = Admin.getAdmin();  %>

	<header class="header">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-2">
					<img src="images/ztailogo3.png" alt="Logo" class="logo">
				</div>
				<div class="col-md-8">
					<nav class="nav">
						<a class="nav-link" href="adminDashboard.jsp">Home</a> <a
							class="nav-link" href="#">About</a> <a class="nav-link" href="#">Ask
							ztai</a> <a class="nav-link" href="#">Assignments</a> <a
							class="nav-link" href="edit.jsp">EDIT</a>
					</nav>
				</div>

				<div class="col-md-2 text-right profile-bug">
					<button class="btn btn-primary bug" style="margin-left: -10px"
						type="button" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
						<i class="bi bi-bug-fill" style="font-size: 20px;"></i>
					</button>

					<div class="profile">
						<i class="bi bi-person" style="font-size: 20px;"></i>

						<div class="profile-info">
							<h4><%= admin.getName() %></h4>
							<p>
								Email:
								<%= admin.getEmail() %></p>
							<hr>
							<h4>
								ZTAI:
								<%= admin.getZTAIID() %></h4>
							<hr>
							<br> <a href="#" id="logout">Logout</a>
						</div>
					</div>

					<div class="offcanvas offcanvas-end" tabindex="-1"
						id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
						<div class="offcanvas-header">
							<h4 id="offcanvasRightLabel">&nbsp Report an Issue</h4>
							<button type="button" class="btn-close text-reset"
								style="background-color: white;" data-bs-dismiss="offcanvas"
								aria-label="Close"></button>
						</div>

						<div class="report-form">
							<h6>Title &nbsp;*</h6>
							<input type="text" name="title" id="title"
								placeholder="Enter title"> <br>
							<h6>Description &nbsp;*</h6>

							<textarea type="text" name="description" id="description"
								placeholder="Describe your issue in detials with context that can help use to resolve the issue"></textarea>
							<br> <input type="file" name="file" id="file">

							<button id="submit">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="content">
		<div class="container">
			<h5>Welcome to the Dashboard</h5>

			<h1 id="transition-paragraph">
				Welcome
				<%= admin.getName() %>, this is your main dashboard page!
			</h1>

		</div>
	</div>

	<!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>-->
</body>
</html>