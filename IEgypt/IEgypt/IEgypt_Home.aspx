<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IEgypt_Home.aspx.cs" Inherits="IEgypt.IEgypt_Home" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <style>
        p{
            color:black;
            font-family:'Bookman Old Style';
            font-size:large;
            font-weight:bolder;
            font-style:italic;
            background-color:silver;
            width:302px;
        }

       
    </style>
    <title></title>
</head>
<body style="background-image: url('Modern2.jpg'); background-repeat:no-repeat;  background-position: center;
  background-size: cover;
">
    <form id="form1" runat="server" style="clip: rect(auto, 1500px, auto, auto)">
      
   <div style="clip: rect(auto, auto, auto, auto); margin-right: 0px; margin-left: 600px;">
 <p>Email</p>
        <asp:TextBox ID="email_login1" runat="server"/>
         <p>Password</p>
        <asp:TextBox ID="password_login1" runat="server" TextMode="Password"/>
        <asp:Button id="button2" runat="server" Text="Login" OnClick="buttonLClicked" />
</div>
        <div style="margin: -167px 0px 0px 0px">
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
        <div id="firstgrid" style="border:2px dashed black">
        <asp:GridView ID="Table1" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" EditRowStyle-BackColor="#ccffff" Font-Bold="true">
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
      
        <p> Enter contributer name</p>
        <asp:TextBox ID="contributer_name" runat="server" />

        <asp:Button id="Search_Contributer" runat="server" Text="Search Contrubuter By FullName" OnClick="buttonSClicked" />
       
        <div id="secondgrid" style="border:2px dashed black">
        <asp:GridView ID="Table2" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" EditRowStyle-BackColor="#ccffff" Font-Bold="true">
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
    
        <br>
        
        <p>Register New User</p>
        <p>UserType</p>
       <!-- <asp:TextBox ID="User_type" runat="server"/>-->
        <select id="User_type1" name="dropdown" runat="server">
    <option value="Viewer">Viewer</option>
    <option value="Contributer">Contributer</option>
            <option value="Authorized Reviewer">Authorized Reviewer</option>
            <option value="Content Manager">Content Manager</option>
</select>
           <asp:Button id="Register_User" runat="server" Text="Register" OnClick="buttonUClicked" />
        <br>
        <br>
        <br>
       
        <asp:Button id="button4" runat="server" Text="Show Contributers with ordering experience years" OnClick="buttonCOClicked" />
        <div id="grid" style="border:2px dashed black">
        <asp:GridView ID="Table3" runat="server" AutoGenerateColumns="false" EditRowStyle-BackColor="#ccffff" AlternatingRowStyle-BackColor="#dcecf4" Font-Bold="true" >
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
        
        <asp:Button id="button5" runat="server" Text="Show Approved Original Content" OnClick="buttonAOClicked" />
        <div id="divid" style="border:2px dashed black">
        <asp:GridView ID="TableO" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#dcecf4" EditRowStyle-BackColor="#ccffff" Font-Bold="true" >
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
       </div>


     
    </form>
</body>
</html>
