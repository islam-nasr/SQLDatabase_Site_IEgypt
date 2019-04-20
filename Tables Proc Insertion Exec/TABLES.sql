
-------------------------------------------------------------------TABLES---------------------------------------------------------------------------


/*
DROP TABLE Content;
DROP TABLE Original_Content;
DROP TABLE New_Content;
DROP TABLE Sub_Category;
DROP TABLE Ads_Photos_Link;
DROP TABLE Ads_Video_Link;
DROP TABLE Advertisement;
DROP TABLE Announcement;
DROP TABLE Category;
DROP TABLE Comment;
DROP TABLE Content_manager;
DROP TABLE Content_type;
DROP TABLE Contributor;
DROP TABLE Event_Photos_link;
DROP TABLE [Event];
DROP TABLE Existing_Request;
DROP TABLE Messagee;
DROP TABLE New_Request;
DROP TABLE Notification_Object;
DROP TABLE Notified_Person;
DROP TABLE Rate;
DROP TABLE Reviewer;
DROP TABLE Staff;
DROP TABLE [User];
DROP TABLE Viewer; 
 */


Go
CREATE TABLE [User]
(
  ID int IDENTITY PRIMARY KEY, 
  email varchar(60),
  first_name varchar(20),
  middle_name varchar(20),
  last_name varchar(20),
  birthdate datetime NOT NULL,
  age AS (YEAR(Current_TimeStamp)-Year(birthdate)),
  [password] varchar(20)
);

------------------------------------------------------------------------------
GO
Create Table Viewer
(
  ID int PRIMARY KEY,
  working_place varchar(20),
  working_place_type varchar(20),
  working_place_description varchar(100),
  FOREIGN KEY (ID) references [User](ID) ON UPDATE CASCADE ON DELETE CASCADE
);
 -------------------------------------------------------------------------

Create Table Notified_Person
(
ID int IDENTITY PRIMARY KEY
);

--------------------------------------------------------------------------
GO
Create Table Contributor
(
  ID int PRIMARY KEY,
  years_of_experience int,
  portifolio_link varchar(60),
  specialization varchar(30),
  notified_id int,
  FOREIGN KEY (notified_id) references Notified_person(ID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (ID) references [User](ID) ON UPDATE CASCADE ON DELETE CASCADE
);
--------------------------------------------------------------------------
GO
Create Table Staff
(
  ID int PRIMARY KEY,
  hire_date datetime,
  working_hours int,
  payment_rate int,
  total_salary AS payment_rate * working_hours,
  notified_id int,
  FOREIGN KEY (notified_id) references Notified_person(ID)
  ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (ID) references [User](ID)
  ON UPDATE CASCADE ON DELETE CASCADE
);

--------------------------------------------------------------------------
GO
CREATE TABLE Content_type
(
[type] varchar(20) PRIMARY KEY
);
--------------------------------------------------------------------------
GO
CREATE TABLE Content_manager
(
ID int PRIMARY KEY,
[type] varchar(20),
FOREIGN KEY (ID) REFERENCES Staff (ID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY ([type]) REFERENCES Content_type ([type]) ON UPDATE CASCADE ON DELETE CASCADE
 
);
--------------------------------------------------------------------------
GO
CREATE TABLE Reviewer
(
ID int PRIMARY KEY ,
FOREIGN KEY (ID) REFERENCES Staff (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
GO
CREATE TABLE Messagee 
(
sent_at DATETIME , 
contributor_id int ,
viewer_id int  ,
sender_type BIT ,
read_at DATETIME ,
[text] varchar(200),
read_status BIT,
FOREIGN KEY (contributor_id) REFERENCES Contributor(ID) ON UPDATE NO ACTION ON DELETE NO ACTION ,
FOREIGN KEY (viewer_id) REFERENCES Viewer (ID) ON UPDATE NO ACTION ON DELETE NO ACTION ,
PRIMARY KEY(contributor_id,viewer_id,sent_at,sender_type)
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Category
(
[type] varchar(20) PRIMARY KEY,
[description] varchar(100)
);
--------------------------------------------------------------------------
GO
CREATE TABLE Sub_Category
(
category_type varchar(20) foreign key references Category([type]) ON DELETE CASCADE ON UPDATE CASCADE,
[name] varchar(20),
PRIMARY KEY (category_type,[name])
  
);
--------------------------------------------------------------------------
GO
CREATE TABLE Notification_Object
(
ID int PRIMARY KEY IDENTITY 
);
--------------------------------------------------------------------------
GO
CREATE TABLE New_Request
(
ID int PRIMARY KEY IDENTITY,
accept_status BIT,
specified BIT,
information VARCHAR(200),
viewer_id int FOREIGN KEY REFERENCES Viewer(ID) ON DELETE NO ACTION ON UPDATE NO ACTION,/*ON DELETE CASCADE ON UPDATE CASCADE,*/
notif_obj_id int FOREIGN KEY REFERENCES Notification_Object(ID) ON DELETE CASCADE ON UPDATE CASCADE,
contributor_id int FOREIGN KEY REFERENCES Contributor(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
GO
CREATE TABLE Content(
ID int PRIMARY KEY IDENTITY,
link VARCHAR(60),
uploaded_at datetime,
contributor_id int FOREIGN KEY REFERENCES Contributor (ID) ON DELETE CASCADE ON UPDATE CASCADE,
category_type VARCHAR(20),
subcategory_name VARCHAR(20),
[type] VARCHAR(20) FOREIGN KEY REFERENCES Content_type([type]) ON UPDATE NO ACTION ON DELETE NO ACTION,
FOREIGN KEY (category_type,subcategory_name) REFERENCES Sub_Category(category_type,[name]) ON UPDATE NO ACTION ON DELETE NO ACTION  
);
--------------------------------------------------------------------------
GO
CREATE TABLE Original_Content(
ID int PRIMARY KEY,
content_manager_id int FOREIGN KEY REFERENCES Content_manager(ID) ,
reviewer_id int FOREIGN KEY REFERENCES Reviewer(ID) ,
review_status BIT,
filter_status BIT,
rating DECIMAL(3,2),
FOREIGN KEY(ID) REFERENCES Content(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
GO
CREATE TABLE Existing_Request(
ID int PRIMARY KEY IDENTITY,
original_content_id int FOREIGN KEY REFERENCES Original_Content(ID) ON DELETE CASCADE ON UPDATE CASCADE,
viewer_id int FOREIGN KEY REFERENCES Viewer(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
GO
CREATE TABLE New_Content(
ID int PRIMARY KEY,
new_request_id int FOREIGN KEY REFERENCES New_Request ON UPDATE NO ACTION ON DELETE NO ACTION ,
FOREIGN KEY(ID) REFERENCES Content(ID) ON UPDATE CASCADE ON DELETE CASCADE 
);
--------------------------------------------------------------------------
 
GO
CREATE TABLE Comment(
Viewer_id int ,
original_content_id int,
[date] datetime,
[text] VARCHAR(50),
PRIMARY KEY(Viewer_id,original_content_id,[date]),
FOREIGN KEY(Viewer_id) REFERENCES Viewer,
FOREIGN KEY(original_content_id)  REFERENCES Original_Content(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
 
GO
CREATE TABLE Rate(
Viewer_id int ,
original_content_id int,
[date] datetime,
rate DECIMAL(10,2),
PRIMARY KEY(Viewer_id,original_content_id),
FOREIGN KEY(Viewer_id) REFERENCES Viewer ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(original_content_id)  REFERENCES Original_Content ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------------------------------------
 
GO
-- CREATE TABLE [Event](
ID int PRIMARY KEY IDENTITY,
[description] VARCHAR(100),
[location] VARCHAR(100),
city VARCHAR(30),
timee datetime,
entertainer VARCHAR(50),
notification_object_id int FOREIGN KEY REFERENCES Notification_Object ON DELETE CASCADE ON UPDATE CASCADE,
viewer_id int FOREIGN KEY REFERENCES Viewer(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Event_Photos_link(
event_id int,
link VARCHAR(50),
PRIMARY KEY(event_id,link),
FOREIGN KEY(event_id) REFERENCES [Event](ID) ON DELETE CASCADE ON UPDATE CASCADE
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Advertisement(
id int PRIMARY KEY IDENTITY,
[description] VARCHAR(100),	
[location] VARCHAR(100),
event_id int FOREIGN KEY REFERENCES [Event](ID) ON DELETE NO ACTION  ON UPDATE NO ACTION,/*ON DELETE CASCADE ON UPDATE CASCADE,*/
viewer_id int FOREIGN KEY REFERENCES Viewer(ID) /*ON DELETE CASCADE ON UPDATE CASCADE*/
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Ads_Video_Link
(
advertisement_id int ,
link varchar(60) ,
FOREIGN KEY (advertisement_id) REFERENCES Advertisement(ID),
PRIMARY KEY(advertisement_id,link)
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Ads_Photos_Link
(
advertisement_id int ,  
link varchar(20) ,
FOREIGN KEY (advertisement_id) REFERENCES  Advertisement (ID),
PRIMARY KEY (advertisement_id,link)
);
 --------------------------------------------------------------------------
GO
CREATE TABLE Announcement
(
ID int PRIMARY KEY IDENTITY , 
seen_at DATETIME,
sent_at DATETIME,
notified_person_id int , 
notification_object_id int ,
FOREIGN KEY (notified_person_id) REFERENCES  Notified_Person (ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (notification_object_id) REFERENCES Notification_Object (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
 
-------------------------------------------------
GO
CREATE TABLE Deactivated_accounts
(ID int PRIMARY KEY,
Deact_time DATETIME,
FOREIGN KEY(ID) REFERENCES [User](ID) ON DELETE CASCADE ON UPDATE CASCADE
);

---------------------------------------


GO

CREATE TABLE Event_Videos_link(

event_id int,

link VARCHAR(50),

PRIMARY KEY(event_id,link),

FOREIGN KEY(event_id) REFERENCES [Event](ID) ON DELETE CASCADE ON UPDATE CASCADE

);
---------------------------------------
ALTER TABLE New_Request
ADD Accepted_at DATETIME
