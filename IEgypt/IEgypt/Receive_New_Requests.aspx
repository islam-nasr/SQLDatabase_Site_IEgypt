<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receive_New_Requests.aspx.cs" Inherits="IEgypt.Receive_New_Requests" %>

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
                            <asp:LinkButton Text="Select" OnClick="record" runat="server" ID="LB" CommandArgument ='<%# Eval("ID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
        </div>
        <div>
            <br />
           <asp:Button id="B1" runat="server" OnClick="RecieveNewRequest" Text="My Requests"/>
            <asp:Button ID="b2" runat="server" OnClick ="home" Text="Home" />

        </div>
        <div>
            <asp:GridView ID = "GV1" runat ="server" AutoGenerateColumns ="true">
            </asp:GridView>
        </div>
        <div>
            <asp:Label ID="L" Text ="" runat="server"></asp:Label>
            <asp:Label ID ="label" Text ="" runat="server"></asp:Label>
        </div>
        
      
    </form>
</body>
</html>

