<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageError.aspx.cs" Inherits="RWA_Admin.PageError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>404 Error Page</title>

    <style>
        body{
            background: url("https://img.freepik.com/free-photo/swimming-pool-bubble-bath-relaxing-summer-hot-day-bird-eye-view-angle_258335-3626.jpg?w=2000");
            height: 100vh;
            background-size: cover;
            background-repeat: no-repeat;
            box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.1);

        }

        #content{
            height:90%;
        }

        #error{
            padding-left: 10px;
            border-left: 2.5px solid #d62828;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #D49B54;">
        <a class="navbar-brand" href="#">
            <img src="Images/navigator.png" width="35" height="35" class="d-inline-block align-top" id="logo" />
            RWA Apartments
        </a>
    </nav>

    <div class="d-flex align-items-center justify-content-center" id="content" >
        <div class="container d-flex flex-column align-items-center ">
            <h1 class="h1 mb-4">Lost your way?</h1>
            <p>Sorry, we can't find that page. You'll find loads to explore on the home page.</p>
            <span id="error">Error code: <strong>404</strong></span>
            <a class="btn btn-light mt-3" style="border:none; border-radius: 50px; padding-inline: 125px; padding-block: 8px;" href="Login.aspx">Return back</a>
        </div>
    </div>
</body>

<!-- JQUERY -->
<script src="Scripts/jquery-3.6.0.min.js"></script>
<!-- BOOTSTRAP -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</html>
