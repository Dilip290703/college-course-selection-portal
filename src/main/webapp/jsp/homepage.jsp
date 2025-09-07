<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>University Portal - Home</title>
    <link rel="stylesheet" type="text/css" href="/Login/css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            text-align: center;
        }

       .header {
           display: flex;
   		   justify-content: center;
           align-items: center;
           padding: 20px 0;
           background-color: #fff;
       }

       .logo {
           max-height: 60px;
           object-fit: contain;
       }


        .main-container {
            max-width: 1000px;
            margin: auto;
            padding: 30px;
        }

        .hero-img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }

        .welcome-text {
            font-size: 28px;
            margin-top: 30px;
            color: #222;
        }

        .description {
            font-size: 18px;
            margin: 15px auto 40px;
            color: #555;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .btn-purple {
            padding: 14px 30px;
            background-color: #6a0dad;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            text-decoration: none;
        }

        .btn-purple:hover {
            background-color: #5800a1;
        }

        .stats {
            display: flex;
            justify-content: space-around;
            padding: 20px 0;
            font-size: 18px;
            font-weight: bold;
            color: #333;
            border-top: 1px solid #eee;
        }
    </style>
</head>
<body>

   <div class="header">
    <img src="../images/logo.png" alt="MIT-WPU" class="logo">
</div>
   

    <div class="main-container">
       <img src="../images/img.jpg" class="hero-img" alt="University Students">

        <div class="welcome-text">Welcome to the University Portal</div>
        <div class="description">
            Access our universitys resources and services. Login to get started.
        </div>

        <div class="btn-group">
            <a href="login.jsp" class="btn-purple">Student Login</a>
            <a href="admin_login.jsp" class="btn-purple">Admin Login</a>
        </div>

        <div class="stats">
            <div>1200+<br/>Total Students</div>
            <div>150+<br/>Faculties</div>
            <div>300+<br/>Courses</div>
        </div>
    </div>

</body>
</html>
