<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show_Event.aspx.cs" Inherits="IEgypt.Show_Event" %>

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
            <asp:GridView ID="GV" runat="server" AutoGenerateColumns="false">
                <Columns>
                    
                    <asp:BoundField DataField="description" HeaderText ="Description" />
                    <asp:BoundField DataField ="timee" HeaderText="Time" />
                    <asp:BoundField DataField ="entertainer" HeaderText ="Entertainer" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="select" Text="SELECT" runat="server" OnClick="select_Clicked" CommandArgument ='<%# Eval("ID")%>' ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Label Id="L1" Text ="" Visible="false" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Button ID="B1" runat ="server" OnClick ="showall" Text ="Show All Information" />
            <asp:Button id="Button1" runat="server" OnClick="home" Text="HOME"/>
        </div>
        <div>
           <asp:GridView ID ="GV1" runat="server" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </form>
</body>
</html>

