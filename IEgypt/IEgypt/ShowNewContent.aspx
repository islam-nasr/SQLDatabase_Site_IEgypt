<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowNewContent.aspx.cs" Inherits="IEgypt.ShowNewContent" %>

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
  <title>Show New Content</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
     <form id="form1" runat="server">
         <strong><span class="auto-style1">New Content that you ordered<br />
         *By clicking on the contributor&#39;s name you will be redirected to his/her profile<br />
         </span></strong>
         <br />
         <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="False"  Height="109px"  Width="38px" CellPadding="4"  BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black" OnRowCommand="NameClicked">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="New Content ID" />
            <asp:BoundField DataField="information" HeaderText="Information" />
            <asp:BoundField DataField="contributor_id" HeaderText="Contributor ID" />
            <asp:ButtonField DataTextField="full_name" HeaderText="Full Name" />
            
        </Columns>

          

             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
             <RowStyle BackColor="White" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="Gray" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />

          

    </asp:GridView>
        
         <br />
         <br />
         <strong><br />
         <br />
         </strong>
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back" />
    </form>
</body>
</html>
