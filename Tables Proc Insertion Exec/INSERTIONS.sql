INSERT INTO [User] VALUES('kouky@balabizo.com','Ana','Kariman','Hossam','7-6-1998','ANAKARIMANHOSSAM');
INSERT INTO [User] VALUES('nadz@balabizo.com','Ana','Nadin','ElHanafy','11-17-1998','ANANADINELHANAFY');
INSERT INTO [User] VALUES('londosii@balabizo.com','Nada','Londos','Botros','9-23-1998','ANANADALONDOS');
INSERT INTO [User] VALUES('islam@balabizo.com','Ana','Islam','Nasr','1-11-1998','ANAISLAMNASR');
INSERT INTO [User] VALUES('tarawa@balabizo.com','Mohamed','Yasser','Tarawa','6-7-1998','ANATARAWA');
INSERT INTO [User] VALUES('alfiee@balabizo.com','Ana','Menna','Alfy','4-12-1998','ANAALFIEE');
INSERT INTO [User] VALUES('shemoo@balabizo.com','Shaymaa','Shemo','Bahr','5-11-1998','ANASHEMOO');
INSERT INTO [User] VALUES('nermo@blabizo.com','Nermo','Mama','Mohamed','12-11-1997','ANANERMO');
INSERT INTO [User] VALUES('dareeni@balaizo.com','Dareen','Doudi','Behiry','2-18-1998','ANADAREEN');
INSERT INTO [User] VALUES('hanoun@balbizo.com','Hana','Hanoun','Kamal','8-11-1998','ANAHANAKAMAL');
INSERT INTO [User] VALUES('mes3ed@balabizo.com','Mas3od','Maidofhonor','Mes3ed','11-8-1998','ANAMES3ED');
INSERT INTO [User] VALUES('seif@balabizo.com','Seif','msh3arfab2a','Ebide','11-22-1998','ANASEIF');
INSERT INTO [User] VALUES('radwa@balabizo.com','Radwa','Radwati','Radwazz','2-21-1998','ANARADWAZ');
/*notified _perso*/
SET IDENTITY_INSERT dbo.Notified_Person ON;
INSERT INTO dbo.Notified_Person(ID) Values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
SET IDENTITY_INSERT dbo.Notified_Person OFF;
 
/*contributors*/
INSERT INTO Contributor Values(1,3,'kayzarts.com','graphic designe',1),(2,4,'nanoproduction.com','video editor',2),(3,5,'londoss.com','photography',3),
(4,2,'ishlam.com','director',4),(5,1,'Tarawa.com','music producer',5);
/*viewers*/
INSERT INTO Viewer Values(7,'Google','Organization','Technology Company'),(11,'ICANN','Oragnization','Nonprofit Organization'),(12,'Youtube','Organization','Video Sharing Company');
 
/* staff*/
INSERT INTO Staff Values (6,'1-1-2017',200,100,6),(8,'1-1-2017',180,100,7),(13,'1-1-2017',160,100,8),(9,'1-1-2017',300,150,9),(10,'1-1-2017',300,150,10);
 
/*Reviewers*/
INSERT INTO Reviewer Values(9),(10);
 
/*conent types*/
INSERT INTO Content_type values('Logos'),('Graphics'),('Photography');
/*conent managers*/
INSERT INTO Content_manager Values (6,'Logos'),(8,'Graphics'),(13,'Photography');
/* category / sub category */
INSERT INTO Category Values ('Education','educates people'),('Technology','Technological things'),('Art','Artistic things');
INSERT INTO Sub_Category Values ('Technology','SmartPhone'),('Art','Paintings');
/*conent*/
INSERT INTO Content Values('link1.com','2-12-2017',2,'Technology','SmartPhone','Logos'),
('link2.com','11-17-2017',2,'Art','Paintings','Graphics'),
('link3.com','12-11-2017',2,'Technology','SmartPhone','Logos'),
('link4.com','2-1-2017',3,'Art','Paintings','Photography'),
('link5.com','3-1-2017',4,'Technology','SmartPhone','Photography'),
('link6.com','4-1-2017',1,'Art','Paintings','Logos');
 
/*notication obect*/
SET IDENTITY_INSERT dbo.Notification_Object ON;
INSERT INTO Notification_Object (ID)
values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13);
SET IDENTITY_INSERT dbo.Notification_Object OFF;
/*new requets*/
INSERT INTO New_Request(accept_status,specified,information,viewer_id,notif_obj_id,contributor_id,Accepted_at)
Values 
(1,1,'ay info',7,1,1,'2-6-2017'),
(1,1,'hi some info here',11,2,1,'11-14-2017'),
(1,1,'info here byeeee',7,3,2,'10-11-2017'),
(1,1,'infooooo infooo',12,4,2,'1-29-2017'),
(1,1,'info bs',11,5,2,'2-27-2017'),
(1,1,'info info',12,6,5,'3-20-2017'),
(1,1,'information',11,7,3,'9-23-2017'),
(1,1,'info information',7,8,1,'7-11-2017'),
(0,0,'info r',11,9,NULL,'5-5-2017'),
(0,0,'infoo r',12,10,NULL,'9-9-2017'),
(0,0,'infooo r',11,11,NULL,'4-3-2017');
/*Existing requests*/
/* 3Original w 3New*/
/*Original_Content ( ID , content_manager_id, reviewer_id, review_status, filter_status, rating)*/
INSERT INTO Original_Content Values(4,13,9,1,1,5),(5,13,9,1,1,4),(6,6,10,1,1,3);
INSERT INTO Existing_Request values(4,7),(5,11);
 
INSERT INTO New_Content 
Values(1,3),
(2,4),
(3,5);
 
/*Event*/
INSERT INTO [Event] 
Values ('Technology fair','Korba','Cairo','12-3-2018','mozee3 el share3',12,7),('Vidcon','Zamalek','Cairo','11-29-2018','Caspar Lee',13,12);
/*Advertisments*/ 
INSERT INTO Advertisement Values ('Technological fair','Korba',1,7),('Vidcon','Zamalek',2,12);
