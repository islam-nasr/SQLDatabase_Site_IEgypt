<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRequest.aspx.cs" Inherits="IEgypt.NewRequest" %>

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
    <title>Apply for New Request</title>
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
        }
        .auto-style2 {}
    </style>

</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
      <form id="form1" runat="server">
         <p class="auto-style1"><strong>Contributors&#39; Information</strong></p>
        
        
        <asp:GridView ID="Table2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style2" ForeColor="Black" Width="649px">
             <Columns>

              <asp:BoundField DataField="ID" HeaderText="ID" />
                 <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                 <asp:BoundField DataField="middle_name" HeaderText="Middle Name" SortExpression="middle_name" />
                 <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
              <asp:BoundField DataField="years_of_experience" HeaderText="Years Of Experience" />
              <asp:BoundField DataField="portifolio_link" HeaderText="Portofolio" />
              <asp:BoundField DataField="specialization" HeaderText="Specialization" />
            
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
      
         <p class="auto-style1">To apply for a new request please enter new content information </p>
         <p><strong>Information</strong></p>
        <asp:TextBox id="Info" runat="server"/>
            <br/>
        <p><strong>Contributor ID</strong> *Optional</p>
        <asp:TextBox id="CID" runat="server"/>
            <br />
            <br/>
        
        <asp:Button id="button1" runat="server" Text="Apply" OnClick="ApplyClicked" />

         <br />

        <br/>
        <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" />
    </form>
</body>
</html>
