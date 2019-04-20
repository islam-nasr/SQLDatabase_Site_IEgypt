<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContributorProfile.aspx.cs" Inherits="IEgypt.ContributorProfile" %>

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
">
    <form id="form1" runat="server">
         <asp:textbox ID="userid1" runat="server" ReadOnly="true" Text="User ID:" BorderWidth="0" Font-Bold="true"/>
        <asp:TextBox ID="userid" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="fname1" runat="server" ReadOnly="true" Text="First Name:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="fname" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
           <asp:textbox ID="mname1" runat="server" ReadOnly="true" Text="Middle Name:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="mname" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
            <asp:TextBox ID="lname1" runat="server" ReadOnly="true" Text="Last Name" BorderWidth="0" Font-Bold="true" />
        <asp:textbox ID="lname" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
            <asp:textbox ID="uemail1" runat="server" ReadOnly="true" Text="Email:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="uemail" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
         
           <asp:textbox ID="bdate1" runat="server" ReadOnly="true" Text="Birth Date:" BorderWidth="0" Font-Bold="true" TextMode="DateTime"/>
        <asp:textbox ID="bdate" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
         
          <asp:textbox ID="yearsof1" runat="server" ReadOnly="true" Text="Years Of Experience:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="yearsof" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="portlink1" runat="server" ReadOnly="true" Text="Portofolio Link:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="portlink" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="spec1" runat="server" ReadOnly="true" Text="Specialization:" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="spec" runat="server" ReadOnly="true" BorderWidth="0" />
         <br />
         <br />
        <br />
        
         <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
         <br />
        
    </form>
</body>
</html>

