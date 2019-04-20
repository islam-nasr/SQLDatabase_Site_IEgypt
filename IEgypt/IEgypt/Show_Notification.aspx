<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show_Notification.aspx.cs" Inherits="IEgypt.Show_Notification" %>

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
    <body  style="background-image: url('contri2.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
        <form id="form1" runat="server">
       
           
        <div>
          <asp:Button id="B1" runat="server" OnClick="ShowNoti" Text="My Notifications"/>
          <asp:Button id="Button1" runat="server" OnClick="home" Text="HOME"/>
        </div>
        <div>
            <asp:GridView ID = "GV2" runat ="server" AutoGenerateColumns ="true">
            </asp:GridView>
        </div>
        
    </form>
</body>
</html>
