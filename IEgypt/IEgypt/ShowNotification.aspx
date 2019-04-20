<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowNotification.aspx.cs" Inherits="IEgypt.ShowNotification" %>

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
">  <form id="f1" runat="server">
  
	
    <asp:Table ID="Table1" BackColor="YellowGreen" BorderColor="Black" GridLines="Both"  BorderStyle="Solid" runat="server"/>
           
        
        <asp:Button id="B3" runat="server" OnClick="Page_Load" Text="comment table"/>
    
        <%--<asp:Label id="message" Visible="false" runat="server"/>--%>
<%--	</form>
</body>
</html>--%>


            <%--<p>Enter your ID</p>
            <asp:TextBox id="user_idTB" runat="server"/>
            <br>

           --%>
            <br/>
            <asp:Table ID="Table2" BorderColor="Black" BackColor="MediumPurple" Font-Bold="true" runat="server"></asp:Table>
            <%--<asp:Button id="B1" runat="server" OnClick="Show_Notification" Text="Show Notification"/>--%>
            <asp:Button id="B2" runat="server" OnClick="back_to_default" Text="Return"/>
	</form>
</body>
</html>