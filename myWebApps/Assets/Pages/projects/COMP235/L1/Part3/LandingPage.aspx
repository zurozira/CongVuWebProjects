<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="myWebApps.Assets.Pages.projects.COMP235.L1_GET_POST_COOKIE.Part3.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Landing Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../../../../css/main.css">
</head>
<body>
    <%
        /* If user login as admin -> user stay here
            if log as guest -> redirect to guest page
        */
        var user = Request.Form["txtUser"];

        if (string.IsNullOrEmpty(user)) // Redirect to Rejected page if user is null or empty
        {
            Response.Redirect("Rejected.html");
            return;
        }
        
        
        Session["user"] = user; // Save user on the server
        // Add cookie
        HttpCookie cookie = new HttpCookie("login", user);
        cookie.Path = "/";
        Response.Cookies.Add(cookie);
        
        if (user.Equals("guest"))
        {
            Response.Redirect("Guest.aspx");
        }
        else if (!user.Equals("admin"))
        {
            Response.Redirect("Rejected.html");
        }
    %>

    <div class="container ztoolbar">
        <div style="text-align: center">
            <a class="btn toolbtn" href="../../../../../../index.html">Home</a>
        </div>
    </div>
    <div>
        <div class="container bcon">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <a class="btn linkbtn" href="Admin.aspx">Admin Page</a>
                    <br/> <br/>
                    <a class="btn linkbtn" href="Guest.aspx">Guest Page</a>
                </div>
            </div>
        </div>
        
        
    </div>
</body>
</html>
