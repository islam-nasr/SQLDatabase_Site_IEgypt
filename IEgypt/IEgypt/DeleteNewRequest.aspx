<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteNewRequest.aspx.cs" Inherits="IEgypt.DeleteNewRequest" %>

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
      <title>Delete New Requests</title>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
<form id="form1" runat="server">
       
          
         <p class="auto-style1"><strong>New Requests that you can delete (Didn't go into process yet)</strong></p>
        
        
        <asp:GridView ID="Table3" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="RowCommand1">
             <Columns>

              <asp:BoundField DataField="ID" HeaderText="ID" />
              <asp:BoundField DataField="information" HeaderText="Information" />
              <asp:BoundField DataField="contributor_id" HeaderText="Contributor ID" />
             
            
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

        
       

        <br/>
         <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" />

        
        
    </form>
</body>
</html>
