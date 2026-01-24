<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentCalc.aspx.cs" Inherits="myWebApps.Assets.Pages.projects.COMP235.L1_2.PaymentCalc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Calculator</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="../../../../css/main.css">
</head>
<body>

    <div style="text-align: center">
        <a class="btn toolbtn" href="index.html">Home</a>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="container bcon">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    Price
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    Down Payment
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtDownPayment" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    Interest Rate
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtInterestRate" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click"/>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="color: crimson; font-style: italic">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <asp:ListBox ID="lbxMonthlyPayment" runat="server" CssClass="listBoxu"></asp:ListBox>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
