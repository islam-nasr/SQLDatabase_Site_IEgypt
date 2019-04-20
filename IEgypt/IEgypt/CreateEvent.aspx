<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="IEgypt.CreateEvent" %>

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
   <title>Create Event</title>
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
        }
        .auto-style3 {
            font-weight: 700;
        }
        .auto-style4 {
            font-weight: 700;
        }
        .auto-style5 {
            font-weight: 700;
        }
        .auto-style6 {
            font-weight: 700;
        }
        .auto-style7 {
            font-weight: 700;
        }
    </style>
</head>
<body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
         <p class="auto-style1">Create Event</p>
         <p class="auto-style3">Date: </p>
        <asp:TextBox id="Date" type="date" runat="server"/>
            <br/>
        <p class="auto-style4">City: </p>
        <asp:TextBox id="City" runat="server"/>
            <br/>
        <p class="auto-style5">Description: </p>
        <asp:TextBox id="Description" runat="server"/>
            <br/>
        <p class="auto-style6">Entertainer:</p>
        <asp:TextBox id="Entertainer" runat="server"/>
            <br/>
        <p class="auto-style7">Location:</p>
        <asp:TextBox id="Location" runat="server"/>
            <br />
            <br/>
          <p><strong>Photo Link </strong> </p>
         <asp:TextBox id="PhotoLink" runat="server"/>
        <br/>
        <p><strong>Video Link</strong></p>
         <asp:TextBox id="VideoLink" runat="server"/>
        
           <br />
        
           <br/>
           
         <asp:Button id="button1" runat="server" Text="Create" OnClick="button1Clicked" />
        <br/>
       <br/>
       <asp:Button id="button2" runat="server" Text="Back" OnClick="button2Clicked" />
    
    </form>
    
</body>
</html>

