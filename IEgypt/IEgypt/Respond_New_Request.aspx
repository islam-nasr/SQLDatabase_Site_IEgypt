<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Respond_New_Request.aspx.cs" Inherits="IEgypt.Respond_New_Request" %>

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
        <asp:GridView ID ="GV" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField ="information" HeaderText ="Information" />
                    <asp:BoundField DataField ="viewer_id" HeaderText ="Viewer" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" OnClick="Respond" runat="server" ID="LB" CommandArgument ='<%# Eval("ID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <p>Response</p>
             <asp:TextBox ID="Reply" runat="server"></asp:TextBox>  
        </div>
        <div>
            <br />
            <asp:Button id="B1" runat="server" OnClick="RespondNewRequest" Text="Respond"/>
            <asp:Button id="Button1" runat="server" OnClick="home" Text="HOME"/>
        </div>
        <div>
            <asp:Label runat="server" ID ="L" Visible="false" Text=""></asp:Label>
             <asp:Label runat="server" ID ="L1" Visible="false" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
