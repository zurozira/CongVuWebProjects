<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="myWebApps.Assets.Pages.projects.COMP235.L1_GET_POST_COOKIE.Part3.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../../../../css/main.css">
</head>
<body>
    <%
        // if var user != admin -> redirect to Rejected.html
        var userCookie = Request.Cookies["login"];
        
        if (userCookie != null)
        {
            var user = userCookie.Value;
            if (!user.Equals("admin"))
            {
                Response.Redirect("Rejected.html");
            }
        }
        else
        {
            Response.Redirect("Rejected.html");
        }
        
    %>
    <div class="container ztoolbar">
        <div style="text-align: center">
            <a class="btn toolbtn" href="../index.html">Home</a>
        </div>
    </div>
    <div class="container bcon">
        <div class="row">
            <div class="col-xs-12 col-md-12">
                You are logged in as admin!
            </div>
        </div>
    </div>
</body>
</html>
