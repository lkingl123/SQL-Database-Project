-- The following script is created to initiate the company wide data structure of CollectRewards.com

drop table if exists points_redemption;
drop table if exists survey_question;
drop table if exists field_survey;
drop table if exists web_survey;
drop table if exists survey;
drop table if exists company;
drop table if exists reward;
drop table if exists consumer_address;
drop table if exists consumer_phone;
drop table if exists consumer;

--create table for the consumer data

create table consumer(
	consumer_id 				varchar(10) not null,
	consumer_first_name			varchar(100),
	consumer_last_name			varchar(100),
	consumer_email 				varchar(40) not null,
primary key (consumer_id)
)
;

--create table for consumer phone numbers

create table consumer_phone(
	consumer_id 				varchar(10) not null,
	phone_number				varchar(50)	not null,
primary key (consumer_id,phone_number),
constraint consumer_phone_fkey_consumer_id foreign key (consumer_id) references consumer(consumer_id)
)
;

--create table for consumer address

create table consumer_address(
	consumer_id 				varchar(10) not null,
	address_line_1				varchar(100) not null,
	zip_code					int not null,
	city						varchar(100) not null,
	state						varchar(100) not null,
primary key (consumer_id,address_line_1,zip_code),
constraint consumer_address_fkey_consumer_id foreign key (consumer_id) references consumer(consumer_id)
)
;

--create table for rewards data

create table reward(
	reward_id					varchar(20) not null,
	consumer_id 				varchar(10) not null,
	reward_type					varchar(50),
	points_awarded				decimal(10,3),
	last_reward_date 			date 		not null,
primary key (reward_id),
constraint reward_fkey_consumer_id foreign key (consumer_id) references consumer(consumer_id)
)
;

--create table for company

create table company(
	requesting_company_id		varchar(10) not null,
	company_type				varchar(50),
	website						varchar(100) not null,
primary key (requesting_company_id)
)
;

--create table for survey

create table survey(
	survey_id					varchar(20) not null,
	consumer_id 				varchar(10) not null,
	requesting_company_id		varchar(10) not null,
primary key (survey_id),
constraint survey_fkey_consumer_id foreign key (consumer_id) references consumer(consumer_id),
constraint survey_fkey_requesting_company_id foreign key (requesting_company_id) references company(requesting_company_id)
)
;

--create table for field_survey

create table field_survey(
	survey_id					varchar(20) not null,
	field_location				varchar(100) not null,
	field_location_zip			varchar(10) not null,
primary key (survey_id,field_location,field_location_zip),
constraint field_survey_fkey_survey_id foreign key (survey_id) references survey(survey_id))
;

--create table for web_survey

create table web_survey(
	survey_id					varchar(20) not null,
	web_search					varchar(100) not null,
primary key (survey_id,web_search),
constraint web_survey_fkey_survey_id foreign key (survey_id) references survey(survey_id)
)
;


--creating table for points redemption

 create table points_redemption(
 	gift_id 					varchar(50) not null,
 	consumer_id 				varchar(10) not null,
 	redemption_date				date not null,
 	points_required				varchar(20) not null,
primary key (gift_id),
constraint points_redemption_fkey_consumer_id foreign key (consumer_id) references consumer(consumer_id)
)
;

--create table for survey_question

create table survey_question(
	survey_id					varchar(20) not null,
	question					varchar(200) not null,
	answer						varchar(200) not null,
primary key (survey_id,question),
constraint survey_question_fkey_survey_id foreign key (survey_id) references survey(survey_id)
)
;


--Inserting values in consumer Table

insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (1, 'Jorrie', 'Battams', 'jbattams0@technorati.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (2, 'Merrel', 'Tremellier', 'mtremellier1@t-online.de');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (3, 'Julienne', 'Dykes', 'jdykes2@unicef.org');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (4, 'Lin', 'Crock', 'lcrock3@ox.ac.uk');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (5, 'Timofei', 'Regis', 'tregis4@360.cn');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (6, 'Doralin', 'Danter', 'ddanter5@nationalgeographic.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (7, 'Milt', 'Shields', 'mshields6@slate.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (8, 'Portie', 'Durward', 'pdurward7@unblog.fr');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (9, 'Ibbie', 'Lodder', 'ilodder8@geocities.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (10, 'Alric', 'Booler', 'abooler9@pbs.org');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (11, 'Berny', 'Blundon', 'bblundona@virginia.edu');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (12, 'Pepe', 'Pentecost', 'ppentecostb@examiner.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (13, 'Linet', 'Hardwick', 'lhardwickc@newyorker.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (14, 'Gabbie', 'Jacquemard', 'gjacquemardd@about.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (15, 'Fayth', 'Hedger', 'fhedgere@shutterfly.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (16, 'Alphard', 'Dossett', 'adossettf@narod.ru');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (17, 'Keven', 'Coalbran', 'kcoalbrang@dedecms.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (18, 'Sheelagh', 'Pengelley', 'spengelleyh@lycos.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (19, 'Alden', 'Sandall', 'asandalli@examiner.com');
insert into consumer (consumer_id, consumer_first_name, consumer_last_name, consumer_email) values (20, 'Francesca', 'Melville', 'fmelvillej@wired.com');

--Inserting values in consumer_address table

insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (1, '3 Fieldstone Terrace', '78220', 'San Antonio', 'Texas');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (2, '75 Calypso Pass', '10280', 'New York City', 'New York');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (3, '1205 Marquette Road', '90005', 'Los Angeles', 'California');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (4, '56 Dryden Crossing', '28805', 'Asheville', 'North Carolina');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (5, '4 Dovetail Park', '16107', 'New Castle', 'Pennsylvania');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (6, '9 Acker Junction', '48098', 'Troy', 'Michigan');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (7, '73360 Grasskamp Alley', '34981', 'Fort Pierce', 'Florida');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (8, '700 Cody Pass', '19115', 'Philadelphia', 'Pennsylvania');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (9, '46 Comanche Road', '10155', 'New York City', 'New York');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (10, '1594 David Way', '78205', 'San Antonio', 'Texas');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (11, '9002 Starling Park', '77386', 'Spring', 'Texas');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (12, '268 Esker Hill', '20883', 'Gaithersburg', 'Maryland');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (13, '27 Moland Avenue', '02453', 'Waltham', 'Massachusetts');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (14, '37 Corben Park', '21281', 'Baltimore', 'Maryland');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (15, '6423 Grasskamp Lane', '76110', 'Fort Worth', 'Texas');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (16, '608 Thackeray Pass', '19605', 'Reading', 'Pennsylvania');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (17, '560 Helena Lane', '23272', 'Richmond', 'Virginia');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (18, '2 Swallow Circle', '80209', 'Denver', 'Colorado');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (19, '945 Iowa Circle', '85725', 'Tucson', 'Arizona');
insert into consumer_address (consumer_id, address_line_1, zip_code, city, state) values (20, '325 Hanover Way', '20535', 'Washington', 'District of Columbia');

--Inserting values in consumer_phone table
insert into consumer_phone (consumer_id, phone_number) values (1, '8597716128');
insert into consumer_phone (consumer_id, phone_number) values (2, '8904624051');
insert into consumer_phone (consumer_id, phone_number) values (3, '2494188638');
insert into consumer_phone (consumer_id, phone_number) values (4, '7839741822');
insert into consumer_phone (consumer_id, phone_number) values (5, '8267731888');
insert into consumer_phone (consumer_id, phone_number) values (6, '1611062650');
insert into consumer_phone (consumer_id, phone_number) values (7, '3527368526');
insert into consumer_phone (consumer_id, phone_number) values (8, '1953937237');
insert into consumer_phone (consumer_id, phone_number) values (9, '1245895660');
insert into consumer_phone (consumer_id, phone_number) values (10, '2217408953');
insert into consumer_phone (consumer_id, phone_number) values (11, '7299276726');
insert into consumer_phone (consumer_id, phone_number) values (12, '9276978374');
insert into consumer_phone (consumer_id, phone_number) values (13, '6646794970');
insert into consumer_phone (consumer_id, phone_number) values (14, '1426967090');
insert into consumer_phone (consumer_id, phone_number) values (15, '7935674469');
insert into consumer_phone (consumer_id, phone_number) values (16, '1622614943');
insert into consumer_phone (consumer_id, phone_number) values (17, '2577187135');
insert into consumer_phone (consumer_id, phone_number) values (18, '8768465091');
insert into consumer_phone (consumer_id, phone_number) values (19, '8478080870');
insert into consumer_phone (consumer_id, phone_number) values (20, '7176975330');

--Inserting values in company table

insert into company (requesting_company_id, company_type, website) values (100,'Raynor Inc','raynorinc.com' );
insert into company (requesting_company_id, company_type, website) values (200,'Considine and Sons','considineandsons.com' );
insert into company (requesting_company_id, company_type, website) values (300,'Purdy-Bartell','purdy-bartell.com' );
insert into company (requesting_company_id, company_type, website) values (400,'Cruickshank-Dicki','cruickshank-dicki.com' );
insert into company (requesting_company_id, company_type, website) values (500,'Goyette, Goldner and Friesen','ggfriesen.com' );
insert into company (requesting_company_id, company_type, website) values (600,'Gorczany-Hahn','gorczany-hahn.com' );
insert into company (requesting_company_id, company_type, website) values (700,'Tillman LLC','tillmanllc.com' );
insert into company (requesting_company_id, company_type, website) values (800,'Towne, Welch and Koelpin','townewelchkoelpin.com' );
insert into company (requesting_company_id, company_type, website) values (900,'Mayer LLC','mayer.com' );
insert into company (requesting_company_id, company_type, website) values (1000,'Watsica-Hoeger','watsica-hoeger.com' );
insert into company (requesting_company_id, company_type, website) values (1100,'Nitzsche LLC','nitzsche.com' );
insert into company (requesting_company_id, company_type, website) values (1200,'Stiedemann, Wuckert and Kerluke','stiedemann, wuckert and kerluke.com' );
insert into company (requesting_company_id, company_type, website) values (1300,'Feeney and Sons','feeneyandsons.com' );
insert into company (requesting_company_id, company_type, website) values (1400,'Effertz and Sons','effertzandsons.com' );
insert into company (requesting_company_id, company_type, website) values (1500,'Schowalter, Dietrich and Mills','schowalterdietrichandmills.com' );
insert into company (requesting_company_id, company_type, website) values (1600,'Wuckert and Sons','wuckertandsons.com' );
insert into company (requesting_company_id, company_type, website) values (1700,'Larson-Borer','larson-borer.com' );
insert into company (requesting_company_id, company_type, website) values (1800,'Champlin-Smith','champlin-smith.com' );
insert into company (requesting_company_id, company_type, website) values (1900,'Smitham Library','smithamgroup.com' );
insert into company (requesting_company_id, company_type, website) values (2000,'Schowalter and Sons','schowalterandsons.com' );

--Inserting values in survey table

insert into survey (survey_id, consumer_id, requesting_company_id) values (21, 1, 100);
insert into survey (survey_id, consumer_id, requesting_company_id) values (22, 2, 200);
insert into survey (survey_id, consumer_id, requesting_company_id) values (23, 3, 300);
insert into survey (survey_id, consumer_id, requesting_company_id) values (24, 4, 400);
insert into survey (survey_id, consumer_id, requesting_company_id) values (25, 5, 500);
insert into survey (survey_id, consumer_id, requesting_company_id) values (26, 6, 600);
insert into survey (survey_id, consumer_id, requesting_company_id) values (27, 7, 700);
insert into survey (survey_id, consumer_id, requesting_company_id) values (28, 8, 800);
insert into survey (survey_id, consumer_id, requesting_company_id) values (29, 9, 900);
insert into survey (survey_id, consumer_id, requesting_company_id) values (30, 10, 1000);
insert into survey (survey_id, consumer_id, requesting_company_id) values (31, 11, 1100);
insert into survey (survey_id, consumer_id, requesting_company_id) values (32, 12, 1200);
insert into survey (survey_id, consumer_id, requesting_company_id) values (33, 13, 1300);
insert into survey (survey_id, consumer_id, requesting_company_id) values (34, 14, 1400);
insert into survey (survey_id, consumer_id, requesting_company_id) values (35, 15, 1500);
insert into survey (survey_id, consumer_id, requesting_company_id) values (36, 16, 1600);
insert into survey (survey_id, consumer_id, requesting_company_id) values (37, 17, 1700);
insert into survey (survey_id, consumer_id, requesting_company_id) values (38, 18, 1800);
insert into survey (survey_id, consumer_id, requesting_company_id) values (39, 19, 1900);
insert into survey (survey_id, consumer_id, requesting_company_id) values (40, 20, 2000);
insert into survey (survey_id, consumer_id, requesting_company_id) values (41, 1, 100);
insert into survey (survey_id, consumer_id, requesting_company_id) values (42, 2, 200);
insert into survey (survey_id, consumer_id, requesting_company_id) values (43, 3, 300);
insert into survey (survey_id, consumer_id, requesting_company_id) values (44, 4, 400);
insert into survey (survey_id, consumer_id, requesting_company_id) values (45, 5, 500);
insert into survey (survey_id, consumer_id, requesting_company_id) values (46, 6, 600);
insert into survey (survey_id, consumer_id, requesting_company_id) values (47, 7, 700);
insert into survey (survey_id, consumer_id, requesting_company_id) values (48, 8, 800);
insert into survey (survey_id, consumer_id, requesting_company_id) values (49, 9, 900);
insert into survey (survey_id, consumer_id, requesting_company_id) values (50, 10, 1000);
insert into survey (survey_id, consumer_id, requesting_company_id) values (51, 11, 1100);
insert into survey (survey_id, consumer_id, requesting_company_id) values (52, 12, 1200);
insert into survey (survey_id, consumer_id, requesting_company_id) values (53, 13, 1300);
insert into survey (survey_id, consumer_id, requesting_company_id) values (54, 14, 1400);
insert into survey (survey_id, consumer_id, requesting_company_id) values (55, 15, 1500);
insert into survey (survey_id, consumer_id, requesting_company_id) values (56, 16, 1600);
insert into survey (survey_id, consumer_id, requesting_company_id) values (57, 17, 1700);
insert into survey (survey_id, consumer_id, requesting_company_id) values (58, 18, 1800);
insert into survey (survey_id, consumer_id, requesting_company_id) values (59, 19, 1900);
insert into survey (survey_id, consumer_id, requesting_company_id) values (60, 20, 2000);

--Inserting values in field_survey table

insert into field_survey (survey_id, field_location, field_location_zip) values (21, '5127 Waubesa Alley', '1234');
insert into field_survey (survey_id, field_location, field_location_zip) values (22, '00 Ridgeway Avenue', '2345');
insert into field_survey (survey_id, field_location, field_location_zip) values (23, '3 South Junction', '3456');
insert into field_survey (survey_id, field_location, field_location_zip) values (24, '493 Hudson Place', '4567');
insert into field_survey (survey_id, field_location, field_location_zip) values (25, '7222 Forster Drive', '4990-565');
insert into field_survey (survey_id, field_location, field_location_zip) values (26, '9228 Meadow Vale Lane', '31914');
insert into field_survey (survey_id, field_location, field_location_zip) values (27, '83 Crescent Oaks Park', '5678');
insert into field_survey (survey_id, field_location, field_location_zip) values (28, '34981 Westend Hill', '7890');
insert into field_survey (survey_id, field_location, field_location_zip) values (29, '3073 Old Gate Road', '2437');
insert into field_survey (survey_id, field_location, field_location_zip) values (30, '96 Dottie Point', '415 22');
insert into field_survey (survey_id, field_location, field_location_zip) values (31, '92 Grover Plaza', '252 46');
insert into field_survey (survey_id, field_location, field_location_zip) values (32, '64 Susan Drive', '26-220');
insert into field_survey (survey_id, field_location, field_location_zip) values (33, '970 Nevada Plaza', 'MD-3547');
insert into field_survey (survey_id, field_location, field_location_zip) values (34, '5774 Loftsgordon Plaza', '77570');
insert into field_survey (survey_id, field_location, field_location_zip) values (35, '2723 Claremont Terrace', '76-230');
insert into field_survey (survey_id, field_location, field_location_zip) values (36, '91282 Village Green Junction', '4568');
insert into field_survey (survey_id, field_location, field_location_zip) values (37, '7 Darwin Alley', '08002');
insert into field_survey (survey_id, field_location, field_location_zip) values (38, '61047 Magdeline Way', '6789');
insert into field_survey (survey_id, field_location, field_location_zip) values (39, '85479 School Pass', '5678');
insert into field_survey (survey_id, field_location, field_location_zip) values (40, '55 Birchwood Center', '694440');

--Inserting values in web_survey table

insert into web_survey (survey_id, web_search) values (41,'raynorinc.com');
insert into web_survey (survey_id, web_search) values (42,'considineandsons.com');
insert into web_survey (survey_id, web_search) values (43,'purdy-bartell.com');
insert into web_survey (survey_id, web_search) values (44,'cruickshank-dicki.com');
insert into web_survey (survey_id, web_search) values (45,'ggfriesen.com');
insert into web_survey (survey_id, web_search) values (46,'gorczany-hahn.com');
insert into web_survey (survey_id, web_search) values (47,'tillmanllc.com');
insert into web_survey (survey_id, web_search) values (48,'townewelchkoelpin.com');
insert into web_survey (survey_id, web_search) values (49,'mayer.com');
insert into web_survey (survey_id, web_search) values (50,'watsica-hoeger.com');
insert into web_survey (survey_id, web_search) values (51,'nitzsche.com');
insert into web_survey (survey_id, web_search) values (52,'stiedemann, wuckert and kerluke.com');
insert into web_survey (survey_id, web_search) values (53,'feeneyandsons.com');
insert into web_survey (survey_id, web_search) values (54,'effertzandsons.com');
insert into web_survey (survey_id, web_search) values (55,'schowalterdietrichandmills.com');
insert into web_survey (survey_id, web_search) values (56,'wuckertandsons.com');
insert into web_survey (survey_id, web_search) values (57,'larson-borer.com');
insert into web_survey (survey_id, web_search) values (58,'champlin-smith.com');
insert into web_survey (survey_id, web_search) values (59,'smithamgroup.com');
insert into web_survey (survey_id, web_search) values (60,'schowalterandsons.com');

--Insetring data into points_redemption table

insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WZ377', 1, '2022-08-30', 50);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('TX46G', 2, '2022-02-21', 125);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('EX85P', 3, '2022-05-30', 200);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('QZ63D', 4, '2022-05-16', 275);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AR24E', 5, '2022-08-12', 350);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WR065', 6, '2022-10-18', 425);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('GW05G', 7, '2022-02-25', 500);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('ZD12S', 8, '2022-09-20', 575);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('PO11X', 9, '2022-07-10', 650);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AY12F', 10, '2022-10-14', 725);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('QN95S', 11, '2022-07-15', 800);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WA896', 12, '2022-09-16', 875);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('PO65C', 13, '2022-09-24', 950);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('YE290', 14, '2022-06-15', 1025);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('MC44U', 15, '2022-02-20', 1100);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AS13J', 16, '2022-02-08', 1175);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('VR621', 17, '2022-03-17', 1250);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AE000', 18, '2022-03-28', 1325);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('NH897', 19, '2022-04-27', 1400);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('JH25W', 20, '2022-09-24', 1475);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('TK69F', 1, '2022-10-21', 1550);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('EO28B', 2, '2022-08-11', 1625);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WJ55D', 3, '2022-07-31', 1700);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('JE81U', 4, '2022-04-30', 1775);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('ZA30H', 5, '2022-04-12', 1850);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('OM64C', 6, '2022-09-04', 1925);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AY65A', 7, '2022-06-18', 2000);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('ZX76P', 8, '2022-05-05', 124);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('BC081', 9, '2022-05-28', 199);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WQ13F', 10, '2022-08-03', 274);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('KE97H', 11, '2022-08-04', 349);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('YP226', 12, '2022-03-07', 424);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('CD376', 13, '2022-05-22', 499);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('VZ15B', 14, '2022-04-01', 574);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('AH80K', 15, '2022-07-20', 649);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('JX021', 16, '2022-08-21', 724);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('DA31L', 17, '2022-07-20', 799);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('GW65V', 18, '2022-07-03', 874);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('GW76D', 19, '2022-08-06', 949);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('GY526', 20, '2022-05-23', 1024);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('UE87C', 1, '2022-08-19', 1099);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('WL563', 2, '2022-05-20', 1174);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('EZ31G', 3, '2022-03-25', 1249);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('IK447', 4, '2022-07-12', 1324);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('TK604', 5, '2022-05-30', 1399);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('JK62J', 6, '2022-06-07', 1474);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('GP45F', 7, '2022-05-09', 1549);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('BJ97F', 8, '2022-02-18', 1624);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('EC10P', 9, '2022-04-07', 1699);
insert into points_redemption (gift_id, consumer_id, redemption_date, points_required) values ('CZ70Y', 10, '2022-03-12', 1774);

--Inserting data into survey question table

insert into survey_question (survey_id, question, answer) values ('33', 'Did you visit this place?', 'Yes' );
insert into survey_question (survey_id, question, answer) values ('33', 'How would you rate the food on the scale of 1-5. 5 being the highest value?','4' );
insert into survey_question (survey_id, question, answer) values ('33', 'How would you rate the ambience on the scale of 1-5. 5 being the highest value?','4' );
insert into survey_question (survey_id, question, answer) values ('33', 'How would you rate the service on the scale of 1-5. 5 being the highest value?','4' );
insert into survey_question (survey_id, question, answer) values ('33', 'Would you like to visit this place again?','Yes' );
insert into survey_question (survey_id, question, answer) values ('59', 'Did you visit this place?', 'Yes' );
insert into survey_question (survey_id, question, answer) values ('59', 'How would you rate the books on the scale of 1-5. 5 being the highest value?','5' );
insert into survey_question (survey_id, question, answer) values ('59', 'How would you rate the ambience on the scale of 1-5. 5 being the highest value?','3' );
insert into survey_question (survey_id, question, answer) values ('59', 'How would you rate the service on the scale of 1-5. 5 being the highest value?','4' );
insert into survey_question (survey_id, question, answer) values ('59', 'Would you like to visit this place again?','Yes' );

--inserting values into rewards table
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (91,1,20,'2021-11-03');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (92,2,20,'2020-12-05');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (93,1,20,'2022-04-13');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (94,2,20,'2022-02-03');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (95,3,20,'2020-12-13');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (96,3,20,'2022-06-23');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (97,5,20,'2022-04-12');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (98,5,20,'2022-03-03');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (99,7,20,'2021-07-02');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (81,8,20,'2020-11-03');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (82,9,20,'2022-08-10');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (83,10,20,'2021-12-14');
insert into reward (reward_id, consumer_id, points_awarded, last_reward_date) values (84,3,20,'2021-09-13');

--QUERIES

select c.consumer_id,c.consumer_first_name, sum(points_awarded) 
from consumer c 
inner join reward r
on c.consumer_id=r.consumer_id
group by c.consumer_id
having sum(points_awarded) >= 20
order by consumer_first_name asc;
 
 
select consumer_id, s.survey_id, web_search 
from survey s 
inner join web_survey w
on s.survey_id=w.survey_id where s.requesting_company_id in('1000','1900')
order by survey_id desc;

/* Selecting consumers with the gift id starting with 'W'
  */
select c.consumer_id, redemption_date, pr.gift_id  
from consumer c 
inner join points_redemption pr 
on pr.consumer_id = c.consumer_id
group by c.consumer_id, pr.redemption_date, pr.gift_id  
having pr.gift_id like 'W%'
order by pr.redemption_date;


select consumer_first_name, consumer_id 
from consumer c 
where consumer_first_name like '%a%'
order by consumer_id  desc;
