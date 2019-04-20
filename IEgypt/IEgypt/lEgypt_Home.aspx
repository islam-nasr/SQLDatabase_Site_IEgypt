<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lEgypt_Home.aspx.cs" Inherits="IEgypt.lEgypt_Home" %>

<!--LEGYPT MESH I-->

<!DOCTYPE html>

<html>
<head runat="server">
     <style>
         p{
            color:blue;
            font-family:'Bookman Old Style';
            font-size:large;
            font-weight:bolder;
            font-style:italic;
            background-color:silver;
            width:302px;
             height: 22px;
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
<body style="background-image: url('Modern5.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server">
              <ul>
  <li><a class="active" href="lEgypt_Home.aspx">Home</a></li>
                  <li><a href="UserInformation.aspx">Show Profile</a></li>
  <li> <a><asp:Button ID="redirect" runat="server" Text="View Main Page" ToolTip="Redirect Each user to his main page" 
            OnClick="buttonREClicked" EnableTheming="True" Font-Overline="True" Font-Underline="True" ForeColor="Black" Height="25px" style="margin-left: 0px; margin-top: 1px;" /> </a></li>      
      <li><a><asp:Button id="button3" runat="server" Text="Logout" OnClick="buttonLClicked" Font-Overline="True" Font-Underline="True" style="margin-top: 0px" Width="195px" />
                  </a></li>
<li>        
</li>
</ul>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>Enter original content category</p>
        <asp:TextBox ID="original_content_name" runat="server" />
        <br>
        <p>Enter original content type</p>
        <asp:TextBox ID="original_content_type" runat="server" />
        <br>
        <asp:Button ID="Search_Original_Content" runat="server" Text="Search_Original_Content"
            OnClick="buttonOClicked" />
        <br>

         <!--   <p>Email</p>
        <asp:TextBox id="email_login" runat="server"/>
            <br>
        <p>Password</p>
        <asp:TextBox id="password_login" runat="server"/>-->
            <br>
        <div id="firstgrid" style="border:2px dashed green">
        <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" >
            <columns>
            <asp:boundfield datafield="id" HeaderText="id" />
            <asp:boundfield datafield="rating" HeaderText="rating" />
   <asp:templatefield>
       <itemTemplate>
       <!--   <asp:LinkButton ID="linkbutton1" runat="server" OnClick="buttonOClicked">Tag</asp:LinkButton>
    -->   </itemTemplate>
   </asp:templatefield>
               
        </Columns>
      
        </asp:GridView>
         </div> 
           
        <br>
        <br>
        <br>
        <br>
        <p> Enter contributer name</p>
        <asp:TextBox ID="contributer_name" runat="server" />

        <asp:Button id="Search_Contributer" runat="server" Text="Search Contrubuter By FullName" OnClick="buttonSClicked" />
       
        <div id="secondgrid" style="border:2px dashed green">
        <asp:GridView ID="Table2" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" >
            <columns>
            <asp:boundfield datafield="id" HeaderText="id" />
            <asp:boundfield datafield="years_of_experience" HeaderText="Years Of Experience" />
            <asp:boundfield datafield="portifolio_link" HeaderText="Link Of Portifolio" />
            <asp:boundfield datafield="specialization" HeaderText="Specialization" />
            <asp:boundfield datafield="notified_id" HeaderText="Notified ID" />



   <asp:templatefield>
       <itemTemplate>
       <!--   <asp:LinkButton ID="linkbutton1" runat="server" OnClick="buttonOClicked">Tag</asp:LinkButton>
    -->   </itemTemplate>
   </asp:templatefield>
               
        </Columns>
      
        </asp:GridView>
         </div>
      
       
       
        <asp:Button id="button4" runat="server" Text="Show Contributers with ordering experience years" OnClick="buttonCOClicked" />
        <div id="grid" style="border:2px dashed green">
        <asp:GridView ID="Table3" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" HeaderStyle-BackColor="#ccffff" ForeColor="#ff3300" Font-Bold="true">
            <columns>
            <asp:boundfield datafield="id" HeaderText="id" />
            <asp:boundfield datafield="years_of_experience" HeaderText="Years Of Experience" />
            <asp:boundfield datafield="portifolio_link" HeaderText="Link Of Portifolio" />
            <asp:boundfield datafield="specialization" HeaderText="Specialization" />
            <asp:boundfield datafield="notified_id" HeaderText="Notified ID" />
                  <asp:templatefield>
       <itemTemplate>
       <!--   <asp:LinkButton ID="linkbutton1" runat="server" OnClick="buttonOClicked">Tag</asp:LinkButton>
    -->   </itemTemplate>
   </asp:templatefield>
               
        </Columns>
      
        </asp:GridView>
            </div>
        <p>Show approved Content</p>
        <br>

        <p>Enter Contributor FullName</p>
        <asp:TextBox ID="contributername1" runat="server"/>
        <br>
        <br>
        <asp:Button id="button5" runat="server" Text="Show Approved Original Content" OnClick="buttonAOClicked" />
        <div id="divid" style="border:2px dashed green">
        <asp:GridView ID="TableO" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" >
            <columns>
            <asp:boundfield datafield="id" HeaderText="id" />
            <asp:boundfield datafield="content_manager_id" HeaderText="Manager ID" />
            <asp:boundfield datafield="reviewer_id" HeaderText="Reviewer ID" />
            <asp:boundfield datafield="review_status" HeaderText="Review Status" />
            <asp:boundfield datafield="filter_status" HeaderText="Filter Status" />
            <asp:boundfield datafield="rating" HeaderText="Rating" />

            <asp:boundfield datafield="link" HeaderText="Original Content Link" />
            <asp:boundfield datafield="uploaded_at" HeaderText="Upload Date" />
           
            <asp:boundfield datafield="category_type" HeaderText="Category Type" />
            <asp:boundfield datafield="subcategory_name" HeaderText="Subcategory Name" />
            <asp:boundfield datafield="type" HeaderText="Content Type" />
            <asp:boundfield datafield="contributor_id" HeaderText="Contributor ID" />
            <asp:boundfield datafield="years_of_experience" HeaderText="Years Of Experience" />
            <asp:boundfield datafield="portifolio_link" HeaderText="Link Of Portifolio" />
            <asp:boundfield datafield="specialization" HeaderText="Specialization" />
            <asp:boundfield datafield="notified_id" HeaderText="Notified ID" />
                  <asp:templatefield>
       <itemTemplate>
       <!--   <asp:LinkButton ID="linkbutton1" runat="server" OnClick="buttonOClicked">Tag</asp:LinkButton>
    -->   </itemTemplate>
   </asp:templatefield>
               
        </Columns>
      
        </asp:GridView>
            </div>
      <!--  <asp:Button id="button1" runat="server" Text="Show Profile" OnClick="buttonZClicked" />

        <asp:Button id="button2" runat="server" Text="Logout" OnClick="buttonLClicked" />-->



     
    </form>
</body>
</html>

