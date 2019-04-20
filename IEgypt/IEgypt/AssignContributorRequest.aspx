<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignContributorRequest.aspx.cs" Inherits="IEgypt.AssignContributorRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
   
</head>
<body  style="background-image: url('staff1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="f1" runat="server">
  
	
    <asp:Table ID="Table1" BackColor="YellowGreen" BorderColor="Black" GridLines="Both"  BorderStyle="Solid" runat="server"/>
    <asp:Table ID="Table2" BackColor="YellowGreen" BorderColor="Black" GridLines="Both"  BorderStyle="Solid" runat="server"/>
           
        
        <asp:Button id="B3" runat="server" OnClick="RedirectToDefaule" Text="Return"/>
        <asp:Button id="B4" runat="server" OnClick="Assign" Text="Assign"/>
        <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Visible="false" Text="Label"></asp:Label>
       
	</form>
</body>
</html>