<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="com.ztai.model.*, java.util.*, com.ztai.database.*, com.ztai.action.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Todo List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

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
        function toggleStrikeThrough(event, tid) {
            const checkbox = event.target;
            const listItem = checkbox.closest('.list-group-item');
            const completed = checkbox.checked;
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "updateTodo", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("tid=" + tid + "&completed=" + completed);
            if (completed) {
                listItem.classList.add('text-decoration-line-through');
            } else {
                listItem.classList.remove('text-decoration-line-through');
            }
        }
        
        
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

/* card styling */
.card {
	background-color: black;
	color: #fff;
}

.container {
	background-color: #000;
}

.list-group-item {
	background-color: #000;
	color: #fff;
}

.list-group-item:hover {
	background-color: #444;
}
</style>
</head>
<body>
	<% Candidates cand = Candidates.getCand();  %>

	<header class="header">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-2">
					<img src="images/ztailogo3.png" alt="Logo" class="logo">
				</div>
				<div class="col-md-8">
					<nav class="nav">
						<a class="nav-link" href="candDashboard.jsp">Home</a> <a
							class="nav-link" href="#">About</a> <a class="nav-link" href="#">Ask
							ztai</a> <a class="nav-link" href="#">Assignments</a> <a
							class="nav-link" href="todo.jsp">TODO</a>
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
							<h4><%= cand.getName() %></h4>
							<p>
								Email:
								<%= cand.getEmail() %></p>
							<hr>
							<h4>
								ZTAI:
								<%= cand.getZTAIID() %></h4>
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

	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 15px;">
					<div class="card-body p-5">
						<h6 class="mb-3">Todo List:</h6>

						<form action="addTodo" method="post"
							class="d-flex justify-content-center align-items-center mb-4">
							<input type="hidden" name="ZTAIID"
								value="<%= cand.getZTAIID() %>" />
							<div data-mdb-input-init class="form-outline flex-fill">
								<input type="text" name="todoNote"
									class="form-control form-control-lg"
									placeholder="What do you need to do today?" />
							</div>
							<button type="submit" class="btn btn-primary btn-lg ms-2">Add</button>
						</form>

						<h2>Existing Todos:</h2>
						<ul class="list-group mb-0">
							<%
                                String ZTAIID = cand.getZTAIID();
                                List<String> todoo = Database.getInstance().getTodo(ZTAIID);
                                if (todoo != null) {
                                    for (String item : todoo) {
                                        String[] parts = item.split(":");
                                        int tid = Integer.parseInt(parts[0]);
                                        String todoNote = parts[1];
                                        boolean completed = Boolean.parseBoolean(parts[2]);
                                        
                            %>
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-start-0 border-top-0 border-end-0 border-bottom rounded-0 mb-2 <%= completed ? "text-decoration-line-through" : "" %>">
								<div class="d-flex align-items-center">
									<input class="form-check-input me-2" type="checkbox" value=""
										aria-label="..."
										onclick="toggleStrikeThrough(event, <%= tid %>)"
										<%= completed ? "checked" : "" %> /> <span><%= todoNote %></span>
								</div>
								<form action="deleteTodo" method="post" style="display: inline;">
									<input type="hidden" name="tid" value="<%= tid %>" />
									<button type="submit" class="btn btn-link p-0 m-0"
										data-mdb-tooltip-init title="Remove item">
										<i class="bi bi-x"></i>
									</button>
								</form>
							</li>
							<%
                                    }
                                }
                            %>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
   </script>
</body>
</html>
