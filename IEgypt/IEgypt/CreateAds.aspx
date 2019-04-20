<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAds.aspx.cs" Inherits="IEgypt.CreateAds" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
         <title>Create Ads</title>
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
 
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {}
    </style>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
        <p class="auto-style1"><strong>Enter Ad description/location</strong></p>
        <p class="auto-style2">&nbsp;<strong>Description: </strong> </p>
        <asp:TextBox id="Description" runat="server"/>
            <br>
        
        <p class="auto-style7"><strong>Location:</strong></p>
        <asp:TextBox id="Location" runat="server"/>
            <br />
            <br>
       
         
         <asp:Button id="button1" runat="server" Text="Create" OnClick="button1Clicked" CssClass="auto-style2" Width="68px" />
        <br>
       <br>
       <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" CssClass="auto-style1" Width="51px" />
    
    </form>
</body>
</html>

