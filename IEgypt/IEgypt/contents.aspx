<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contents.aspx.cs" Inherits="IEgypt.contents" %>

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
    <form id="f1" runat="server">
            <p>Content Type</p>
            <asp:TextBox id="Content_typeTB" runat="server"/>
            <br>
            
            <br>
            <asp:Button id="B1" runat="server" OnClick="AddContent" Text="Add Content"/>
        <asp:Button id="b2" runat="server" OnClick="back_to_default" Text="Return"/>
           
        
          <asp:Table ID="Table2" BorderStyle="Solid" BackColor="YellowGreen" Font-Bold="true" Visible="true" runat="server"></asp:Table>

 
    </form>
   <%-- <asp:Label ID="Label1" runat="server" " BackColor="Red" ForeColor="White" Visible="false"/>
            <asp:Label ID="Label2" runat="server" " BackColor="MediumAquamarine" ForeColor="White" Visible="false"/>--%>
</body>
</html>