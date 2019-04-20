<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff_Main.aspx.cs" Inherits="IEgypt.Staff_Main" %>

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
<body  style="background-image: url('staff1.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
        <div>
<ul>
  <li><a><asp:Button ID="Button8" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />
</a></li>
                  <li> <a><asp:Button id="button13" runat="server" Text="Show Profile" OnClick="buttonZClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" /></a></li>
  <li> <a class="active" href="Staff_Main.aspx">Main Page</a> </li>    
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
       <br />
		<asp:Button id="button9" runat="server" Text="Filter" OnClick="button9Clicked" Height="40px" />
	    


        
        <br />
        <br />
		<asp:Button id="button7" runat="server" Text="Create Category & Sub-Category" OnClick="button8Clicked" Height="40px" />
	    <br />
            

    
            <br />
		<asp:Button id="button1" runat="server" Text="Create content"  OnClick="button1Clicked" Height="40px" />
	   <br />
        <br />
		<asp:Button id="button11" runat="server" Text="Requests/Content" OnClick="button11Clicked" Height="40px" />
	    <br />
        <br />
		<asp:Button id="button12" runat="server" Text="Requests/Content/Working Place" OnClick="button12Clicked" Height="40px" />
	    <br />
        <br />
		<asp:Button id="button6" runat="server" Text="Show Notification" OnClick="button6Clicked" Height="40px" />
	    <br />
        <br />
		<asp:button id="button2" runat="server" text="Delete Comment" onclick="button2clicked" height="40px" />
	    <br />
        <br />
		<asp:button id="button3" runat="server" text="Delete Original Content" onclick="button3clicked" height="40px" />
	    <br />
        <br />
		<asp:button id="button4" runat="server" text="Delete New Content" onclick="button4clicked" height="40px" />
	    <br />
        <br />
		<asp:Button id="button10" runat="server" Text="Show Possible Contributor" OnClick="button10Clicked" Height="40px" />
	    <br />
        <br />
		<asp:button id="button5" runat="server" text="Assign Contributor Request" onclick="button5clicked" height="40px" />
	    <br />
       <!--  <asp:Button id="buttonZ" runat="server" Text="Show Profile" OnClick="buttonZClicked" />

        <asp:Button ID="home" runat="server" Text="Return To Home Page" ToolTip="Redirect To IEgypt Home" OnClick="buttonRHClicked" />

	        <asp:Button id="buttonl" runat="server" Text="Logout" OnClick="buttonLClicked" />-->

      
		
            
    


      



        


<%--        <p>
            &nbsp;</p>
        <p>
		<asp:Button id="button12" runat="server" Text="Delete Content " OnClick="button12Clicked" Height="40px" />
	    </p>--%>

         
        

            </form>

    

</body>
</html>
