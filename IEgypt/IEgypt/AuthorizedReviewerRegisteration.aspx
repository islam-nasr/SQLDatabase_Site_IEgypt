<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthorizedReviewerRegisteration.aspx.cs" Inherits="IEgypt.AuthorizedReviewerRegisteration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        p{
            color:blue;
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
<body style="background-image: url('Modern4.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
        <div>
                   
               <p>Register New Authorized Reviewer</p>
        <p>First Name</p>
         <asp:TextBox ID="first_name" runat="server" />
          <p>Middle Name</p>
         <asp:TextBox ID="middle_name" runat="server" />
          <p>Last Name</p>
         <asp:TextBox ID="last_name" runat="server" />
          <p>Email</p>
         <asp:TextBox ID="user_email" runat="server" />
          <p>Password</p>
         <asp:TextBox ID="user_password" runat="server" TextMode="Password"/>
        <p>BirthDate</p>
        <asp:TextBox ID="user_birthdate" runat="server" TextMode="Date" />
          <!--  <p>UserType</p>
    <asp:TextBox ID="User_type" runat="server"/>-->
        <p>Hire Date</p>
            <asp:TextBox ID="hiredate" runat="server" ReadOnly="true"/>
            <p>Working Hours</p>
            <asp:TextBox ID="workinghours" runat="server"/>
            <p>Payment Rate</p>
            <asp:TextBox ID="paymentrate" runat="server" />
            
           <asp:Button id="Register_User" runat="server" Text="Register Reviewer" OnClick="buttonRRClicked" />
      
        </div>
    </form>
</body>
</html>
