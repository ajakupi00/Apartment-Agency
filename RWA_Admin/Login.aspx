<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RWA_Admin.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        #formLogin {
            width: 50%;
        }

        #centerDiv {
            width: 100%;
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #btnLogin {
            width: 100%;
        }

        h2 {
            padding-bottom: 45px;
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
    <div id="centerDiv">
        <form id="formLogin" runat="server">
            <h2 class="text-center">Login</h2>
            <div class="form-group">
                <asp:Label Text="Username" runat="server" />
                <asp:TextBox runat="server" class="form-control" ID="txtUsername" />

            </div>
            <div class="form-group">
                <asp:Label Text="Password" runat="server" />
                <asp:TextBox runat="server" class="form-control" ID="txtPassword" TextMode="Password" />
            </div>
            <asp:Button Text="Login" class="btn btn-warning" runat="server" OnClick="btnLogin_Click" ID="btnLogin" />
        </form>
        <hr class='mt-4'>
        <div class='text-center'>
            <p>RWA-PROJECT-<%: DateTime.Now.Year %>&copy;</p>
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
