describe `room type`;



#----------------------------------------------------------------------------------------
insert into `room type` (RoomPriceNight, Capacity, RoomDesc)
values 
	(20, 1, 'Single'), 
	(40, 2, 'Double'), 
	(70, 4, 'Family'), 
	(100, 4, 'VIP')
;
select * from `room type`;

insert into `role`(RollTitle)
values 
	('Apkopējs'),
    ('Istabene'),
    ('Šveicars'),
    ('Tehniskais darbinieks'),
    ('IT daļas priekšnieks'),
    ('Adminstrators'),
    ('Pavārs'),
    ('Šefpavārs'),
    ('Viesnīcas vadītājs'),
    ('Viesnīcas īpašnieks')
;
select * from `role`;

insert into `restaurant` (Name)
values 
	('Džungļu ēstuve'),
    ('Mežonīgie lauki'),
    ('Food is here'),
    ('Miesnieks'),
    ('Ģimenes restorāns');
select * from restaurant;

insert into `foodorders` (Restaurant_ID, Date, Price)
values 
	(1, curdate(), 5.00),
    (1, curdate(), 4.20),
    (1, curdate(), 6.69),
	(2, curdate(), 7.77),
    (2, curdate(), 2.43),
    (3, curdate(), 11.29),
    (4, curdate(), 2.5),
    (4, curdate(), 99.9),
    (5, curdate(), 6.69)
;
select * from foodorders;

insert into `guestdetail` (FirstName, LastName, PersonalCode, Email, Adress, PostalCode, City, Country, PhoneNo)
values
    ('Jānis', 'Blumbergs', '220104-22132', 'janis.blumbergs@gmail.com', 'Mežs', 'LV-4701', 'Ērģeme', 'Latvija', "2574095"),
    ('Gustavs', 'Šics', '101312-20719', 'gustavs.sics@gmail.com', 'Pretī kino', 'LV-4201', 'Valmiera', 'Latvija', "2313111"),
    ('Aldis', 'Kalns', '220104-312212', 'kalns@outlook.com', 'Pie kebaba', 'LV-4002', 'Liepāja', 'Latvija', '23122122'),
    ('Sheridan', 'Shegog', 'sshegog0@webmd.com', '94690 Northland Lane', null, 'Sojo', 'Peru', '4629933386'),
	('Sansone', 'Coiley', 'scoiley1@whitehouse.gov', '7424 Mariners Cove Plaza', null, 'Thị Trấn Ngải Giao', 'Vienam', '3918103651'),
	('Odelinda', 'Vaszoly', 'ovaszoly2@pagesperso-orange.fr', '71 Oak Valley Park', '4580-604', 'Sobrosa', 'Portugal', '7191567488'),
	('Tricia', 'Zelland', 'tzelland3@netvibes.com', '187 Myrtle Center', null, 'Enjiang', 'China', '4074171450'),
	('Lenette', 'Beaconsall', 'lbeaconsall4@nytimes.com', '50 Express Drive', '964-0432', 'Mobara', 'Japan', '6314543423'),
	('Gena', 'Arnopp', 'garnopp5@vimeo.com', '802 Raven Circle', '29220', 'Columbia', 'United States', '8038752982'),
	('Gabriele', 'Ryal', 'gryal6@jugem.jp', '6251 Mariners Cove Alley', '9400', 'Brandfort', 'South Africa', '8453462697'),
	('Forster', 'Lenney', 'flenney7@hc360.com', '134 Delaware Lane', '31422', 'Gorjani', 'Croatia', '4108762425'),
	('Ceve', 'Greaterex', 'cgreaterex8@dot.gov', '39036 Hoffman Point', '71770', 'Seremban', 'Malaysia', '7651987131'),
	('Myra', 'Fronks', 'mfronks9@drupal.org', '8 Judy Court', '569 24', 'Kunčina', 'Czech Republic', '2994059036')
;
select * from guestdetail;

insert into `hotel` (Restaurant_ID, Rooms, Hotel_Name, AdressLine1, PostalCode, City, Country, PhoneNo, StarRating, NumberOfEmployees)
values 
	(1, 0, 'gustava viesnica', 'Zāļu iela 3', 'LV-4201', 'Liepāja', 'Latvija', 2331232, 4, 0),
    (1, 0, 'Goyette, Daugherty and Kub', '7719 Bunker Hill Way', '4832-541', 'Shyroke', 'Ukraine', '8051090696', 1, 0)
;
select * from hotel;

insert into `employee` (Hotel_ID, Role_ID, FirstName, LastName, PhoneNo, Email, Salary)
values 
	(1, 1, 'Kristers', 'Puzis', 2323131, 'kristers@gmail.com', 600),
    (1, 1, 'Aldis', 'Kalns', 2323131, 'dzeks@yahoo.com', 650),
    (1, 2, 'Pēteris', 'Kreisais', 2311111, 'peteris.kreisais@inbox.lv', 800),
	(1, 2, 'Markuss', 'Ābols', 2567834, 'mazaiszirgdzins@inbox.lv', 800),
    (1, 3, 'Artūrs', 'Mazais', 24252211, 'tavamazaaa@inbox.lv', 800),
	(1, 4, 'Jānis', 'Podnieks', 22222222, 'podnieks@outlook.com', 1020),
	(1, 4, 'Santa', 'Marija', 24444211, 'meeerce@gmail.com', 1040),
	(1, 5, 'Līga', 'Trešā', 2997674, 'sveetkuliiiga@gmail.com', 800),
	(1, 5, 'Džeks', 'Līkais', 2114131, 'liikaissiikais@inbox.lv', 800),
	(1, 6, 'Mikus', 'Lasis', 2313111, 'lasaKungs@gmail.com', 950),
	(1, 6, 'Kaspars', 'Čells', 2323131, 'instruments@inbox.lv', 970),
	(1, 7, 'Alberts', 'Šics', 2131111, 'alberts.sics@outlook.com', 1000),
	(1, 8, 'Otto', 'Otrais', 2311133, 'otraisOtto@gmail.com', 1500),
	(1, 9, 'Gustavs', 'Iļjučonoks', 27743711, 'es@gmail.com', 10000),
    (1, 8, 'Otto', 'Otrais', 2311133, 'otraisOtto@gmail.com', 1500),
    (1, 9, 'Gustavs', 'Iļjučonoks', 27743711, 'es@gmail.com', 10000),
    
    (2, 1, 'Illustrée-Lebsack', 'Sparrow', '1329209535', 'gsnelling0@is.gd', 300),
	(2, 2, 'Béatrice', 'Arnett', '4002507532', 'tstubbley1@163.com', 300),
	(2, 3, 'Wá', 'Sidworth', '1455132005', 'ctimmons2@cnet.com', 350),
	(2, 4, 'Lorène', 'Grimsdell', '7451815044', 'aplenderleith3@ezinearticles.com', 500),
	(2, 5, 'Nuó', 'Izkovicz', '8021175290', 'chauck4@mayoclinic.com', 600),
	(2, 6, 'Liè', 'Champneys', '1601094429', 'dotridge5@biglobe.ne.jp', 700),
	(2, 7, 'Alizée', 'Sictornes', '5675294506', 'hmccurtin6@reference.com', 800),
	(2, 8, 'Yénora', 'Sollam', '3266322764', 'spaschek7@purevolume.com', 900),
	(2, 9, 'Håkan', 'Yerill', '2081201717', 'oguesford8@yahoo.com', 900),
	(2, 10, 'Mélissandre', 'Message', '4994888483', 'jgethings9@meetup.com', 4000),

	(3, 1, 'Irène', 'Mawne', '7925862328', 'bmawne0@berkeley.edu', 600),
	(3, 1, 'Luaku', 'Smith', '322112111', 'dzeks@gmail.com', 650),
	(3, 2, 'Méng', 'Brymham', '4228888887', 'dbrymham1@artisteer.com', 600),
	(3, 3, 'Solène', 'Banisch', '9947914012', 'sbanisch2@flickr.com', 780),
	(3, 4, 'Marlène', 'Wyss', '6282433199', 'rwyss3@ed.gov', 1000),
	(3, 5, 'Maëline', 'Seiter', '8352399960', 'iseiter4@networkadvertising.org', 960),
	(3, 6, 'Véronique', 'Orum', '9925765501', 'dorum5@blogtalkradio.com', 870),
	(3, 7, 'Valérie', 'Lawler', '8788894632', 'rlawler6@slate.com', 950),
	(3, 8, 'Léana', 'Tooher', '5589119326', 'gtooher7@addthis.com', 1050),
	(3, 9, 'Gaïa', 'Newark', '8672872272', 'tnewark8@time.com', 3000),
	(3, 10, 'Méghane', 'Seamon', '5627745812', 'aseamon9@mayoclinic.com', 7000),

	(4, 1, 'Magdalène', 'Beacon', '5501681796', 'gbeacon0@biglobe.ne.jp', 700),
	(4, 2, 'Méng', 'Dobbie', '4032854317', 'adobbie1@mozilla.com', 800),
	(4, 3, 'Marylène', 'Cast', '4971245889', 'tcast2@smh.com.au', 800),
	(4, 4, 'Maëly', 'Oldnall', '2657335388', 'voldnall3@deviantart.com', 859),
	(4, 5, 'Solène', 'Matic', '6081288996', 'ematic4@chronoengine.com', 1000),
	(4, 6, 'Marie-josée', 'Cornu', '2047121900', 'ecornu5@dropbox.com', 1400),
	(4, 7, 'Pélagie', 'Roels', '7749740978', 'groels6@flickr.com', 1022),
	(4, 8, 'Mélissandre', 'Burel', '4267287992', 'lburel7@hud.gov', 1222),
	(4, 9, 'Erwéi', 'Morrissey', '2843388893', 'lmorrissey8@clickbank.net', 4000),
	(4, 10, 'Béatrice', 'Kempshall', '8425735854', 'akempshall9@auda.org.au', 6000),

	(5, 1, 'Hélène', 'Callar', '4208936145', 'acallar0@va.gov', 500),
	(5, 2, 'Sélène', 'Mongenot', '5407647785', 'vmongenot1@parallels.com', 500),
	(5, 3, 'Anaé', 'Guiden', '4483469020', 'lguiden2@nih.gov', 500),
	(5, 4, 'Aurélie', 'Moryson', '7359848008', 'emoryson3@taobao.com', 700),
	(5, 5, 'Anaël', 'Crowhurst', '5438465345', 'jcrowhurst4@ucla.edu', 1000),
	(5, 6, 'Liè', 'Atherton', '7105771899', 'satherton5@ocn.ne.jp', 804),
	(5, 7, 'Clélia', 'Angell', '7105492685', 'bangell6@people.com.cn', 989),
	(5, 8, 'Yáo', 'Bowller', '6039487742', 'rbowller7@ow.ly', 1042),
	(5, 9, 'Léane', 'Simnel', '4882921034', 'ksimnel8@cdc.gov', 4000),
	(5, 10, 'Garçon', 'Gwyther', '4231631027', 'sgwyther9@alexa.com', 6530),

	(6, 1, 'Solène', 'Hugonneau', '6518433072', 'ihugonneau0@tinypic.com', 300),
	(6, 2, 'Styrbjörn', 'Curmi', '6816943348', 'acurmi1@xrea.com', 300),
	(6, 3, 'Almérinda', 'Iorillo', '1252998661', 'liorillo2@deliciousdays.com', 400),
	(6, 4, 'Adélaïde', 'Gissop', '4011064428', 'igissop3@trellian.com', 600),
	(6, 5, 'Thérèsa', 'Rosenzwig', '7271141902', 'nrosenzwig4@blog.com', 860),
	(6, 6, 'Hélèna', 'Legon', '6389863796', 'ilegon5@google.pl', 500),
	(6, 7, 'Maëlann', 'Tender', '4784415858', 'wtender6@ameblo.jp', 700),
	(6, 8, 'Valérie', 'Yanyushkin', '8017808842', 'tyanyushkin7@time.com', 800),
	(6, 9, 'Kallisté', 'Waddoups', '9136481940', 'bwaddoups8@ovh.net', 2500),
	(6, 10, 'Noëlla', 'Rozec', '2178776207', 'orozec9@nasa.gov', 3000),

	(7, 1, 'Clémence', 'Wiltsher', '6847401732', 'rwiltsher0@state.gov', 800),
	(7, 2, 'Marie-françoise', 'Martignoni', '4643021988', 'bmartignoni1@dot.gov', 900),
	(7, 3, 'Méthode', 'Bridgewater', '8214587050', 'cbridgewater2@blogtalkradio.com', 750),
	(7, 4, 'Maëlys', 'Guiett', '7669244451', 'mguiett3@domainmarket.com', 1000),
	(7, 5, 'Agnès', 'Craigg', '8092616970', 'rcraigg4@independent.co.uk', 900),
	(7, 6, 'Annotée', 'Mussalli', '6673631220', 'emussalli5@amazon.com', 1000),
	(7, 7, 'Marie-noël', 'Lattie', '6125101163', 'flattie6@g.co', 1500),
	(7, 8, 'Adélie', 'Burness', '6183106414', 'mburness7@skyrock.com', 2000),
	(7, 9, 'Célestine', 'Pohlak', '3528276603', 'mpohlak8@github.io', 8000),
	(7, 10, 'Lén', 'Snoddon', '5642063588', 'ssnoddon9@latimes.com', 15000),

	(8, 1, 'Léone', 'Wink', '3205241463', 'owink0@xrea.com', 300),
	(8, 2, 'Åslög', 'Michelmore', '3226066781', 'rmichelmore1@last.fm', 350),
	(8, 3, 'Chloé', 'Thibodeaux', '8056635897', 'cthibodeaux2@parallels.com', 400),
	(8, 4, 'Almérinda', 'Vickar', '9259370941', 'cvickar3@clickbank.net', 500),
	(8, 5, 'Maëlyss', 'Bott', '6271216606', 'obott4@digg.com', 600),
	(8, 6, 'Göran', 'Enderson', '7799559606', 'kenderson5@prweb.com', 800),
	(8, 7, 'Léane', 'Porker', '7966694279', 'gporker6@auda.org.au', 600),
	(8, 8, 'Médiamass', 'Perico', '6777047230', 'jperico7@washingtonpost.com', 750),
	(8, 9, 'Annotés', 'Kleinerman', '9946099866', 'hkleinerman8@w3.org', 900),
	(8, 10, 'Océane', 'Halston', '9458895253', 'thalston9@google.fr', 2500),

	(9, 1, 'Bérénice', 'D''Antonio', '5862891123', 'cdantonio0@time.com', 20),
	(9, 2, 'Marlène', 'Kaser', '7565068017', 'lkaser1@scribd.com', 25),
	(9, 3, 'Örjan', 'Daubeny', '9661648951', 'tdaubeny2@fema.gov', 30),
	(9, 4, 'Céline', 'Berkeley', '7169866250', 'fberkeley3@boston.com', 50),
	(9, 5, 'Naéva', 'Lawie', '9413212558', 'clawie4@cisco.com', 20),
	(9, 6, 'Naéva', 'Rime', '7493840105', 'rrime5@howstuffworks.com', 33),
	(9, 7, 'Mårten', 'Tampen', '3732557568', 'dtampen6@disqus.com', 22),
	(9, 8, 'Méng', 'Micco', '6616285810', 'imicco7@163.com', 35),
	(9, 9, 'Océane', 'Walling', '9642338336', 'ewalling8@rediff.com', 50),
	(9, 10, 'Åsa', 'Lukovic', '7636462318', 'alukovic9@mail.ru', 200),

	(10, 1, 'Lucrèce', 'Crooke', '2506290082', 'xcrooke0@nps.gov', 600),
	(10, 2, 'Maï', 'Luckey', '4456925803', 'vluckey1@php.net', 700),
	(10, 3, 'Mégane', 'Tyght', '5667664670', 'ytyght2@so-net.ne.jp', 750),
	(10, 4, 'Inès', 'Rosthorn', '1677861316', 'wrosthorn3@nba.com', 400),
	(10, 5, 'Séréna', 'Rome', '9152849137', 'arome4@accuweather.com', 900),
	(10, 6, 'Kuí', 'Rossborough', '6104671772', 'jrossborough5@over-blog.com', 680),
	(10, 7, 'Audréanne', 'Doy', '2806148581', 'cdoy6@yale.edu', 760),
	(10, 8, 'Léana', 'Dowey', '4695553812', 'cdowey7@boston.com', 800),
	(10, 9, 'Thérèsa', 'Tallach', '6354798346', 'etallach8@gizmodo.com', 2000),
	(10, 10, 'Vénus', 'Murkin', '7896236232', 'lmurkin9@nsw.gov.au', 7500)
;
select * from `employee`;

insert into `room` (RoomType_ID, Hotel_ID, isAvailable)
values
	(1, 1, 1),
    (1, 1, 1),
	(1, 1, 1),
	(1, 1, 1),
	(2, 1, 1),
	(2, 1, 1),
	(2, 1, 1),
	(2, 1, 1),
	(3, 1, 1),
	(3, 1, 1),
	(3, 1, 1),
	(3, 1, 1),
	(4, 1, 1),
	(4, 1, 1),
    
    (1, 2, 1),
	(1, 2, 1),
	(1, 2, 1),
	(1, 2, 1),
	(2, 2, 1),
	(2, 2, 1),
	(2, 2, 1),
	(2, 2, 1),
	(3, 2, 1),
	(3, 2, 1),
	(3, 2, 1),
	(3, 2, 1),
	(4, 2, 1),
	(4, 2, 1)
;
select * from `room`;

insert into `booking` (Hotel_ID, Room_ID, GuestDetail_ID, Employee_ID, BookingDate, AdultsNo, UnderageNo)
values 
	(2, 1, 3, 2, '2023-03-12', 2, 0)
;
select * from booking;

insert into `bill`
values (1, 1, 5.00);
select * from `bill`;

insert into `paymentdetail`
values 
	(1, 1, 1, null, null, null, null, null, null)
;
select * from paymentdetail;

#-------------------------------------------------------
ALTER TABLE booking ADD Employee_ID INT AFTER GuestDetail_ID;
ALTER TABLE booking ADD CONSTRAINT fk_Booking_Employee1 FOREIGN KEY (Employee_ID) REFERENCES employee(Employee_ID);
update booking set Employee_ID = 1 where Booking_ID = 4;


ALTER TABLE paymentdetail ADD Total INT DEFAULT NULL AFTER FoodCharge;
ALTER TABLE paymentdetail MODIFY COLUMN Total FLOAT;
 
#------------------------------------------------------