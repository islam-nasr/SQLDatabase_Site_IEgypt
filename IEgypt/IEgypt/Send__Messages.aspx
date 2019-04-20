<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send__Messages.aspx.cs" Inherits="IEgypt.Send__Messages" %>

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
"> <form id="form1" runat="server">
        <div>
            <p> Text </p>
             <asp:TextBox ID ="text" runat = "server"> </asp:TextBox>
        </div>
        <div>
           <p>Viewer</p>
           <asp:TextBox ID ="VID" runat = "server"> </asp:TextBox>
        </div>
       
        <div>
            <asp:Button ID ="b1" runat="server" OnClick="SendMessages" Text="Send" /> 
            <asp:Button ID="b2" runat="server" OnClick="home" Text="HOME"  ></asp:Button>
            <asp:Label ID="L1" runat="server" Text="" />
        </div>
    </form>
</body>
</html>

            

