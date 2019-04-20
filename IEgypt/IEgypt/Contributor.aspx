<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contributor.aspx.cs" Inherits="IEgypt.Contributor" %>

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
    <body  style="background-image: url('contri2.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
         <form id="form1" runat="server">
             <div>
                  <ul>
  <li><a><asp:Button ID="home" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />
</a></li>
                  <li> <a><asp:Button id="buttonZ" runat="server" Text="Show Profile" OnClick="buttonZClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" /></a></li>
  <li> <a class="active" href="Contributor.aspx">Main Page</a> </li>    
      <li><a><asp:Button id="button1" runat="server" Text="Logout" OnClick="buttonLClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" />
                  </a></li>
<li>        
</li>
</ul>
             </div>
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="B1" runat="server" OnClick="deletecontent" Text="DELETE CONTENT" />
            <br />
            <br />
            <asp:Button ID="B2" runat="server" OnClick="uploadorg" Text="UPLOAD ORGINIAL CONTENT" />
            <br />
            <br />
            <asp:Button ID="B3" runat="server" OnClick="uploadnew" Text="UPLOAD NEW CONTENT" />
            <br />
            <br />
            <asp:Button ID="B4" runat="server" OnClick="recnew" Text="RECIEVE NEW REQUEST" />
            <br />
            <br />
            <asp:Button ID="B5" runat="server" OnClick="showmes" Text="MESSAGES" />
            <br />
            <br />
            <asp:Button ID="B6" runat="server" OnClick="sendmes" Text="SEND MESSAGE" />
            <br />
            <br />
            <asp:Button ID="B7" runat="server" OnClick="noti" Text="NOTIFICATION" />
            <br />
            <br />
            <asp:Button ID="B8" runat="server" OnClick="eventt" Text="EVENTS" />
            <br />
            <br />
            <asp:Button ID="B9" runat="server" OnClick="ad" Text="ADVERTISMENTS" />
            <br />
            <br />
            <asp:Button ID="B10" runat="server" OnClick="respond" Text="RESPOND TO REQUESTS" />

             


	        <!--<asp:Button id="buttonl" runat="server" Text="Logout" OnClick="buttonLClicked" />-->

        </div>
    </form>
</body>
</html>
