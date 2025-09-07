<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left {
            width: 50%;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-box {
            width: 70%;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #7d2ae8;
            display: inline-block;
        }

        .input-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ccc;
        }

        .input-group svg {
            width: 20px;
            margin-right: 10px;
            color: #7d2ae8;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            border: none;
            outline: none;
            width: 100%;
            padding: 10px 0;
        }

        .btn {
            width: 100%;
            background-color: #7d2ae8;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .login a {
            color: #7d2ae8;
            text-decoration: none;
        }

        .right {
            width: 50%;
            background: linear-gradient(#7d2ae8, #5a00b1);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 40px;
            text-align: center;
        }

        .right h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .right p {
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <div class="form-box">
            <h2>Signup</h2>
            <form action="../StudentSignupServlet" method="post">
                <div class="input-group">
                    <svg fill="#7d2ae8" viewBox="0 0 24 24"><path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/></svg>
                    <input type="text" name="name" placeholder="Enter your name" required />
                </div>
                <div class="input-group">
                    <svg fill="#7d2ae8" viewBox="0 0 24 24"><path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/></svg>
                    <input type="email" name="email" placeholder="Enter your email" required />
                </div>
                <div class="input-group">
                    <svg fill="#7d2ae8" viewBox="0 0 24 24"><path d="M12 17c1.1 0 2-.9 2-2v-3h-4v3c0 1.1.9 2 2 2zM18 8h-1V6c0-3.3-2.7-6-6-6S5 2.7 5 6v2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-8-2c0-2.2 1.8-4 4-4s4 1.8 4 4v2H10V6z"/></svg>
                    <input type="password" name="password" placeholder="Enter your password" required />
                </div>
                <input class="btn" type="submit" value="Signup" />
                <div class="login">Already have an account? <a href="login.jsp">Login now</a></div>
            </form>
        </div>
    </div>
    <div class="right">
        <h2>Create your free account</h2>
        <p>Start your learning journey today!</p>
    </div>
</div>
</body>
</html>
