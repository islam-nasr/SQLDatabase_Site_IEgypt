<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCategorySub.aspx.cs" Inherits="IEgypt.CreateCategorySub" %>

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
    <form id="f8" runat="server">
            <p style:"b"> Category name</p>
            <asp:TextBox id="category_nameTB" runat="server"/>
            <br/>
        <p>  Sub-Category name</p>
            <asp:TextBox id="subcategory_nameTB" runat="server"/>
            <br/>
            
            <br/>
            <asp:Button id="B3" runat="server" OnClick="Add" Text="Create"/>
        <asp:Button id="B4" runat="server" OnClick="back_to_default" Text="Return"/>
<asp:Table ID="Table6" BackColor="MediumSeaGreen" BorderColor="Black" ForeColor="Black" BorderStyle="Double" runat="server"> </asp:Table>
          <%-- <asp:Label ID="Label1" runat="server" Text="Complete All Information!  " BackColor="Red" ForeColor="White" Visible ="false" />--%>
          
	</form>
</body>
</html>

