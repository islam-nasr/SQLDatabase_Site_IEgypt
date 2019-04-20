<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteComment.aspx.cs" Inherits="IEgypt.DeleteComment" %>

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
"> <form id="f1" runat="server">
  
	
    <asp:Table ID="Table1" BackColor="YellowGreen" BorderColor="Black" GridLines="Both"  BorderStyle="Solid" runat="server"/>
           
        
        <asp:Button id="B3" runat="server" OnClick="RedirectToDefaule" Text="Return"/>
        <%--<asp:Label id="message" Visible="false" runat="server"/>--%>
	</form>
</body>
</html>