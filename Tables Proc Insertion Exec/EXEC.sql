
-----------------------------registered/unregistered user------------------
--1--
EXEC Original_Content_Search 'Logos',NULL
-----------------------------------
--2--
EXEC Contributor_Search 'Ana Kariman Hossam'
-----------------------------------
--3&4--

DECLARE @result int
EXEC Register_User 'Contributer','me@him.com','balabizo','me','is','myself','11-11-2011',
NULL,NULL,NULL,'design anysing','me.him.com',11,NULL,NULL,NULL,@result OUTPUT
print(@result)
-----
DECLARE @result int
EXEC Register_User 'content manager','me1@him1.com','balabizo2','me3','is3','myself3','11-11-2011',
NULL,NULL,NULL,null,null,null,NULL,NULL,NULL,@result OUTPUT
print(@result)


EXEC Check_Type 'Logos' ,19


DECLARE @result int
EXEC Register_User 'content manager','me1@him1.com','balabizo3','me4','is4','myself4','11-11-2011',
NULL,NULL,NULL,null,null,null,NULL,NULL,NULL,@result OUTPUT
print(@result)

EXEC Check_Type 'designs',20



-----------------------------------
--5--

EXEC Order_Contributor
-----------------------------------
--6--
EXEC Show_Original_Content NULL
EXEC Show_Original_Content 3


-------------------------------registered user-----------------------------

--1--
DECLARE @user_id int
EXEC User_login 'me1@him1.com','balabizo2',@user_id OUTPUT
print(@user_id)
-----------------------------------
--2--
DECLARE @email VARCHAR(20)
DECLARE @password VARCHAR(20)
DECLARE @firstname VARCHAR(20)
DECLARE @middlename VARCHAR(20)
DECLARE @lastname VARCHAR(20)
DECLARE @birth_date DATETIME
DECLARE @working_place_name VARCHAR(20)
DECLARE @working_place_type VARCHAR(20)
DECLARE @wokring_place_description VARCHAR(20)
DECLARE @specilization VARCHAR(20)
DECLARE @portofolio_link VARCHAR(20)
DECLARE @years_experience int
DECLARE @hire_date DATETIME
DECLARE @working_hours int
DECLARE @payment_rate DECIMAL(3,2)
EXEC Show_Profile 15 ,@email OUTPUT, @password OUTPUT, @firstname OUTPUT, @middlename OUTPUT,
@lastname OUTPUT, @birth_date OUTPUT, @working_place_name OUTPUT, @working_place_type
OUTPUT, @wokring_place_description OUTPUT, @specilization OUTPUT,
@portofolio_link OUTPUT, @years_experience OUTPUT, @hire_date OUTPUT, @working_hours
OUTPUT, @payment_rate OUTPUT
print(@email)print( @password)print(@firstname)print(@middlename)print(
@lastname)print(@birth_date)print(@working_place_name)print(@working_place_type
)print(@wokring_place_description)print( @specilization )print(
@portofolio_link)print( @years_experience)print(@hire_date)print(@working_hours
)print( @payment_rate  )
-----------------------------------
--3--

EXEC Edit_Profile 15,'meedited@him1.com', NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL
-----------------------------------
--4--
EXEC Deactivate_Profile 15
-----------------------------------
--5--
EXEC Show_Event 1

-----------------------------------
--6--
EXEC Show_Notification 1

-----------------------------------
--7--
EXEC Show_New_Content 11,NULL
EXEC Show_New_Content 7,1
--------------------------------------VIEWER-----------------------------------------------
--1--
DECLARE @event_id int
EXEC Viewer_Create_Event 'Cairo','11/22/2018','3eed mlad saif','mostafa kandil',7,'Mokaii', @event_id OUTPUT
Print(@event_id)
-----------------------------------
--2--
EXEC Viewer_Upload_Event_Photo 4,'t3ala.net'
-----------------------------------
--3--
EXEC Viewer_Create_Ad_From_Event 4
-----------------------------------
--4--
EXEC Apply_Existing_Request 7,4
-----------------------------------
--5--
EXEC Apply_New_Request 'information for the request',NULL,7--not working
-----------------------------------
--6--
EXEC Delete_New_Request 11
-----------------------------------
--7--
EXEC Rating_Original_Content 4,3,7
-----------------------------------
--8--
EXEC Write_Comment 'This is a comment',7,4,'2018-11-23 14:25:30'
EXEC Write_Comment 'This is another comment',11,6,'2018-11-23 14:26:00'
EXEC Write_Comment 'Hello',11,6,'2018-11-23 14:26:00'
-----------------------------------
--9--
EXEC Edit_Comment 'This is also a comment',11,6,'2018-11-23 14:26:00' , '2018-11-23 15:00:00'
-----------------------------------
--10--
EXEC Delete_Comment 11,6,'2018-11-23 14:26:00'
-----------------------------------
--11--
EXEC Create_Ads 12,'Open day' , 'Maadi'
EXEC Create_Ads 11, 'whatsoever' , 'Nasr City'
EXEC Create_Ads 12, 'balabizo' , 'nowhere'
-----------------------------------
--12--
EXEC Edit_Ad 6,'Le Marchee' , 'Nasr City'
-----------------------------------
--13--
EXEC Delete_Ads 8
-----------------------------------
--14--
EXEC Send_Message 'This is a message',12,2,1, '2018-11-23 15:00:00' 
EXEC Send_Message 'This is a reply',12,2,0, '2018-11-23 15:01:00' 
-----------------------------------
--15--
EXEC Show_Message 2
-----------------------------------
--16--
EXEC Highest_Rating_Original_content 
-----------------------------------
--17--
INSERT INTO New_Request  Values (NULL,0,'ay haga',7,1,NULL)
EXEC Assign_New_Request 13, 3

---------------------------------------
---------------------------------------------------------------CONTRIBUTOR------------------------------------------------------
--1--
EXEC Receive_New_Requests NULL,2
EXEC Receive_New_Requests 4,2
EXEC Receive_New_Requests 3,2
-------------------------------------
--2--

INSERT INTO New_Request Values (NULL,1,'balabizo',7,1,1)
EXEC Respond_New_Request 1,1,12
-------------------------------------
--3--
EXEC Upload_Original_Content 'Graphics','Paintings','Art',4, 'link7.com'
-------------------------------------
--4--
EXEC Upload_New_Content 12,4,'Paintings','Art','link8.com'
-------------------------------------
--5--
EXEC Delete_Content 7
EXEC Delete_Content 2
-------------------------------------
--6--
DECLARE @can_receive bit 
EXEC Receive_New_Request 14, @can_receive OUTPUT
PRINT @can_receive


-----------------------------------------------------
-------------------------------------------------------STAFF-------------------------------------------------------------

--1--
UPDATE Original_Content SET review_status=0 WHERE ID=4 
UPDATE Original_Content SET reviewer_id=NULL WHERE ID=4 
--
EXEC reviewer_filter_content 9,4,1
--------------------------------------------------------
UPDATE Original_Content SET filter_status=NULL WHERE ID=4
UPDATE Original_Content SET content_manager_id=NULL WHERE ID=4
--

--2--
EXEC content_manager_filter_content 13,4,1

--------------------------------------------------------
--3--
EXEC Staff_Create_Category 'balabizo category'
--------------------------------------------------------
--4--
EXEC Staff_Create_Subcategory 'balabizo category','balabizo subcategory'
--------------------------------------------------------
--5--
EXEC Staff_Create_Type 'balabizo type'
--------------------------------------------------------
--6--
EXEC Most_Requested_Content
--------------------------------------------------------
--7--
EXEC Workingplace_Category_Relation
-----------------------------------------------------------
--8--
INSERT INTO Comment VALUES(7,5,CURRENT_TIMESTAMP,'try commenting')
declare @dt as datetime = datetimefromparts(2018,11,23,17,53,10,3)
print(@dt)
EXEC Delete_Comment 7,5,'2018-11-23 18:18:33'
---------------------------------------------------------------
--9--
EXEC Delete_Original_Content 4
---------------------------------------------------------------
--10--
EXEC Delete_New_Content 1
--------------------------------------------------------------
--11--
EXEC Assign_Contributor_Request 3,13
-------------------------------------------------------
--12--
EXEC Show_Possible_Contributors
