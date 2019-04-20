<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="IEgypt.ViewerInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
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
<body style="background-image: url('Modern2.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
        <div>
<ul>
  <li><a><asp:Button ID="Button8" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />
</a></li>
                  <li> <a class="active" href="UserInformation.aspx">Profile</a></li>
  <li> <a> <asp:Button ID="Buttonn" runat="server" Text="View Main Page" ToolTip="Redirect Each user to his main page" 
            OnClick="buttonREClicked" /></a> </li>    
      <li><a><asp:Button id="button14" runat="server" Text="Logout" OnClick="buttonLClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" />
                  </a></li>
<li>        
</li>
</ul>

        </div>
        <br />
        <br />
        <br />
        <br />
           <asp:textbox ID="userid1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:TextBox ID="userid" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="fname1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="fname" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
           <asp:textbox ID="mname1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="mname" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
            <asp:TextBox ID="lname1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true" />
        <asp:textbox ID="lname" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
            <asp:textbox ID="uemail1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="uemail" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
            <asp:textbox ID="upassword1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="upassword" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
           <asp:textbox ID="bdate1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true" TextMode="DateTime"/>
        <asp:textbox ID="bdate" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
          <asp:textbox ID="workingp1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="workingp" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
            <asp:textbox ID="workingpt1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="workingpt" runat="server" ReadOnly="true" BorderWidth="0"  />
        <br />
         <asp:textbox ID="workingpd1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="workingpd" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="yearsof1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="yearsof" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="portlink1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="portlink" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="spec1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="spec" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="hired1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true" TextMode="DateTime"/>
        <asp:textbox ID="hired" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="workh1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="workh" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
          <asp:textbox ID="payr1" runat="server" ReadOnly="true" Visible="false" BorderWidth="0" Font-Bold="true"/>
        <asp:textbox ID="payr" runat="server" ReadOnly="true" BorderWidth="0" />
        <br />
         <asp:Button ID="showdata" runat="server" Text="Show Personal Data"
            OnClick="buttonSDClicked" />
        <asp:Button ID="editdata" runat="server" Text="Enable Editing Personal Data" ToolTip="Click to make personal data editable"
            OnClick="buttonED1Clicked"/>
         <asp:Button ID="editing" runat="server" Text="Edit Personal Data" ToolTip="Click to make personal data edited"
            OnClick="buttonED2Clicked"/>
        <asp:Button ID="deactivate" runat="server" Text="Deactivate Profile" ToolTip="If Profile deactivated you must login within 2 weeks so it doesnt become permenantly deactivate"
        Onclick="buttonDAClicked" />
  <div>
        </div>
    </form>
</body>
</html>
