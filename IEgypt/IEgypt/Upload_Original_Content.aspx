<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload_Original_Content.aspx.cs" Inherits="IEgypt.Upload_Original_Content" %>

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
        <div  >
            <p> Type</p>
            <asp:TextBox ID ="TypeTB" runat="server">   </asp:TextBox>
       </div>
        <div> 
            <p> Subcategory</p>
            <asp:TextBox ID ="Subcategory" runat="server">   </asp:TextBox>
        </div>
        <div> 
            <p> Category</p>
            <asp:TextBox ID ="Category" runat="server">   </asp:TextBox>
        </div>
    
        <div>
            <p> Link</p>
             <asp:TextBox ID ="Link" runat="server">   </asp:TextBox>
        </div>
        <div>
            <asp:Label ID="L1" runat="server" Text=""></asp:Label> 
        </div>
        <div>
            <asp:Button id="B1" runat="server" OnClick="UploadOriginalContent" Text="Upload Original Content"/>
            <asp:Button id="Button1" runat="server" OnClick="home" Text="HOME"/>
        </div>
    </form>
</body>
</html>
