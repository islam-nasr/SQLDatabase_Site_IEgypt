<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAds.aspx.cs" Inherits="IEgypt.ManageAds" %>

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
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
"> <form id="form1" runat="server">
       <p class="auto-style1"><strong>Your Advertisements</strong></p>
        
        
        <asp:GridView ID="Table2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="DeleteCommand">
             <Columns>

              <asp:BoundField DataField="id"  HeaderText="ID" />
              <asp:BoundField DataField="description" HeaderText="Description" />
              <asp:BoundField DataField="location" HeaderText="Location" />
            
                 <asp:ButtonField Text="Delete" />
            
        </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
             <RowStyle BackColor="White" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br>
        <strong>Ad ID:
        </strong>&nbsp;<asp:textbox ID="adid1" runat="server"></asp:textbox>
        &nbsp; <strong>Description:
         </strong>&nbsp;<asp:textbox ID="description" runat="server"></asp:textbox>
        &nbsp; <strong>Location:</strong>&nbsp;
         <asp:textbox ID="location" runat="server"></asp:textbox>

        
        &nbsp;&nbsp;

        
        <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="EditClicked"/>
           &nbsp;
           
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
           
    </form>
</body>
</html>

