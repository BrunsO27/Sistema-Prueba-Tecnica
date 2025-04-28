DROP DATABASE IF EXISTS sistemita;

CREATE DATABASE IF NOT EXISTS sistemita;
USE sistemita;

CREATE TABLE IF NOT EXISTS usuario (
    numCuenta CHAR(9) PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    correo VARCHAR(200) UNIQUE NOT NULL,
    telefono CHAR(10) NOT NULL,
    estado BOOLEAN DEFAULT TRUE
);

ALTER TABLE usuario
ADD CONSTRAINT chk_numCuenta CHECK (numCuenta REGEXP '^[0-9]{9}$');
ALTER TABLE usuario
ADD CONSTRAINT chk_telefono CHECK (telefono REGEXP '^[0-9]{10}$');

insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('592018929', 'Larina', '2001-06-14 21:58:04', 'ldenacamp0@fastcompany.com', true, '6674157526');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('584163416', 'Anestassia', '2002-03-19 02:36:37', 'alucius1@sciencedirect.com', false, '7027916243');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('537862544', 'Eugine', '2000-10-24 18:16:23', 'eewbanche2@webnode.com', false, '2112019914');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('974739486', 'Jessie', '2001-05-19 21:58:54', 'jhartridge3@kickstarter.com', true, '5248238662');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('195818991', 'Viola', '2000-05-29 14:09:47', 'vsolland4@smh.com.au', false, '4628712421');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('910359727', 'Esme', '2001-11-06 07:59:10', 'ewisdom5@odnoklassniki.ru', false, '6397113980');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('153349698', 'Spenser', '2000-09-06 19:25:05', 'sattride6@live.com', true, '5025812920');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('009153844', 'Ashleigh', '2000-12-10 16:06:35', 'aimison7@zimbio.com', true, '7690333601');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('294820672', 'Torrance', '2000-10-19 19:12:47', 'tlafrentz8@blogtalkradio.com', true, '3600820820');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('908176946', 'Diannne', '2002-08-30 15:25:28', 'dstennine9@jugem.jp', true, '5656930629');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('126745588', 'Raphael', '2002-04-11 10:12:26', 'rblaschkea@1688.com', true, '2259038908');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('704764357', 'Sholom', '2002-05-06 10:23:19', 'sfillonb@ca.gov', false, '0467715584');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('069155666', 'Rory', '2000-09-21 12:49:09', 'rnenoc@miitbeian.gov.cn', true, '8105079426');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('332617135', 'Shelby', '2002-03-05 07:22:06', 'smaccrachend@pagesperso-orange.fr', false, '9212930382');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('167800575', 'Walther', '2001-05-01 07:36:47', 'wgwyllte@xing.com', true, '6678143891');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('382651553', 'Kelly', '2002-04-10 21:39:57', 'kfrisdickf@google.com.br', false, '4733362294');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('960246047', 'Darcy', '2001-03-18 20:50:22', 'dcardiffg@jalbum.net', false, '2622624500');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('135642070', 'George', '2000-01-30 01:27:29', 'gmuddimanh@arstechnica.com', true, '5250593664');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('130556264', 'Judye', '2000-02-16 11:52:38', 'jkocheri@cdc.gov', true, '1001550793');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('634854477', 'Eyde', '2002-01-27 01:19:30', 'editchburnj@opera.com', false, '6598831605');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('713715996', 'Pavla', '2000-10-31 07:43:15', 'pmiroyk@npr.org', true, '6943115678');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('244791778', 'Kylynn', '2002-06-30 08:42:40', 'kmatthensenl@usa.gov', false, '0523297849');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('983558607', 'Myrtia', '2000-05-01 11:41:51', 'mgaugem@sitemeter.com', false, '1115823802');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('506387603', 'Zsa zsa', '2000-05-16 17:24:20', 'zgianillin@privacy.gov.au', true, '7892168462');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('949396836', 'Sigrid', '2002-10-25 10:11:20', 'sblissetto@wikimedia.org', true, '5589180402');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('063908949', 'Reynold', '2002-08-23 18:16:30', 'rromip@washingtonpost.com', false, '9875333584');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('680501230', 'Merola', '2000-06-03 04:25:40', 'msharplyq@liveinternet.ru', false, '2583458880');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('450100909', 'Nanon', '2000-03-17 01:39:26', 'nfolker@about.com', false, '8101621494');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('495796448', 'Reilly', '2000-07-03 09:32:35', 'rtorts@marriott.com', false, '5675734153');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('488354636', 'Norrie', '2001-04-22 07:28:44', 'nbethamt@goo.gl', false, '2013625551');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('529829835', 'Dag', '2002-07-11 23:33:44', 'dmingardiu@bluehost.com', false, '7915390388');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('286443691', 'Matt', '2000-10-14 21:06:45', 'mwasylkiewiczv@illinois.edu', false, '2977616746');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('129446206', 'Kristi', '2002-06-03 10:34:09', 'kmaclennanw@biglobe.ne.jp', true, '2769031793');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('917368033', 'Sigvard', '2000-01-16 04:35:57', 'sgeneverx@economist.com', false, '5651957830');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('454146401', 'Riordan', '2002-05-10 11:13:45', 'rbarbischy@tripod.com', false, '0775794872');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('819553727', 'Ike', '2000-07-29 22:11:07', 'iyoseloffz@pagesperso-orange.fr', false, '5471106083');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('788240217', 'Hermon', '2000-04-28 02:05:39', 'hskamal10@example.com', false, '4484545085');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('496162865', 'Willa', '2001-04-17 08:54:09', 'wattenborough11@ustream.tv', false, '4056890688');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('780990840', 'Dagny', '2000-02-12 07:41:23', 'dsatterley12@tinypic.com', true, '5837841093');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('323198725', 'Trudie', '2002-05-19 00:39:22', 'toliveira13@webeden.co.uk', false, '2746368996');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('455893481', 'Hortense', '2000-08-21 23:55:16', 'hseater14@youtu.be', false, '4050109609');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('294300864', 'Val', '2002-04-11 13:40:40', 'vyapp15@nsw.gov.au', false, '3812673620');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('761864360', 'Toby', '2002-05-31 19:36:30', 'tballintime16@angelfire.com', false, '5873229027');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('540622639', 'Shurlocke', '2001-04-26 05:20:48', 'slethem17@home.pl', false, '3734843739');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('355398034', 'Junina', '2002-10-14 15:42:32', 'jruss18@admin.ch', false, '7362559874');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('444766705', 'Riva', '2000-07-19 12:45:41', 'roflaherty19@scribd.com', false, '0517803854');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('613117034', 'John', '2000-03-04 21:41:30', 'jfarge1a@hugedomains.com', false, '2453158865');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('688610951', 'Wilburt', '2000-07-06 03:17:50', 'wlamblin1b@cdbaby.com', true, '3990155566');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('463241919', 'Graehme', '2001-04-28 10:58:15', 'gmacer1c@rambler.ru', false, '7990881950');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('917999508', 'Cathi', '2000-08-06 18:55:33', 'cjouhandeau1d@scribd.com', false, '1161235810');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('920126505', 'Lurette', '2001-10-14 09:50:58', 'lmacbarron1e@yelp.com', false, '8595062525');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('673832958', 'Agnese', '2002-12-09 14:20:23', 'apurcer1f@simplemachines.org', false, '1847688976');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('008354199', 'Adey', '2002-06-22 11:54:36', 'akurt1g@slashdot.org', true, '3633158011');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('000054501', 'Ruthie', '2002-01-14 14:14:50', 'reakins1h@instagram.com', true, '5623808451');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('432162628', 'Aggie', '2002-10-03 15:31:55', 'apoppleton1i@booking.com', false, '6955815570');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('313590489', 'Gavan', '2001-11-04 22:24:38', 'gpoyner1j@rambler.ru', false, '8624720526');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('606417522', 'Gabriella', '2002-02-11 21:42:58', 'gucceli1k@ehow.com', true, '2161928993');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('882496487', 'Katharine', '2000-01-26 04:26:11', 'kmorando1l@exblog.jp', true, '1585631473');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('344158903', 'Nat', '2002-05-26 16:26:47', 'ntace1m@stanford.edu', false, '0764703473');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('290212797', 'Ursulina', '2000-06-03 14:31:40', 'ubinks1n@tripadvisor.com', false, '5008478582');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('094100503', 'Fae', '2000-11-22 01:13:29', 'fmccaughan1o@constantcontact.com', true, '1896200462');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('531954082', 'Arabella', '2001-01-07 12:45:07', 'abanker1p@disqus.com', false, '8442590667');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('727372172', 'Aundrea', '2001-03-10 11:12:08', 'adurward1q@mediafire.com', false, '0872818319');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('287503769', 'Carney', '2000-04-17 05:28:09', 'cpires1r@alexa.com', false, '6460819168');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('935808265', 'Tuck', '2000-02-09 10:42:28', 'tgislebert1s@webmd.com', false, '4554394594');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('849774289', 'Jacintha', '2002-08-29 04:34:36', 'jcabrara1t@amazonaws.com', false, '7997770725');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('309751662', 'Christophe', '2002-03-11 22:37:31', 'crowlett1u@va.gov', true, '0322134495');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('411201009', 'Carline', '2002-07-23 18:15:46', 'cwilsey1v@amazon.co.jp', false, '3816853162');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('428734697', 'Alyssa', '2002-01-15 07:54:06', 'athurling1w@microsoft.com', false, '8597545493');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('808924834', 'Orin', '2001-09-21 02:35:42', 'orossbrook1x@devhub.com', false, '0074317897');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('035116526', 'Miquela', '2002-08-17 18:20:42', 'mdagworthy1y@pen.io', false, '3267010495');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('875773291', 'Korey', '2001-05-17 16:58:34', 'knodes1z@mail.ru', true, '8347772723');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('656908965', 'Averil', '2000-03-23 02:02:45', 'apancost20@indiatimes.com', true, '0035963138');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('436938368', 'Eloise', '2001-10-11 00:29:55', 'emcelrath21@sciencedaily.com', true, '0564260859');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('060639772', 'Hurlee', '2000-07-13 15:31:33', 'hcancellor22@nsw.gov.au', true, '5218676216');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('227595756', 'Shena', '2000-01-25 04:43:07', 'scheater23@livejournal.com', false, '7691034354');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('120143662', 'Shawn', '2000-11-11 22:38:45', 'svale24@technorati.com', false, '9649040191');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('823778763', 'Richmound', '2001-01-06 02:04:29', 'rduffree25@t-online.de', true, '2655290694');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('211403628', 'Tybalt', '2000-10-30 04:15:34', 'tdavey26@hostgator.com', true, '9980232161');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('210521311', 'Zsazsa', '2000-11-08 07:38:32', 'zbaigent27@hugedomains.com', true, '5035326567');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('405354622', 'Tucky', '2002-06-03 17:39:07', 'tfurby28@answers.com', true, '1030864133');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('993086958', 'Joellen', '2001-05-31 14:56:28', 'jshelsher29@ucsd.edu', true, '0501958970');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('404141177', 'Iggy', '2001-05-19 23:29:40', 'iwyley2a@ycombinator.com', false, '3913200531');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('112481094', 'Cornie', '2000-09-25 10:53:55', 'cbleiman2b@sphinn.com', true, '4534376257');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('537696237', 'Arin', '2001-08-14 02:17:14', 'adickey2c@netvibes.com', true, '1588161398');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('135690169', 'Joanna', '2002-12-20 06:33:34', 'jmelluish2d@statcounter.com', true, '8610188207');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('599735851', 'Selle', '2000-10-01 03:55:33', 'sandrejs2e@csmonitor.com', true, '0448212440');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('094423437', 'Bancroft', '2000-01-22 11:28:29', 'bgellert2f@jimdo.com', true, '6502135330');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('493450374', 'Teodorico', '2001-03-27 10:14:53', 'tmckennan2g@shop-pro.jp', true, '1797633268');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('528324706', 'Nial', '2002-10-12 16:24:21', 'nnazareth2h@whitehouse.gov', true, '3224757187');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('237888126', 'Lucia', '2001-04-19 04:06:46', 'lklima2i@pen.io', false, '4920717055');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('122900914', 'Prudence', '2002-11-15 11:33:19', 'pmapletoft2j@dion.ne.jp', false, '1836111800');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('092899696', 'Sascha', '2000-07-09 23:26:19', 'sambrus2k@csmonitor.com', false, '2019501002');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('701968300', 'Catarina', '2001-08-19 08:15:56', 'cshrieves2l@wired.com', true, '9258097398');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('274907406', 'Nataline', '2000-11-02 06:28:57', 'nmccaughren2m@dropbox.com', true, '5291567893');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('162514658', 'Karolina', '2002-05-23 23:59:55', 'kkarlik2n@indiatimes.com', true, '1640978841');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('224251787', 'Odetta', '2002-04-24 06:38:53', 'odyble2o@ucla.edu', false, '0173521518');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('335542587', 'Livia', '2002-08-19 10:02:19', 'lfreund2p@wikipedia.org', false, '4816600360');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('999627141', 'Roanne', '2002-05-07 16:54:58', 'rwildman2q@squidoo.com', true, '5310407448');
insert into usuario (numCuenta, nombre, fechaNacimiento, correo, estado, telefono) values ('236144722', 'Alic', '2001-11-12 19:49:07', 'amitchard2r@mediafire.com', true, '5023353302');