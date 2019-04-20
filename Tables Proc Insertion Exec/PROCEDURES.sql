-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> registered/unregistered user  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

 ------1------
-- DROP PROC Original_Content_Search
 GO
CREATE PROC Original_Content_Search
@typename varchar(20),  
@categoryname varchar(20)
AS
BEGIN 
If((@categoryname != '') AND ( @typename!=''))
SELECT O.ID , O.rating 
FROM Original_Content  O INNER JOIN  Content C 
ON O.ID=C.ID 
WHERE
C.[type]=@typename 
AND C.subcategory_name =@categoryname 
AND O.review_status=1 
AND O.filter_status=1

ELSE IF (@categoryname IS NULL or @categoryname = '')
SELECT O.ID,O.rating 
FROM Original_Content O INNER JOIN Content C 
ON O.ID =C.ID 
WHERE C.[type] =@typename
AND O.review_status=1
AND O.filter_status =1 

ELSE 
SELECT O.ID , O.rating 
FROM Original_Content O INNER JOIN Content C 
ON O.ID = C.ID
WHERE C.subcategory_name=@categoryname
AND O.review_status =1 
AND O.filter_status=1
END 

-------------------------------------------------------------------

------2------

GO
CREATE PROC Contributor_Search
@fullname varchar(20)
AS 
BEGIN 
SELECT C.ID , C.years_of_experience,C.portifolio_link,C.specialization,C.notified_id
FROM Contributor C INNER JOIN [User] U
ON C.ID = U.ID 
WHERE @fullname = U.first_name +' ' +U.middle_name + ' ' +U.last_name 
END


-----------------------------------------------------------------------------

------3------
--DROP PROC Register_User
GO
CREATE PROC Register_User
@usertype varchar(20),
@email varchar(20), 
@password varchar(20), 
@firstname varchar(20),
@middlename varchar(20), 
@lastname varchar(20), 
@birth_date datetime , 
@working_place_name varchar(20), 
@working_place_type varchar(20),
@working_place_description varchar(100), 
@specialization varchar(30), 
@portofolio_link varchar(60), 
@years_experience int, 
@hire_date datetime,
@working_hours int, 
@payment_rate int ,
@user_id int OUTPUT
AS 

BEGIN
IF(@email IS null OR @password IS NULL OR @firstname IS NULL OR @middlename IS NULL OR @lastname IS NULL 
OR @birth_date IS NULL OR @usertype IS NULL )
print 'One of the inputs is null'

ELSE 
IF(EXISTS (SELECT * FROM [user] U WHERE U.email=@email))
THROW 51000, 'Same email exists.', 1;  
ELSE
INSERT INTO [User] (email,first_name,middle_name,last_name,birthdate,[password])
VALUES (@email,@firstname, @middlename, @lastname, @birth_date,@password)
/*SELECT @user_id = u.ID
FROM [User] u WHERE u.email=@email*/
SET @user_id = SCOPE_IDENTITY();

IF(@usertype IS NULL)
print 'Please insert a type'

IF(@usertype='Viewer' or @usertype='viewer')
INSERT INTO Viewer (ID,working_place, working_place_type, working_place_description)
VALUES(@user_id,@working_place_name, @working_place_type, @working_place_description)

IF (@usertype='Contributor' or @usertype='Contributor')
INSERT INTO Contributor(ID, years_of_experience, portifolio_link, specialization )
values(@user_id, @years_experience, @portofolio_link, @specialization)

IF (@usertype='Authorized Reviewer' or @usertype='authorized reviewer' or @usertype='Content Manager' or @usertype='content manager' )
INSERT INTO Staff(ID,hire_date,working_hours,payment_rate)
VALUES(@user_id,@hire_date,@working_hours,@payment_rate)

IF (@usertype='Content Manager' or @usertype='content manager')
INSERT INTO Content_manager (ID)
VALUES(@user_id);

IF (@usertype='Authorized Reviewer' or @usertype='authorized reviewer')
INSERT INTO Reviewer (ID) 
VALUES(@user_id);
END

-------------------------------------------------------
------4------

GO
CREATE PROC Check_Type
@typename varchar(20),
@content_manager_id int
AS
BEGIN
IF(NOT EXISTS (Select * FROM Content_type WHERE [type] = @typename))
BEGIN
INSERT INTO Content_type VALUES(@typename)
END
UPDATE Content_manager SET [type]=@typename WHERE ID=@content_manager_id

END

-----------------------------------------------------
------5-----
GO
CREATE PROC Order_Contributor 
AS 
BEGIN
SELECT * FROM Contributor 
ORDER BY years_of_experience ASC 
END


--------------------------------------------
-------6.5 (for ms3)
GO 
CREATE PROC Show_Original_Content1
@full_name VARCHAR(60)
AS
DECLARE @contid INT 
BEGIN

if(@full_name IS NULL or @full_name='')
EXEC Show_Original_Content NULL
else
BEGIN
if(EXISTS(SELECT * FROM [User] U INNER JOIN Contributor C
ON U.ID=C.ID WHERE @full_name = U.first_name +' ' +U.middle_name + ' ' +U.last_name))
BEGIN
SELECT @contid=c.id FROM [User] U INNER JOIN Contributor C
ON U.ID=C.ID WHERE @full_name = U.first_name +' ' +U.middle_name + ' ' +U.last_name 
EXEC Show_Original_Content @contid
END
ELSE
THROW 51000, 'NOT A VALID CONTRIBUTOR NAME.', 1;  
END
END
--------------------------------------------
------6------
GO
CREATE PROC Show_Original_Content
@contributor_id int 
AS 
BEGIN 
if(@contributor_id IS NULL)
SELECT * 
FROM Original_Content O INNER JOIN Content CO 
ON  O.ID = CO.ID 
INNER JOIN Contributor C 
ON C.ID = CO.contributor_id
WHERE O.review_status=1 AND O.filter_status=1

ELSE 
SELECT * 
FROM Original_Content O INNER JOIN Content CO ON O.ID = CO.ID
INNER JOIN Contributor C ON 
CO.contributor_id=C.ID
WHERE C.ID =  @contributor_id AND O.review_status=1 AND O.filter_status=1
END


-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-----------------------REGISTERED USER---------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

------1------
GO
CREATE PROC User_login 
@email varchar(60),
@password varchar(20),
@user_id int OUTPUT
 
AS 
 DECLARE @temp int   
 DECLARE @dedate DATETIME
BEGIN
  
 IF(EXISTS (SELECT * FROM [User] U WHERE @email=U.email AND @password = U.[password]))
BEGIN
SELECT @temp=U.ID FROM [User] U WHERE @email=U.email AND @password = U.[password]

IF (EXISTS (SELECT * FROM Deactivated_accounts D WHERE @temp=D.ID))
BEGIN
 (SELECT @dedate=D.Deact_time FROM Deactivated_accounts D WHERE @temp=D.ID) 

IF(DATEDIFF(DAY,CURRENT_TIMESTAMP,@dedate)>14)

THROW 51000, 'account permenantly deactivated', 1;  
 --print 'account permenantly deactivated';

ELSE 

DELETE FROM Deactivated_accounts WHERE ID=@temp
SELECT @user_id=U.ID FROM [User] U WHERE @email=U.email AND @password = U.[password]
END
ELSE
SELECT @user_id=U.ID FROM [User] U WHERE @email=U.email AND @password = U.[password]
END
 ELSE

 BEGIN
 SET @user_id=-1;
 THROW 51000, 'email or password not valid', 1;  

 
 END
 
END


---------------------------------------------------
CREATE PROC checktype
@user_id int,
@checking INT OUTPUT
AS
BEGIN
if(exists(SELECT * FROM Contributor WHERE @user_id=id))
set @checking= 1
else
if(exists(select * FROM Viewer WHERE @user_id=id))
set @checking= 2
else
if(exists(select * FROM Staff WHERE @user_id=id))
set @checking= 3
else
set @checking=0
end

--DECLARE @checking int
--EXEC checktype 1,@checking OUTPUT
--print(@checking)
---------------------------------------------------
------2------
GO
CREATE PROC Show_Profile
@user_id int ,
@email varchar (60)OUTPUT,
@password varchar(20)OUTPUT, 
@firstname varchar(20) OUTPUT,
@middlename varchar(20)OUTPUT,
@lastname varchar(20) OUTPUT,
@birth_date datetime OUTPUT, 
@working_place_name varchar(20) OUTPUT,
@working_place_type varchar(20) OUTPUT,
@wokring_place_description varchar(100) OUTPUT, 
@specilization varchar(30) OUTPUT,
@portofolio_link varchar(60) OUTPUT, 
@years_experience int OUTPUT,
@hire_date datetime OUTPUT, 
@working_hours int OUTPUT,
@payment_rate int OUTPUT
 
AS
BEGIN

 
IF (EXISTS (SELECT * FROM Deactivated_accounts D WHERE @user_id=D.ID AND DATEDIFF(DAY,CURRENT_TIMESTAMP,D.Deact_time)>14))
SET @email = null
SET @password = null
SET @firstname = null
SET @middlename = null
SET @lastname = null
SET @birth_date = null
SET @working_place_name = null
SET @working_place_type = null
SET @wokring_place_description = null
SET @specilization = null
SET @portofolio_link = null
SET @years_experience = null
SET @hire_date = null
SET @working_hours = null
SET @payment_rate = null
 
IF (Exists(SELECT U.ID FROM [User] U WHERE U.ID = @user_id))
Select @email = U.email, @password = U.[password], @firstname = U.first_name, 
@middlename = U.middle_name, @lastname = U.last_name , @birth_date = U.birthdate
FROM [User] U 
WHERE @user_id = U.ID
IF (Exists( Select V.ID FROM Viewer V WHERE @user_id = V.ID))
BEGIN
SET @specilization = null
SET @portofolio_link = null
SET @years_experience = null
SET @hire_date = null
SET @working_hours = null
SET @payment_rate = null
 
Select @working_place_name = V.working_place, @working_place_type = V.working_place_type,
@wokring_place_description = V.working_place_description
FROM Viewer V 
WHERE @user_id = V.ID
END
IF (Exists( Select C.ID FROM Contributor C WHERE @user_id = C.ID))
BEGIN
SET @working_place_name = null
SET @working_place_type = null
SET @wokring_place_description = null
SET @hire_date = null
SET @working_hours = null
SET @payment_rate = null
 
Select @specilization = C.specialization , @portofolio_link = C.portifolio_link ,
@years_experience = C.years_of_experience 
FROM Contributor C 
WHERE @user_id = C.ID
END
IF (Exists( Select S.ID FROM Staff S WHERE @user_id = S.ID))
BEGIN
SET @working_place_name = null
SET @working_place_type = null
SET @wokring_place_description = null
SET @specilization = null
SET @portofolio_link = null
SET @years_experience = null
 
Select @hire_date = S.hire_date , @working_hours=S.working_hours , @payment_rate = S.payment_rate
FROM Staff S
WHERE @user_id = S.ID
END
 END 


  ----------------------------------------------
  ------3------
   GO
 CREATE PROC Edit_Profile 
 @user_id  int ,
 @email varchar(60),
 @password varchar(20),
@firstname varchar(20), 
@middlename varchar(20),
@lastname varchar(20), 
@birth_date DATETIME ,
@working_place_name varchar(20),
@working_place_type varchar(20),
@wokring_place_description varchar(100),
@specilization varchar(30),
@portofolio_link varchar(60), 
@years_experience int , 
@hire_date DATETIME,
@working_hours int, 
@payment_rate int 
AS 
DECLARE @temp int
BEGIN
IF(@user_id IS NOT NULL) 
BEGIN
 IF(EXISTS(SELECT U.ID FROM [User] U WHERE U.ID=@user_id))
  SELECT @temp=U.ID FROM [User] U WHERE  U.ID=@user_id
  
  IF(@email IS NOT NULL ) 
  IF(EXISTS(SELECT * FROM [User] U WHERE U.email=@email AND @user_id!=U.ID))
  THROW 51000, 'Same email exists.', 1; 
  else
  BEGIN
  UPDATE [User] Set email = @email WHERE [User].ID = @temp
  IF (@firstname IS NOT NULL )
  UPDATE [User] Set first_name=@firstname WHERE [User].ID = @temp
  IF (@middlename IS NOT NULL )
  UPDATE [User] Set middle_name=@middlename WHERE [User].ID = @temp
  IF (@lastname IS NOT NULL )
  UPDATE [User] Set last_name=@lastname WHERE [User].ID = @temp
  IF (@birth_date IS NOT NULL )
  UPDATE [User] Set birthdate=@birth_date WHERE [User].ID = @temp

 IF(EXISTS(SELECT V.ID FROM Viewer V WHERE V.ID=@user_id))
  SELECT @temp=V.ID FROM Viewer V WHERE  V.ID=@user_id
  IF(@working_place_type IS NOT NULL)
  UPDATE Viewer SET working_place_type=@working_place_type WHERE Viewer.ID=@temp
  IF(@working_place_type IS NOT NULL)
  UPDATE Viewer SET working_place_type=@working_place_type WHERE Viewer.ID=@temp
  IF(@working_place_type IS NOT NULL)
  UPDATE Viewer SET working_place_type=@working_place_type WHERE Viewer.ID=@temp


 IF(EXISTS(SELECT C.ID FROM Contributor C WHERE C.ID=@user_id))
  SELECT @temp=C.ID FROM Contributor C WHERE  C.ID=@user_id
  IF(@specilization IS NOT NULL)
  UPDATE Contributor SET specialization=@specilization WHERE Contributor.ID=@temp
  IF(@portofolio_link IS NOT NULL)
  UPDATE Contributor SET portifolio_link=@portofolio_link WHERE Contributor.ID=@temp
  IF(@years_experience IS NOT NULL)
  UPDATE Contributor SET years_of_experience=@years_experience WHERE Contributor.ID=@temp


 
 IF(EXISTS(SELECT S.ID FROM Staff S WHERE S.ID=@user_id))
  SELECT S.ID FROM Staff S WHERE S.ID=@user_id
  IF(@hire_date IS NOT NULL)
  UPDATE Staff SET hire_date=@hire_date WHERE Staff.ID=@temp
  IF(@working_hours IS NOT NULL)
  UPDATE Staff SET working_hours=@working_hours WHERE Staff.ID=@temp
  IF(@years_experience IS NOT NULL)
  UPDATE Staff SET payment_rate=@payment_rate WHERE Staff.ID=@temp
END
END
ELSE 
Print'INSERT A USER ID'
END 


------------------------------------------------------------------------------------------------
------4------
GO
CREATE PROC Deactivate_Profile 
@user_id INT
AS
BEGIN
INSERT INTO Deactivated_accounts VALUES(@user_id,CURRENT_TIMESTAMP)
END


------------------------------------------------------------------------------------------------

------5------
GO
CREATE PROC Show_Event
@event_id int 
AS 
BEGIN
IF (@event_id IS NULL)
Select E.ID,E.[description],E.[location],E.city,E.timee,E.entertainer,E.notification_object_id,
E.viewer_id,U.first_name,U.middle_name, U.last_name
FROM [Event] E 
INNER JOIN Viewer V
ON E.viewer_id = V.ID
INNER JOIN [User] U 
ON V.ID = U.ID 

ELSE
Select E.ID,E.[description],E.[location],E.city,E.timee,E.entertainer,E.notification_object_id,
E.viewer_id,U.first_name,U.middle_name, U.last_name
FROM [Event] E 
INNER JOIN Viewer V
ON E.viewer_id = V.ID
INNER JOIN [User] U 
ON V.ID = U.ID 
WHERE @event_id = E.ID 

END

------------------------------------------
------6------
GO
CREATE PROC Show_Notification
 @user_id int	

 
AS 
BEGIN
			IF(EXISTS(SELECT C.ID FROM Contributor C WHERE C.ID=@user_id))
			BEGIN 
				SELECT E.city,E.[description],E.entertainer,E.[location],E.timee,NR.ID,NR.information
				FROM Contributor C 
						INNER JOIN Announcement A ON C.notified_id=A.notified_person_id
						LEFT OUTER JOIN [Event] E ON A.notification_object_id=E.notification_object_id
						LEFT OUTER JOIN New_Request NR ON A.notification_object_id=NR.notif_obj_id
				WHERE C.ID =@user_id


			END 

			ELSE IF(EXISTS(SELECT S.ID FROM Staff S WHERE S.ID=@user_id))
			BEGIN 
				SELECT E.city,E.[description],E.entertainer,E.[location],E.timee
				FROM Staff S 
						INNER JOIN Announcement A ON S.notified_id=A.notified_person_id
						INNER JOIN [Event] E ON A.notification_object_id=E.notification_object_id
				
				 WHERE S.ID=@user_id
 

			END

END



---------------------------------------------------------
------7------
--DROP PROC Show_New_Content
GO
CREATE PROC Show_New_Content

@viewer_id int ,

@content_id int

AS

BEGIN

IF(@viewer_id IS NOT NULL AND @content_id IS NOT NULL)

SELECT contributor_id,first_name,middle_name,last_name

FROM New_Content NC INNER JOIN New_Request NR ON NC.new_request_id = NR.ID

INNER JOIN [User] U ON NR.contributor_id = U.ID

Where NR.viewer_id = @viewer_id AND NC.ID = @content_id

ELSE IF (@content_id IS NULL AND @viewer_id IS NOT NULL)

SELECT NC.ID,NR.information,contributor_id,first_name+ ' ' + middle_name+ ' ' + last_name AS 'full_name'

FROM New_Content NC INNER JOIN New_Request NR ON NC.new_request_id = NR.ID

INNER JOIN [User] U ON NR.contributor_id = U.ID

Where NR.viewer_id = @viewer_id

ELSE

Print 'ENTER VIEWER ID!'

END


-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
----------------------------------VIEWER---------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

------1------

GO

CREATE PROC Viewer_Create_Event
@city varchar(30),
@event_date_time datetime,
@description varchar(100),
@entartainer varchar(50),
@viewer_id int ,
@location VARCHAR(100),
@event_id int OUTPUT
AS
BEGIN 
INSERT INTO [Event] ([description],city,[time],entertainer,viewer_id)
Values (@description,@city,@event_date_time,@entartainer,@viewer_id)
SET @event_id = (Select MAX(ID) From [Event])
END

-------------------------------------------------------------------------------------------------

------2------

GO

CREATE PROC Viewer_Upload_Event_Photo
@event_id int ,
@link varchar (60) 
AS
BEGIN 
INSERT INTO Event_Photos_link (event_id,link)
values(@event_id,@link)
END


---------------------------------------------------------------

------3------
GO
CREATE PROC Viewer_Upload_Event_Video 
@event_id int , 
@link varchar(60)
AS
BEGIN 
INSERT INTO Event_Videos_link(event_id,link)
values(@event_id,@link)
END


-----------------------------------------------------------------------
------4------
GO
CREATE PROC Viewer_Create_Ad_From_Event 
@event_id int 
AS 
DECLARE @temp1 VARCHAR(100)
DeCLARE @temp2 VARCHAR(100)
BEGIN
SELECT @temp1 = E.[description] , @temp2=E.[location]
FROM [Event] E
WHERE E.ID = @event_id
SET IDENTITY_INSERT dbo.Advertisement ON;
INSERT INTO Advertisement (id , [description],[location])
VALUES (@event_id,@temp1,@temp2)
SET IDENTITY_INSERT dbo.Advertisement OFF;
END


---------------------------------------------------------------------------------
------5------
GO
CREATE PROC Apply_Existing_Request
@viewer_id int , 
@original_content_id int 
AS 
DECLARE @temp3 int 
 BEGIN 
  IF(EXISTS(SELECT OC.ID FROM Original_Content OC WHERE (OC.rating>4) AND (OC.ID =@original_content_id) ))
  BEGIN
  SELECT @temp3=OC.ID FROM Original_Content OC WHERE (OC.rating>4) AND (OC.ID =@original_content_id)
  
  INSERT INTO Existing_Request (original_content_id,viewer_id)
  VALUES(@temp3,@viewer_id)
  END
  ELSE 
 Print 'YOU CAN"T BUY THIS CONTENT'

 END 

------------------------------------------------------------------------------------------------------
------6------

GO
CREATE PROC Apply_New_Request 
@information varchar(200), 
@contributor_id int , 
@viewer_id int
As 
DECLARE @temp7 int 
DECLARE @temp8 int 
DECLARE @temp9 int 
DECLARE @temp10 int
DECLARE @temp11 int 
DECLARE @temp12 int 
DECLARE @temp13 int  
BEGIN 
  SELECT @temp7 =MAX(ID)
  FROM Notification_Object 
   SET @temp8=@temp7+1
   SET IDENTITY_INSERT dbo.Notification_Object ON;
   INSERT INTO Notification_Object (ID)
   VALUES (@temp8);
   SET IDENTITY_INSERT dbo.Notification_Object OFF;
   
   INSERT INTO New_Request(information,viewer_id,contributor_id,notif_obj_id)
   VALUES (@information,@viewer_id,@contributor_id,@temp8)
  SELECT @temp9 = MAX(ID)
   FROM New_Request
IF(@contributor_id IS NOT NULL)
 BEGIN
   UPDATE New_Request SET specified=1 WHERE ID= @temp9
     SELECT @temp10=C.notified_id
   FROM Contributor C
   WHERE C.ID=@contributor_id
   INSERT INTO Announcement(sent_at,notified_person_id,notification_object_id)
   VALUES(CURRENT_TIMESTAMP,@temp10,@temp8)
END
 ELSE
 BEGIN
   UPDATE New_Request SET specified=0 WHERE ID=@temp9
   
   SELECT @temp10 = COUNT(ID)
   FROM Contributor C

  WHILE (@temp10>0)
  BEGIN 
 
    SELECT @temp11= Xin.Notified_id
    FROM Xin() 
    WHERE @temp10 = Xin.number
    INSERT INTO Announcement(sent_at,notified_person_id,notification_object_id)
    VALUES (CURRENT_TIMESTAMP,@temp11,@temp8)
    SET @temp10 = @temp10-1
  END
END
END
CREATE FUNCTION Xin()
RETURNS @table TABLE 
(  
number int IDENTITY,
contributor_id int ,
Notified_id int
)
AS
BEGIN
DECLARE @temp10 int
DECLARE @temp11 int 
DECLARE @temp12 int
SELECT @temp10 = COUNT(ID)
FROM Contributor
WHILE (@temp10>0)
  BEGIN 
    SELECT @temp11=t2.ID ,@temp12 = t2.notified_id
    FROM 
 (Select ROW_NUMBER() OVER(ORDER BY ID) AS ROWNUM ,*
 FROM Contributor C) t2
 WHERE ROWNUM = @temp10
    INSERT INTO @table
    VALUES (@temp11,@temp12)
    SET @temp10=@temp10-1
  END
RETURN
END 
 

---------------------------------------------------------------------------------------------------------
------7------
--DROP PROC Delete_New_Request
GO
CREATE PROC Delete_New_Request
@request_id int 
AS 
BEGIN 

DELETE FROM New_Request  WHERE ID = @request_id AND accept_status IS NULL

END

-------------------------------------------------------------------------------------------------------
------8------
GO
CREATE PROC Rating_Original_Content 
@orignal_content_id int,
@rating_value DECIMAL(3,2), 
@viewer_id int
AS

BEGIN
DECLARE @countratings int
DECLARE @sumrating DECIMAL(38,2)
INSERT INTO Rate VALUES(@viewer_id,@orignal_content_id,CURRENT_TIMESTAMP,@rating_value)
SELECT @countratings=COUNT(*) FROM Rate R WHERE R.original_content_id=@orignal_content_id
SELECT @sumrating=SUM(R.rate) FROM Rate R WHERE R.original_content_id=@orignal_content_id
UPDATE Original_Content SET rating=@sumrating/@countratings WHERE ID=@orignal_content_id
END
----------------------------------
------9------
GO
CREATE PROC Write_Comment 
@comment_text varchar(50),
@viewer_id int,
@original_content_id int ,
@written_time datetime
AS
BEGIN
INSERT INTO Comment VALUES (@viewer_id, @original_content_id, @written_time, @comment_text)
END
----------------------------------

------10------
GO
CREATE PROC Edit_Comment
@comment_text varchar(50),
@viewer_id int,
@original_content_id int, 
@last_written_time datetime,
@updated_written_time datetime

AS
BEGIN
UPDATE Comment 
SET [text]=@comment_text, [date] = @updated_written_time
WHERE Viewer_id=@viewer_id AND original_content_id= @original_content_id AND [date]=@last_written_time 
END
-----------------------------------
------11------
GO 
CREATE PROC Delete_Comment 
@viewer_id int,
@original_content_id int,
@written_time datetime
AS
BEGIN
DELETE FROM Comment WHERE Viewer_id = @viewer_id AND original_content_id=@original_content_id AND [date]=@written_time
END
-----------------------------------
------12------
GO 
CREATE PROC Create_Ads 
@viewer_id int,
@description varchar(100),
@location varchar(100)
AS
BEGIN
INSERT INTO Advertisement ([description],[location],viewer_id) VALUES (@description,@location,@viewer_id)
END
------------------------------------
------13------
GO
CREATE PROC Edit_Ad 
@ad_id int,
@description VARCHAR(100), 
@location VARCHAR(100)
AS
BEGIN
UPDATE Advertisement SET [description] =@description, [location]=@location WHERE id=@ad_id
END
------------------------------------
------14------
GO
CREATE PROC Delete_Ads
@ad_id int 
AS
BEGIN
DELETE FROM Advertisement WHERE id=@ad_id
END
------------------------------------
------15------
--Drop PROC Send_Message
GO 
CREATE PROC Send_Message
@msg_text varchar(200), 
@viewer_id int , 
@contributor_id int , 
@sender_type BIT

AS 
BEGIN
INSERT INTO Messagee ([text],viewer_id,contributor_id,sender_type,sent_at)
VALUES(@msg_text,@viewer_id,@contributor_id,@sender_type,CURRENT_TIMESTAMP)
END

--------------------------------------
------16------
--Drop PROC Show_Message
GO
CREATE PROC Show_Message
@contributor_id int 
AS 
BEGIN 
SELECT *
FROM Messagee M
WHERE M.contributor_id=@contributor_id
END 
-------------------------------------
------17------
GO
CREATE PROC Highest_Rating_Original_content
AS
BEGIN
DECLARE @maxrating DECIMAL(3,2)
SELECT @maxrating = max(Oc.rating) 
FROM Original_Content OC

SELECT * 
FROM  Original_Content OC
WHERE OC.rating=@maxrating
END
--------------------------------------
------18------
GO
CREATE PROC Assign_New_Request
@request_id int ,
@contributor_id int 

AS 
DECLARE @temp4 BIT
BEGIN

SELECT @temp4 =accept_status
FROM New_Request NR
WHERE NR.ID=@request_id 
IF(@temp4 =0)
print'THE NEW REQUEST HAS BEEN REJECTED'
ELSE IF (@temp4 =1)
PRINT 'YOU CANNOT REASSIGN THE REQUEST AS IT HAS BEEN ACCEPTED BY ANOTHER ONE'
ELSE 
UPDATE New_Request set contributor_id=@contributor_id where ID=@request_id
END
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-----------------------CONTRIBUTOR--------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

------1------

GO
CREATE PROC Receive_New_Requests 
@request_id INT , 
@contributor_id INT 
AS
BEGIN 
IF(@request_id IS NOT NULL)
BEGIN
SELECT * 
FROM New_Request NR 
WHERE NR.ID = @request_id AND (contributor_id = @contributor_id OR contributor_id IS NULL)
END
ELSE 
BEGIN
SELECT *
FROM New_Request 
WHERE (contributor_id = @contributor_id OR contributor_id IS NULL)
END
END

-------------------------------------------------------------

------2------

CREATE PROC Respond_New_Request
@contributor_id int , 
@accept_status BIT , 
@request_id INT 
AS 
BEGIN
if(EXISTS(SELECT * FROM New_Request NR WHERE NR.contributor_id=@contributor_id and NR.ID=@request_id))
BEGIN 
 UPDATE New_Request 
 SET accept_status=@accept_status, Accepted_at = CURRENT_TIMESTAMP
WHERE ID=@request_id AND contributor_id=@contributor_id
END 
ELSE
BEGIN
IF (EXISTS(SELECT * FROM New_Request NR WHERE NR.contributor_id IS NULL AND  NR.ID=@request_id AND (accept_status = 0 OR accept_status IS NULL)))
BEGIN
IF(@accept_status = 1)
BEGIN
   UPDATE New_Request
   SET contributor_id=@contributor_id ,accept_status=@accept_status, Accepted_at = CURRENT_TIMESTAMP
   WHERE ID=@request_id
END
ELSE
BEGIN
UPDATE New_Request
   SET accept_status=@accept_status, Accepted_at = CURRENT_TIMESTAMP
   WHERE ID=@request_id
END
END
ELSE
  print 'It is already handled'
END
END

--------------------------------------------------------------------------------

------3------

GO
CREATE PROC Upload_Original_Content 
@type_id VARCHAR(20) ,
@subcategory_name VARCHAR(20),
@category_id VARCHAR(20) , 
@contributor_id int ,
@link VARCHAR(60)
AS 
DECLARE @temp14 INT
BEGIN 
  INSERT INTO Content
  VALUES (@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name,@type_id)
  SELECT @temp14=MAX(ID)
  FROM Content C
  INSERT INTO Original_Content (ID)
  VALUES (@temp14)
  END
-----------------------------------------------------------------------------------

------4------

GO
 
CREATE PROC Upload_New_Content 
@new_request_id INT , 
@contributor_id INT , 
@subcategory_name VARCHAR(20),
@category_id VARCHAR(20) ,
@link VARCHAR(60)

AS 
DECLARE @temp15 INT 
BEGIN 
INSERT INTO Content
VALUES (@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name,NULL)
SELECT @temp15=MAX(ID)
FROM Content C
INSERT INTO New_Content
VALUES (@temp15 ,@new_request_id)

END
---------------------------------------------------------------------------------------

------5------

 GO
CREATE PROC Delete_Content 
@content_id int 
AS
BEGIN
IF (Exists(Select * From New_Content WHERE ID=@content_id) OR Exists(Select * From Original_Content WHERE ID=@content_id AND review_status IS NULL))
DELETE FROM Content WHERE ID=@content_id
 
ELSE
print 'Cannot delete content'
END

---------------------------------------------------------------------------------------

------6------
--DECLARE @can_receive bit 
--EXEC Receive_New_Request 14, @can_receive OUTPUT
--PRINT @can_receive
GO 
CREATE PROC Receive_New_Request
@contributor_id int,
@can_receive BIT OUTPUT
AS
BEGIN
IF(EXISTS (SELECT X.contributor_id FROM X() Where X.contributor_id = @contributor_id))
BEGIN
SET @can_receive = 1
END
ELSE 
SET @can_receive = 0
END

 
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-------------------------------------STAFF---------------------------------------------
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
------0------
GO
CREATE PROC Delete_Commentx

@viewer_id int,

@original_content_id int

AS

BEGIN

DELETE FROM Comment WHERE Viewer_id = @viewer_id AND original_content_id=@original_content_id

END
------1------
GO
CREATE PROC reviewer_filter_content
@reviewer_id int ,
@original_content int,
@status BIT 
AS 
BEGIN 
UPDATE Original_Content SET reviewer_id=@reviewer_id WHERE ID=@original_content
UPDATE Original_Content SET review_status=@status  WHERE ID=@original_content

END 




--------------------------------------------------------------------------------
------2------

GO
CREATE PROC content_manager_filter_content
@content_manager_id int ,
@original_content int ,
@status BIT 

AS 
DECLARE @temp5 varchar(20)
DECLARE @temp6 varchar(20)
BEGIN 
SELECT @temp5=CM.[type]
FROM Content_manager CM 
WHERE ID=@content_manager_id
SELECT @temp6 = C.[type] 
FROM Content C
WHERE C.ID = @original_content 
IF(@temp5=@temp6)
BEGIN
UPDATE Original_Content SET content_manager_id = @content_manager_id WHERE ID = @original_content
UPDATE Original_Content SET filter_status = @status WHERE ID = @original_content
END
ELSE
print 'This manager doesn"t share the same type of the content'

END

-------------------------------------------------------------------------------------
------3------

GO
CREATE PROC Staff_Create_Category
@category_name varchar(20)
AS
BEGIN
INSERT INTO Category ([type]) 
VALUES (@category_name)
END

---------------------------------------------------------------------------------------------
------4------

GO
CREATE PROC Staff_Create_Subcategory
@category_name varchar(20) , 
@subcategory_name varchar(20)
AS 
BEGIN 
INSERT INTO Sub_Category 
VALUES(@category_name,@subcategory_name)

END

-------------------------------------------------------------------------------------------------
------5------

GO
CREATE PROC Staff_Create_Type 
@type_name varchar(20)

AS 
BEGIN
INSERT INTO Content_type
VALUES(@type_name)
END

---------------------------------------------------------------------------------------------------

------6------

GO

CREATE PROC Most_Requested_Content
AS
BEGIN 
SELECT original_content_id,COUNT(ER.ID) AS 'Number of requests'
FROM Existing_Request ER
GROUP BY original_content_id
ORDER BY Count(ID) DESC ;
END

-----------------------------------------------------------------------------------------------------------
------7------

GO
CREATE PROC Workingplace_Category_Relation
AS 
BEGIN
SELECT t1.working_place_type,t1.category_type,(t1.number_of_requests+t2.number_of_requests) AS'number of requests' 
FROM  t1() INNER JOIN  t2() ON t1.working_place_type =t2.working_place_type AND 
t2.category_type =t1.category_type
UNION
SELECT  t1.working_place_type,t1.category_type,t1.number_of_requests 
FROM t1() LEFT OUTER JOIN t2()
ON t1.working_place_type =t2.working_place_type AND 
t1.category_type =t2.category_type
WHERE t2.working_place_type IS NULL 
UNION
SELECT  t2.working_place_type,t2.category_type,t2.number_of_requests
FROM t2() LEFT OUTER JOIN  t1()
ON t2.working_place_type =t1.working_place_type AND 
t2.category_type =t1.category_type
WHERE t1.working_place_type IS NULL 
END



CREATE FUNCTION t1 ()
RETURNS @t1 TABLE
(
   working_place_type varchar(max),
   category_type varchar(max),
   number_of_requests int 
)
AS 
BEGIN
INSERT INTO @t1
SELECT V.working_place_type,C.category_type,COUNT(NR.ID)
FROM Viewer V INNER JOIN New_Request NR ON V.ID=NR.viewer_id
INNER JOIN New_Content NC ON NR.ID=NC.new_request_id
INNER JOIN Content C ON NC.ID=C.ID
GROUP BY  V.working_place_type,C.category_type
RETURN
END
DROP FUNCTION t1


CREATE FUNCTION t2 ()
returns @t2 TABLE 
(
   working_place_type varchar(max),
   category_type varchar(max),
   number_of_requests int 
)
AS
BEGIN 
INSERT INTO @t2
SELECT V.working_place_type,C.category_type,COUNT(ER.ID)
FROM Viewer V INNER JOIN Existing_Request ER ON V.ID=ER.viewer_id
INNER JOIN Original_Content OC ON OC.ID=ER.original_content_id
INNER JOIN Content C ON OC.ID=C.ID
GROUP BY  V.working_place_type,C.category_type
RETURN
END

---------------------------------------------------------------------------------
------8------

GO
CREATE PROC Delete_Original_Content 
@content_id int
AS
BEGIN
IF(EXISTS(SELECT * FROM Original_Content O WHERE O.ID=@content_id))
BEGIN
DELETE FROM Original_Content WHERE ID=@content_id
DELETE FROM Content WHERE ID=@content_id
END
ELSE
print 'not original content'
END


------------------------------------------------------------------------------------
------9------
GO
CREATE PROC Delete_New_Content 
@content_id int
AS
BEGIN
IF(EXISTS(SELECT * FROM New_Content N WHERE N.ID=@content_id))
BEGIN
DELETE FROM New_Content WHERE ID=@content_id
DELETE FROM Content WHERE ID=@content_id
END
ELSE
print 'not new content'
END


--------------------------------------------------------------------------------------
------10------
GO

CREATE PROC Assign_Contributor_Request

@contributor_id int,

@new_request_id int

AS

BEGIN

 

DECLARE @result bit

Exec Receive_New_Request @contributor_id,@result OUTPUT

 

IF(@result=1)

BEGIN

UPDATE New_Request SET contributor_id=@contributor_id WHERE ID = @new_request_id

 

--UPDATE New_Request SET accept_status=1 WHERE ID=@new_request_id AND contributor_id=@contributor_id

--UPDATE New_Request SET accept_status=1, contributor_id=@contributor_id

--WHERE ID=@new_request_id AND contributor_id IS NULL

END

 

ELSE

print 'cant assign contributor'

 

END


--------------------------LAST PROCEDURE ---------------------------------------------------------

------11------



DROP FUNCTION X;
GO

CREATE FUNCTION X ()
RETURNS @table TABLE 
(
contributor_id int 
)
AS
--kol el 3ndhom 22l mn 3 including zero 
--procc BEGIN
BEGIN
INSERT INTO @table
SELECT C2.ID
FROM Contributor C2                                                         
EXCEPT                                             
SELECT DISTINCT C3.ID
FROM Contributor C3 INNER JOIN New_Request NR1 ON C3.ID = NR1.contributor_id
UNION 
--kol el contributor 
(
SELECT NR.contributor_id
FROM New_Request NR 
              EXCEPT 
                 --BETL3 el 3ndhom 3 request dont have content 
                           SELECT NR2.contributor_id
                           FROM New_Request NR2
                                         LEFT OUTER JOIN New_Content NC ON NR2.ID=NC.new_request_id
                                         WHERE NC.ID IS NULL AND NR2.accept_status = 1
                                         GROUP BY contributor_id
                                         HAVING COUNT(*)=3)
                                                                    
 
RETURN
END

----EXEC Show_Possible_Contributors

GO
                                                                  
CREATE PROC Show_Possible_Contributors
AS 
BEGIN 
SELECT X.contributor_id, COUNT(NR.ID) AS numberrequests , AVG(CAST((C.uploaded_at - NR.Accepted_at) as int)) AS avgdays
FROM X() LEFT OUTER JOIN( New_Request NR INNER JOIN New_Content NC ON NR.ID = NC.new_request_id INNER JOIN Content C ON NC.ID = C.ID) ON X.contributor_id = NR.contributor_id
GROUP BY X.contributor_id
END
---------------------------------
GO
--DROP PROC MyRequests
CREATE PROC MyRequests
@contributor int 
AS
BEGIN
SELECT information , Accepted_at,ID FROM New_Request WHERE contributor_id = @contributor AND accept_status = 1
EXCEPT 
SELECT NR.information,NR.Accepted_at,NR.ID
FROM New_Request NR INNER JOIN New_Content NC ON NR.ID = NC.new_request_id
END
---------------------------------
GO
CREATE PROC Mycontent
@contributor int 

AS
BEGIN
SELECT C.ID, link,uploaded_at FROM Content C INNER JOIN Original_Content OC ON C.ID = OC.ID WHERE contributor_id= @contributor AND review_status IS NULL 
UNION 
SELECT C.ID, link,uploaded_at FROM New_Content NC inner join Content C ON NC.ID = C.id WHERE contributor_id = @contributor

END
---------------------------------
GO
CREATE PROC email_id
@email varchar(60),
@id int OUTPUT
AS 
DECLARE @temp1 int 
BEGIN   
SELECT @temp1=Viewer.ID FROM Viewer INNER JOIN [USER]  ON Viewer.ID = [User].ID  WHERE email = @email
SET @id = @temp1
END
-------------------------------
GO
CREATE PROC ResRequest
@contributor int
AS
BEGIN
SELECT * FROM New_Request Where accept_status IS NULL AND (contributor_id = @contributor OR contributor_id IS NULL)
END

------------------------------
-----------VIEW---------------
GO
CREATE View PossibleContributors

AS

 

SELECT X.contributor_id, COUNT(NR.ID) AS numberrequests , AVG(CAST((C.uploaded_at - NR.Accepted_at) as int)) AS avgdays

FROM X() LEFT OUTER JOIN( New_Request NR INNER JOIN New_Content NC ON NR.ID = NC.new_request_id INNER JOIN Content C ON NC.ID = C.ID) ON X.contributor_id = NR.contributor_id

GROUP BY X.contributor_id
