<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingCalc.aspx.cs" Inherits="myWebApps.Assets.Pages.projects.COMP235.L1_2.ShippingCalc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LO2 Exercise 6</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../../../css/main.css">
</head>
<body>

    <div style="text-align: center">
        <a class="btn toolbtn" href="../../../../../index.html">Home</a>
    </div>
    <h4>LO2 - ASP.NET Framework</h4>
    <h5>Exercise 6 - Shipping Calculator using .NET Framework</h5>
    <form id="form1" runat="server">
        
        <div class="container bcon" style="width: 60%">
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <h6>Quantity</h6>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <h6>Distance</h6>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <h6>Shipping type</h6>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:DropDownList ID="ddnShippingType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropdownShippingType" CssClass="dropDown">
                        <asp:ListItem Selected="True" Value=""></asp:ListItem>
                        <asp:ListItem Value="Ground"> Ground </asp:ListItem>
                        <asp:ListItem Value="Priority Ground"> Priority Ground </asp:ListItem>
                        <asp:ListItem Value="Air"> Air </asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <h6>Shipping type fee</h6>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:Label ID="lblShippingTypeFee" runat="server" Text=""></asp:Label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <h6>Shipping cost</h6>
                </div>
                
                <div class="col-xs-12 col-sm-6 col-md-6" style="color: #e4fd32; font-weight: bolder; font-size: 14pt">
                    <asp:Label ID="lblCostResult" runat="server" Text=""></asp:Label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="color: crimson; font-style: italic">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
