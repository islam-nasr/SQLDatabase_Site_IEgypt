<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="IEgypt.Comment" %>

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
        <style type="text/css">
        .auto-style1 {}
        </style>
    <title></title>
</head>
    <body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
        <form id="form1" runat="server">
        <p class="auto-style1"><strong>Your Comments</strong></p>
        
        
        <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="DeleteCommand">
             <Columns>

              <asp:BoundField DataField="original_content_id" HeaderText="Original Content ID" />
              <asp:BoundField DataField="date" HeaderText="Date" />
              <asp:BoundField DataField="text" HeaderText="Text" />
             
            
                 <asp:ButtonField Text="Delete" />
             
            
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
       



         &nbsp;<p class="auto-style1"><strong>Original Content</strong></p>
        <asp:GridView ID="Table2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
             <Columns>

              <asp:BoundField DataField="ID" HeaderText="ID" />
                 <asp:BoundField DataField="link" HeaderText="Link" SortExpression="link" />
                 <asp:BoundField DataField="uploaded_at" HeaderText="Uploaded At" SortExpression="uploaded_at" />
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
        <strong>
        <br/>
        <br/>
        Original Content ID:&nbsp;
        <asp:TextBox ID="OID1" runat="server"></asp:TextBox>
        
         &nbsp;&nbsp;
        
         Text:
        </strong>&nbsp;<strong><asp:TextBox ID="Text1" runat="server"></asp:TextBox>

        &nbsp;

        <asp:Button ID="Write" runat="server" Text="Post" OnClick="WriteClicked"/>
        <br />
        <br/>
        Original Content ID:&nbsp;
        <asp:TextBox ID="OID2" runat="server"></asp:TextBox>
         &nbsp;
        Last Written Time:&nbsp;
        <asp:TextBox ID="LastDate1" runat="server"></asp:TextBox>
         </strong>&nbsp;<strong>Text:&nbsp;
        <asp:TextBox ID="Text2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        

        <asp:Button ID="Edit" runat="server" Text="Edit" OnClick="EditClicked"/>
        
         <br />
        
         <br/>
         <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" />

    </form>
</body>
</html>
