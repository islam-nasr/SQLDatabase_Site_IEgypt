<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestContentPlace.aspx.cs" Inherits="IEgypt.RequestContentPlace" %>

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
"><form id="f1" runat="server">
   <asp:Button ID="Button1" runat="server" OnClick="RedirectToDefaule" Text="Return" />          
        
          <asp:Table ID="Table7" BorderStyle="Solid" BackColor="YellowGreen" Font-Bold="true" Visible="true" runat="server"></asp:Table>
	</form>
   <%-- <asp:Label ID="Label1" runat="server" " BackColor="Red" ForeColor="White" Visible="false"/>
            <asp:Label ID="Label2" runat="server" " BackColor="MediumAquamarine" ForeColor="White" Visible="false"/>--%>
</body>
</html>

