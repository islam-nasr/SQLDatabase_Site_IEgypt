﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Filter.aspx.cs" Inherits="IEgypt.Filter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
        p{
            color:saddlebrown;
            font-family:'Bookman Old Style';
            font-size:large;
            font-weight:bolder;
            font-style:italic;
            background-color:silver;
            width:275px;
        }
    </style>
    <title></title>
</head>
<body  style="background-image: url('staff1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
        <asp:Table ID="Table1" BackColor="YellowGreen" BorderColor="Black" GridLines="Both"  BorderStyle="Solid" runat="server"/>
           
        
      <%--  <asp:Button id="B1" runat="server" OnClick="RedirectToDefaule" Text="Return"/>--%>
	</form>
</body>
</html>
