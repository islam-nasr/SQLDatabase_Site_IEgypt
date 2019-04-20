<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewerMain.aspx.cs" Inherits="IEgypt.ViewerMain" %>

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
        .auto-style1 {
            font-weight: 700;
        }
        .auto-style2 {}
        .auto-style3 {}
        .auto-style4 {}
        .auto-style5 {}
        .auto-style6 {
            font-size: xx-large;
        }
         ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: rgba(0,0,0,0.3);
    position: fixed;
    top: 0;
    width: 100%;
}

li {
    float: left;
             width: 337px;
         }

li a {
    display: block;
    padding: 35px;
    color: yellow;
    text-decoration:underline overline;
}
li a:hover:not(.active) {
    background-color: #000;
}

.active {
    background-color: #000;
}
    </style>
    <title></title>
</head>
    <body  style="background-image: url('viewer1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
"><form id="form1" runat="server">
    <div>
                  <ul>
  <li><a><asp:Button ID="Button9" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />
</a></li>
                  <li> <a><asp:Button id="button11" runat="server" Text="Show Profile" OnClick="buttonZClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" /></a></li>
  <li> <a class="active" href="ViewerMain.aspx">Main Page</a> </li>    
      <li><a><asp:Button id="button12" runat="server" Text="Logout" OnClick="buttonLClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" />
                  </a></li>
<li>        
</li>
</ul>




    </div>
     <br />
            <br />
            <br />
            <br />
            <br />
        <p class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Your&nbsp;&nbsp; </span></p>
            <p class="auto-style1"><span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp; Facilities</span></p>
        <p class="auto-style1">
       

       
        </p>
        <asp:Button ID="Button1" runat="server" Text="Create Event" OnClick="button1Clicked" CssClass="auto-style2" Width="302px"/>
        <br/>
        <br/>
         <asp:Button ID="Button2" runat="server" Text="Apply Existing Request" OnClick="button2Clicked" CssClass="auto-style4" Width="302px"/>
         <br/>
        <br/>
         <asp:Button ID="Button3" runat="server" Text="Apply New Request" OnClick="button3Clicked" CssClass="auto-style3" Width="302px"/>
         <br/>
        <br/>
         <asp:Button ID="Button4" runat="server" Text="Delete New Request" OnClick="button4Clicked" CssClass="auto-style5" Width="302px" />
        <br/>
        <br/>
         <asp:Button ID="Button5" runat="server" Text="Review Original Content" OnClick="button5Clicked" CssClass="auto-style5" Width="302px" />
        <br/>
        <br/>
         <asp:Button ID="Button6" runat="server" Text="View & Manage my Comments" OnClick="button6Clicked" CssClass="auto-style5" Width="302px" />
         <br/>
        <br/>
         <asp:Button ID="Button7" runat="server" Text="Create Advertisement" OnClick="button7Clicked" CssClass="auto-style5" Width="302px" />
         <br/>
        <br/>
         <asp:Button ID="Button8" runat="server" Text="Manage my Ads" OnClick="button8Clicked" CssClass="auto-style5" Width="302px" />
        <br />
        <br />
        <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Show New Content"  CssClass="auto-style5" Width="302px" />
        <br/>
        <br/>
      <asp:Button id="buttonZ" runat="server" Text="Show Profile" OnClick="buttonZClicked" />

        <asp:Button ID="home" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />

	        <asp:Button id="buttonl" runat="server" Text="Logout" OnClick="buttonLClicked" />

       

       
    </form>
</body>
</html>

