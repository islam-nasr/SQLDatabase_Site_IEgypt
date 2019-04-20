<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload_New_Content.aspx.cs" Inherits="IEgypt.Upload_New_Content" %>

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
            <p>Subcategory</p>
             <asp:TextBox ID="SC" runat="server"></asp:TextBox> 
        </div>
        <div>
            <p>Category</p>
             <asp:TextBox ID="C" runat="server"></asp:TextBox> 
        </div>
        <div>
            <p>Link</p>
             <asp:TextBox ID="Link" runat="server"></asp:TextBox> 
        </div>
        <div>
            <asp:GridView ID="GV" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Accepted_at" HeaderText ="Accepted at" />
                    <asp:BoundField DataField="information" HeaderText ="Information" />
                    
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:LinkButton ID="B1" Text="Upload" runat="server" OnClick="Button" CommandArgument ='<%# Eval("ID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
         </div>
        <div> 
            <asp:Label ID="L1" Text="" runat="server"></asp:Label>
        </div>
        
        <div>
            <br />
             <asp:Button id="B1" runat="server" OnClick="home" Text="Home"/>
        </div>
    </form>
</body>
</html>

