﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContributerRegistration.aspx.cs" Inherits="IEgypt.ContributerRegistration" %>

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
               <p>Register New Contributer</p>
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
        <p>Years Of Experience</p>
            <asp:TextBox ID="yearsofexperience" runat="server"/>
            <p>Portifolio Link</p>
            <asp:TextBox ID="portifoliolink" runat="server" TextMode="Url"/>
            <p>Specialization</p>
            <asp:TextBox ID="con_specialization" runat="server" />
            
           <asp:Button id="Register_User" runat="server" Text="Register Contributer" OnClick="buttonRCClicked" />
        </div>
    </form>
</body>
</html>
