<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete_Content.aspx.cs" Inherits="IEgypt.Delete_Content" %>

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
"><form id="form1" runat="server">
        <div>
            <asp:GridView ID ="GV" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField ="link" HeaderText ="Link" />
                    <asp:BoundField DataField ="uploaded_at" HeaderText ="Uploaded At" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Delete" OnClick="DeleteContent" runat="server" ID="LB" CommandArgument ='<%# Eval("ID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <br />
            <asp:Button id="Button1" runat="server" OnClick="home" Text="HOME"/>
        </div>
        <div>
            <asp:Label ID="L1" Text="" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
