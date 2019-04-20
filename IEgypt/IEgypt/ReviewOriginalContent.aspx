<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewOriginalContent.aspx.cs" Inherits="IEgypt.ReviewOriginalContent" %>

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
   <title>Rate Original Content</title>
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
        }
        .auto-style3 {
            font-weight: 700;
        }
    </style>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">

    <form id="form1" runat="server">
       
        <p class="auto-style1"><strong>Original Content</strong></p>
        <asp:GridView ID="Table" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
          <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="link" HeaderText="Link" SortExpression="link" />
            <asp:BoundField DataField="uploaded_at" HeaderText="Uploaded At" SortExpression="uploaded_at" />
            <asp:BoundField DataField="contributor_id" HeaderText="Contributor ID" SortExpression="contributor_id" />
            <asp:BoundField DataField="category_type" HeaderText="Category Type" SortExpression="category_type" />
            <asp:BoundField DataField="subcategory_name" HeaderText="Subcategory Name" SortExpression="subcategory_name" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="rating" HeaderText="Rating" />
            
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
        <br/>
        <p class="auto-style1">Original Content ID:</p>
        <p class="auto-style1">&nbsp;<asp:TextBox ID="OC" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style3">Rating:</p>
        <asp:TextBox ID="Rating" runat="server"></asp:TextBox>
        <br />
        <br />
        <br/>
        <asp:button ID="Rate" runat="server" text="Rate" OnClick="RateClicked" />
        
       
        <br/>
        <br/>
        <p>
        <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" />
        
        </p>
        
    </form>
</body>
</html>
