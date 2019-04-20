<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="IEgypt.EventDetails" %>

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
    <title>Event Details</title>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
     <form id="form1" runat="server">
       <p><strong>Photo Link </strong> </p>
         <asp:TextBox id="PhotoLink" runat="server"/>
         <asp:Button id="button2" runat="server" Text="Upload" OnClick="button2Clicked" />
        <br/>
        <p><strong>Video Link</strong></p>
         <asp:TextBox id="VideoLink" runat="server"/>
         <asp:Button id="button3" runat="server" Text="Upload" OnClick="button3Clicked" />
           <br/>
         <p><strong>Create an Ad for your Event</strong></p>
        <asp:Button id="button4" runat="server" Text="YES" OnClick="button4Clicked" />
         <asp:Button id="button5" runat="server" Text="NO" OnClick="button5Clicked" />

        <br/>
        <br/>
        <br/>
        <asp:button id="button6" runat="server" text="Back"  OnClick="button6Clicked"/>
    </form>
</body>
</html>
