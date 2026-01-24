<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PizzaProcessingPOST.aspx.cs" Inherits="myWebApps.Assets.Pages.projects.COMP235.L1_GET_POST_COOKIE.Part1.PizzaProcessingPOST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PizzaProcessingPOST</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../../../../css/main.css">
</head>
<body>

    <div class="container ztoolbar">
        <div style="text-align: center">
            <a class="btn toolbtn" href="../../../../../../index.html">Home</a>
        </div>
    </div>

    <% var allFormData = Request.Form;
        

        var name = Request.Form["txtUser"];

        // Get and calculate toppings
        var toppingDic = new Dictionary<string, int> // Map in Java
        {
           { "Pepperoni", 1 },
           { "Green pepper", 1 },
           { "Ham", 1 },
           { "Pineapple", 1 }

        };
        var totalTopping = 0;
        var toppingFormat = "No topping";
        var toppings = Request.Form["toppingType"]; // This one will get the whole list as 1 string only
        if (!string.IsNullOrEmpty(toppings)) // Make sure to check since checkbox can be null
        {
            var toppingArray = toppings.Split(','); // This one is to split each one to make an array
            // var toppingFormat = string.Join(", ", splitFormat);
            toppingFormat = string.Join(", ", toppingArray); // Connect the elements in the array to another format as a string

            // Calculate
            foreach (var top in toppingDic)
            {
                foreach (var top2 in toppingArray)
                {
                    if (top.Key.Equals(top2))
                    {
                        totalTopping += top.Value;
                    }
                }
            }
        }

        // Get and calculate size
        var size = Request.Form["size"];
        var sizeDic = new Dictionary<string, int> // If want to ignore case: var sizeDic = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase)
        {
           { "small", 10 },
           { "medium", 13 },
           { "large", 15 }
        };
        var sizePrice = 0;
        if (!string.IsNullOrEmpty(size)) // Even it is radio, we need to check null since radio can be empty when first start page
        {
            sizePrice = sizeDic[size]; // Because size is radio, only choose 1 at a time so we can get it as an element
            // sizeDic.TryGetValue(size, out sizePrice); // Use this one if not sure if is null or not
        }
        else
        {
            // Show alert and redirect back to PizzaRequestPOST.html
            Response.Write("<script>alert('Please select pizza size');window.location.href='PizzaRequestPOST.html'</script>");
        }

        var total = totalTopping + sizePrice;
    %>

    <div class="container bcon">
        <div class="row">
            <div class="col-xs-12 col-md-12">
                <% Response.Write(allFormData); %>
            </div>
        </div>
    </div>

    <br/>

    <div class="container bcon">
        <div class="row">
            <div class="col-xs-12 col-md-12">
                Hi <a class="ztext"><% Response.Write(name); %></a>! You ordered a <a class="ztext"><% Response.Write(size); %></a> pizza with:
                <br />
                <a class="ztext"><% Response.Write(toppingFormat); %></a>
            </div>
        </div>
    </div>

    <br/>

    <div class="container bcon">
        <div class="row">
            <div class="col-xs-12 col-md-12">
                Your total is <a class="ztext">$<% Response.Write(total); %></a>
            </div>
        </div>
    </div>
</body>
</html>
