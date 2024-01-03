--
-- Table structure for table `support_office`
--

DROP TABLE IF EXISTS `support_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_office` (
  `support_office_id` int(5) NOT NULL COMMENT '교육지원청 ID',
  `name` varchar(40) CHARACTER SET utf8 NOT NULL COMMENT '교육지원청 명',
  PRIMARY KEY (`support_office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='교육지원청';
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `support_office` VALUES
(1,'서울강남서초교육지원청'),
(2,'서울강동송파교육지원청'),
(3,'서울강서양천교육지원청'),
(4,'교육부'),
(5,'서울남부교육지원청'),
(6,'서울동부교육지원청'),
(7,'서울동작관악교육지원청'),
(8,'서울북부교육지원청'),
(9,'서울서부교육지원청'),
(10,'서울성동광진교육지원청'),
(11,'서울성북강북교육지원청'),
(12,'서울중부교육지원청');

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_code` varchar(8) NOT NULL COMMENT '표준학교코드',
  `name` varchar(50) NOT NULL COMMENT '학교명',
  `eng_name` varchar(100) NOT NULL COMMENT '학교명',
  `support_office_id` INT(5) NOT NULL COMMENT '관할조직명',
  PRIMARY KEY (`school_code`),
  CONSTRAINT `support_office_id_FK01` FOREIGN KEY (`support_office_id`) REFERENCES `support_office` (`support_office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8mb4 COMMENT='학교';
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `school` VALUES 
('7134142','행당중학교','Haengdang Middle School',10),
('7134141','한양대학교사범대학부속중학교','Hanyang University Middle School',10),
('7134140','자양중학교','Jayang Middle School',10),
('7134139','용곡중학교','Yong-gok Middle School',10),
('7134138','옥정중학교','Ok-Jung Middle School',10),
('7134137','양진중학교','Yangjin Middle School',10),
('7134136','신양중학교','Shinyang Middle School',10),
('7134135','성원중학교','Sungwon Middle School',10),
('7134134','성수중학교','Seongsu Middle School',10),
('7134132','무학중학교','Muhak Middle School',10),
('7134131','마장중학교','Majang Junior High School',10),
('7134130','대원국제중학교','Daewon International Middle School',10),
('7134129','동마중학교','Dongma Middle School',10),
('7134128','동국대학교사범대학부속여자중학교','Girls Middle School Attached to College of Education/ Dongguk University',10),
('7134127','구의중학교','Guui Middle School',10),
('7134126','광희중학교','Kwanghee Middle School',10),
('7134125','광진중학교','Gwangjin Middle School',10),
('7134124','광장중학교','Gwangjang Middle School',10),
('7134123','광양중학교','Kwangyang Middle School',10),
('7134122','광남중학교','Gwangnam Middle School',10),
('7134121','경일중학교','Kyungil Middle School',10),
('7134120','경수중학교','Gyeongsu Middle School',10),
('7134119','건국대학교사범대학부속중학교','Middle School Attached To College of Education KONKUK University',10),
('7132154','중앙대학교사범대학부속중학교','Chung-ang University Middle school',7),
('7132153','장승중학교','Jangseung Middle School',7),
('7132152','인헌중학교','Inhun Middle School',7),
('7132151','영등포중학교','Yeongdeungpo Middle School',7),
('7132150','신림중학교','Shillim Middle School',7),
('7132149','신관중학교','Shingwan Middle School',7),
('7132148','숭의여자중학교','Soongeui Girls Middle School',7),
('7132147','성보중학교','Sungbo Middle School',7),
('7132146','성남중학교','Sungnam Middle School',7),
('7132145','서울문영여자중학교','Seoul Moonyoung girls’ Middle School',7),
('7132144','상현중학교','Sang-Hyun Middle School',7),
('7132143','상도중학교','Sangdo Middle School',7),
('7132142','삼성중학교','Samsung Middle School',7),
('7132141','사당중학교','Sadang Middle School',7),
('7132140','봉원중학교','Bong-won Middle School',7),
('7132139','봉림중학교','Bongrim Middle School',7),
('7132138','미성중학교','Misung Middle School',7),
('7132137','문창중학교','Munchang Middle School',7),
('7132136','동작중학교','Dongjak Middle School',7),
('7132135','동양중학교','Dongyang Middle School',7),
('7132134','대방중학교','Daebang Middle School',7),
('7132133','당곡중학교','Dang-gok Middle School',7),
('7132132','남성중학교','Namsung Middle School',7),
('7132131','남서울중학교','Namseoul Middle School',7),
('7132130','남강중학교','Namkang Middle School',7),
('7132129','난우중학교','Nanwoo Middle School',7),
('7132128','국사봉중학교','Kuksabong Middle School',7),
('7132127','구암중학교','Guahm Middle School',7),
('7132126','광신중학교','Kwangshin Middle School',7),
('7132125','관악중학교','Gwanak Middle School',7),
('7132124','강현중학교','Gang-hyeon Middle School',7),
('7132123','강남중학교','Gangnam Middle School',7),
('7130275','상일중학교','Sang-il Middle School',2),
('7130271','위례솔중학교','Wiryesol Middle School',2),
('7130268','강빛중학교','Gangbit middle school',2),
('7130256','해누리중학교','Haenuri Middle School',2),
('7130209','한영중학교','Hanyoung Middle School',2),
('7130208','한산중학교','Hansan Middle School',2),
('7130207','풍성중학교','Pungsung Middle School',2),
('7130206','풍납중학교','Pungnap Middle School',2),
('7130205','천호중학교','Cheonho Middle School',2),
('7130204','천일중학교','Cheonil Middle School',2),
('7130203','정신여자중학교','Chungshin Girls’ Middle School',2),
('7130202','잠실중학교','Jamsil Middle School',2),
('7130201','잠신중학교','Jamsin Middle School',2),
('7130200','일신여자중학교','Ilsin Girls’ Middle School',2),
('7130199','오주중학교','Oju Middle School',2),
('7130198','오륜중학교','Oryun Middle School',2),
('7130197','오금중학교','Ogeum Middle School',2),
('7130196','영파여자중학교','Young-Pa Girls’ Middle School',2),
('7130195','아주중학교','Aju Middle School',2),
('7130194','신천중학교','Sincheon Middle School',2),
('7130193','신암중학교','Sinam Middle School',2),
('7130192','신명중학교','Sinmyung Middle School',2),
('7130191','송파중학교','Songpa Middle School',2),
('7130190','송례중학교','Songrye Middle School',2),
('7130189','세륜중학교','Seryun Middle School',2),
('7130188','성덕여자중학교','Seongdeok Girls’ Middle School',2),
('7130187','성내중학교','Seongnae Middle School',2),
('7130186','석촌중학교','Seokchon Middle School',2),
('7130185','서울체육중학교','Seoul Physical Education Middle School',2),
('7130183','보인중학교','Boin Middle School',2),
('7130182','보성중학교','Posung Middle School',2),
('7130181','배재중학교','Paichai Middle School',2),
('7130180','배명중학교','Baemyeong Middle School',2),
('7130179','방이중학교','Bang-i Middle School',2),
('7130178','방산중학교','Bangsan Middle School',2),
('7130177','문현중학교','MUNHYEON MIDDLE SCHOOL',2),
('7130176','문정중학교','Munjeong Middle School',2),
('7130175','명일중학교','Myungil Middle School',2),
('7130174','둔촌중학교','Doonchon Middle School',2),
('7130173','동신중학교','Dongshin Middle School',2),
('7130172','동북중학교','Dongbuk Middle School',2),
('7130171','고덕중학교','Godeok Middle School',2),
('7130170','거원중학교','Geowon Middle School',2),
('7130169','강일중학교','Gang-il Middle School',2),
('7130168','강명중학교','GANGMYOUNG MIDDLE SCHOOL',2),
('7130167','강동중학교','GANGDONG MIDDLE SCHOOL',2),
('7130166','가원중학교','Gawon Middle School',2),
('7130165','가락중학교','Karak Middle School',2),
('7121380','솔샘중학교','Solsaem Middle School',11),
('7121371','서울대학교사범대학부설중학교','Seoul National University Middle School',4),
('7121370','숭곡중학교','Soonggok Middle School',11),
('7121369','영훈국제중학교','YoungHoon International Middle School',11),
('7121368','홍익대학교사범대학부속중학교','HONGIK University Middle School',11),
('7121367','한성여자중학교','Hansung Girls’ Middle School',11),
('7121366','창문여자중학교','Changmun Girls’ Middle School',11),
('7121365','신일중학교','Shinil Middle School',11),
('7121364','성암여자중학교','Seong-am Girls’ Middle School',11),
('7121363','성신여자중학교','Sungshin Girls’ Middle School',11),
('7121362','서라벌중학교','Sorabol Middle School',11),
('7121361','동구여자중학교','Dong-gu Girls’ Middle School',11),
('7121360','남대문중학교','Namdaemun Middle School',11),
('7121359','고명중학교','Komyung Middle School',11),
('7121358','고려대학교사범대학부속중학교','Korea University Middle School',11),
('7121357','길음중학교','Gireum Middle School',11),
('7121356','화계중학교','Hwagye Middle School',11),
('7121355','종암중학교','Jongam Middle School',11),
('7121354','장위중학교','Jangwi Middle School',11),
('7121353','인수중학교','Insu Middle School',11),
('7121352','월곡중학교','Wolgok Middle School',11),
('7121351','용문중학교','Yongmoon Middle School',11),
('7121350','수유중학교','Suyu Middle School',11),
('7121349','수송중학교','Soosong Middle School',11),
('7121348','석관중학교','Seokgwan Middle School',11),
('7121347','삼선중학교','Samseon Middle School',11),
('7121346','삼각산중학교','Samgaksan Middle School',11),
('7121345','북악중학교','Bugak Middle School',11),
('7121344','번동중학교','Beondong Middle School',11),
('7121342','개운중학교','Gaewoon Middle School',11),
('7121341','강북중학교','Kangbuk Middle School',11),
('7091486','내곡중학교','NAEGOK MIDDLE SCHOOL',1),
('7091461','세곡중학교','Segok Middle School',1),
('7091457','휘문중학교','Whimoon Middle School',1),
('7091456','진선여자중학교','Jinseon Girls’ Middle School',1),
('7091455','중동중학교','Joongdong Middle School',1),
('7091454','은성중학교','Eunseong Middle School',1),
('7091453','숙명여자중학교','Sookmyung Girls’ Middle School',1),
('7091452','세화여자중학교','Sehwa Girls’ Middle School',1),
('7091451','서문여자중학교','Suhmoon Girls’ Middle School',1),
('7091450','동덕여자중학교','Dong Duk Girls’ Middle School',1),
('7091449','단국대학교사범대학부속중학교','DANKOOK UNIVERSITY MIDDLE SCHOOL',1),
('7091448','청담중학교','Cheongdam Middle School',1),
('7091447','이수중학교','Isu Middle School',1),
('7091446','원촌중학교','Wonchon Middle School',1),
('7091445','영동중학교','Youngdong Middle School',1),
('7091444','역삼중학교','Yeoksam Middle School',1),
('7091443','언주중학교','Eonju Middle School',1),
('7091442','언북중학교','Eonbuk Middle School',1),
('7091441','언남중학교','Eonnam Middle School',1),
('7091440','압구정중학교','Apgujeong Middle School',1),
('7091439','신사중학교','Sinsa Middle School',1),
('7091438','신반포중학교','Shinbanpo Middle School',1),
('7091437','신동중학교','Shindong Middle School',1),
('7091436','신구중학교','Shingu Middle School',1),
('7091435','수서중학교','Suseo Middle School',1),
('7091434','서초중학교','Seocho Middle School',1),
('7091433','서일중학교','Seo-il Middle School',1),
('7091432','서운중학교','Seoun Middle School',1),
('7091431','봉은중학교','Bong-eun Middle School',1),
('7091430','방배중학교','Bangbae Middle School',1),
('7091429','반포중학교','Banpo Middle School',1),
('7091428','도곡중학교','Dogok Middle School',1),
('7091427','대치중학교','Daechi Middle School',1),
('7091426','대청중학교','Daecheong Middle School',1),
('7091425','대왕중학교','Daewang Middle School',1),
('7091424','대명중학교','Daemyeong Middle School',1),
('7091423','구룡중학교','Guryoung Middle School',1),
('7091422','경원중학교','Gyeongwon Middle School',1),
('7091421','개포중학교','Gaepo Middle School',1),
('7091420','개원중학교','Gaewon Middle School',1),
('7081540','마곡하늬중학교','MagokHanui',3),
('7081524','화곡중학교','Hwagok Middle School',3),
('7081523','영도중학교','Yeongdo Middle School',3),
('7081522','양정중학교','Yang Chung Middle School',3),
('7081521','신정여자중학교','Shin Jeung Girls’ Middle School',3),
('7081520','봉영여자중학교','Bongyoung Girls’ Middle School',3),
('7081519','명덕여자중학교','Myungduk Girls’ Middle School',3),
('7081518','마포중학교','Mapo Middle School',3),
('7081517','등촌중학교','Deung-chon Middle School',3),
('7081516','덕원중학교','Deokwon Middle School',3),
('7081515','마곡중학교','Magok Middle School',3),
('7081514','화원중학교','Hwawon Middle School',3),
('7081513','월촌중학교','Wolchon Middle School',3),
('7081512','염창중학교','Yumchang Middle School',3),
('7081511','염경중학교','Yeomgyeong Middle School',3),
('7081510','양천중학교','Yangcheon Middle School',3),
('7081509','양서중학교','Yangseo Middle School',3),
('7081508','양동중학교','Yangdong Middle School',3),
('7081507','양강중학교','Yangkang Middle School',3),
('7081506','신화중학교','Shinhwa Middle School',3),
('7081505','신월중학교','Sinwol Middle School',3),
('7081504','신원중학교','Shinwon Middle School',3),
('7081503','신서중학교','Sinseo Middle School',3),
('7081502','신목중학교','Shinmok Middle School',3),
('7081501','신남중학교','Shinnam Middle School',3),
('7081500','수명중학교','Sumyeong Middle School',3),
('7081499','송정중학교','Songjeong Middle School',3),
('7081498','성재중학교','Seongjae Middle School',3),
('7081497','삼정중학교','Samjeong Middle School',3),
('7081496','백석중학교','Baekseok Middle School',3),
('7081495','방화중학교','Banghwa Middle School',3),
('7081494','방원중학교','Bangwon Middle School',3),
('7081493','목일중학교','Mokil Middle School',3),
('7081492','목운중학교','Mogun Middle School',3),
('7081491','목동중학교','Mokdong Middle School',3),
('7081490','등원중학교','Deungwon Middle School',3),
('7081489','등명중학교','Deungmyoung Middle School',3),
('7081488','금옥중학교','Geumok Middle School',3),
('7081487','공항중학교','Gonghang Middle School',3),
('7081485','경서중학교','Gyeongseo Middle School',3),
('7081484','강신중학교','Kangsin Middle School',3),
('7061129','서울대학교사범대학부설여자중학교','Seoul National University Girls’Middle School',4),
('7061120','환일중학교','Hwanil Middle School',12),
('7061119','한양중학교','Hanyang Middle School',12),
('7061118','한강중학교','Hangang Middle School',12),
('7061117','청운중학교','Cheong-un Middle School',12),
('7061116','창덕여자중학교','Changdeok Girls’ Middle School',12),
('7061115','중앙중학교','Choongang Middle School',12),
('7061114','장충중학교','Jangchung Middle School',12),
('7061113','장원중학교','Jangwon Middle School',12),
('7061112','용산중학교','Yongsan Middle School',12),
('7061111','용강중학교','Yong-gang Middle School',12),
('7061110','오산중학교','Osan Middle School',12),
('7061108','신광여자중학교','Shinkwang Girls’ Middle School',12),
('7061106','성심여자중학교','Sungsim Girls’ Middle School',12),
('7061105','선린중학교','Sunrin Middle School',12),
('7061104','상명대학교사범대학부속여자중학교','Girls` Middle School Attached to College of Education Sang Myung University',12),
('7061103','보성여자중학교','Bosung Girls’ Middle School',12),
('7061102','배화여자중학교','Paiwha Girls’ Middle School',12),
('7061101','배문중학교','Baemoon Middle School',12),
('7061100','동성중학교','Dongsung Middle School',12),
('7061099','덕수중학교','Ducksu Middle School',12),
('7061098','덕성여자중학교','Duksung Girls’ Middle School',12),
('7061097','대신중학교','Daeshin Middle School',12),
('7061096','대경중학교','Daekyeong Middle School',12),
('7061095','금호여자중학교','Kumho Girls Middle School',12),
('7061094','경신중학교','Kyungshin Middle School',12),
('7051213','효문중학교','Hyomun Middle School',8),
('7051212','한천중학교','Hancheon Middle School',8),
('7051210','하계중학교','Hagye Middle School',8),
('7051209','태랑중학교','Taerang Middle School',8),
('7051208','청원중학교','Cheongwon Middle School',8),
('7051207','창일중학교','Chang-il Middle School',8),
('7051206','창북중학교','Changbook Middle School',8),
('7051205','창동중학교','Changdong Middle School',8),
('7051204','중평중학교','Jungpyong Middle School',8),
('7051203','중원중학교','Joongwon Middle School',8),
('7051202','중계중학교','Junggye Middle School',8),
('7051201','정의여자중학교','Jeongeui Girls’ Middle School',8),
('7051200','재현중학교','Jaehyun Middle School',8),
('7051199','을지중학교','Eulji Middle School',8),
('7051198','월계중학교','Wolgye Middle School',8),
('7051197','온곡중학교','Ongok Middle School',8),
('7051196','염광중학교','Yumkwang Middle School',8),
('7051195','신창중학교','Sinchang Middle School',8),
('7051194','신상중학교','Sinsang Middle School',8),
('7051193','신방학중학교','Sinbanghak Middle School',8),
('7051192','신도봉중학교','Sindobong Middle School',8),
('7051191','수락중학교','Surak Middle School',8),
('7051190','선덕중학교','Sunduck Middle School',8),
('7051189','상원중학교','Sangwon Middle School',8),
('7051188','상명중학교','Sangmyung Middle School',8),
('7051187','상계중학교','Sanggye Middle School',8),
('7051186','상계제일중학교','Sang-gye Jeil Middle School',8),
('7051185','상경중학교','Sanggyung Middle School',8),
('7051184','불암중학교','Bulam Middle School',8),
('7051183','북서울중학교','Bukseoul Middle School',8),
('7051182','백운중학교','Baekwoon Middle School',8),
('7051181','방학중학교','Banghak Middle School',8),
('7051180','도봉중학교','Dobong Middle School',8),
('7051179','녹천중학교','Nokcheon Middle School',8),
('7051178','노일중학교','Noil Middle School',8),
('7051177','노원중학교','Nowon Middle School',8),
('7051176','노곡중학교','Nogok Middle School',8),
('7051175','광운중학교','Kwangwoon Middle school',8),
('7051174','공릉중학교','Kongrung Middle School',8),
('7041263','신길중학교','SINGIL MIDDLE SCHOOL',5),
('7041262','항동중학교','Hang-dong',5),
('7041238','천왕중학교','Cheonwang Middle School',5),
('7041195','한울중학교','Hanwool Middle School',5),
('7041194','윤중중학교','Yunjung Middle School',5),
('7041193','우신중학교','Wooshin Middle School',5),
('7041192','오류중학교','Oryu Middle School',5),
('7041191','오남중학교','OHNAM Middle School',5),
('7041190','영원중학교','Yeong-won Middle School',5),
('7041189','영서중학교','Yeongseo Middle School',5),
('7041188','영림중학교','Younglim Middle School',5),
('7041187','영남중학교','Yeongnam Middle School',5),
('7041186','여의도중학교','Yeouido Middle School',5),
('7041185','양화중학교','Yangwha Middle School',5),
('7041184','안천중학교','Ancheon Middle School',5),
('7041183','신도림중학교','Sindorim Middle School',5),
('7041182','시흥중학교','Shiheung Middle School',5),
('7041181','세일중학교','Seil Middle School',5),
('7041180','선유중학교','Seonyoo Middle School',5),
('7041179','문일중학교','Moonil Middle School',5),
('7041178','문성중학교','Munseong Middle School',5),
('7041177','문래중학교','Mullae Middle School',5),
('7041176','동일중학교','Dongil Middle School　',5),
('7041175','대영중학교','Daeyeong Middle School',5),
('7041174','대림중학교','Daerim Middle School',5),
('7041173','당산중학교','Dangsan Middle School',5),
('7041172','당산서중학교','Dangsanseo Middle School',5),
('7041171','난곡중학교','Nangok Middle School',5),
('7041170','구일중학교','Guil Middle School',5),
('7041169','구로중학교','Guro Middle School',5),
('7041168','고척중학교','Gocheok Middle School',5),
('7041167','경인중학교','Kyeongin Middle School',5),
('7041166','개웅중학교','Kaewoong Middle School',5),
('7041165','개봉중학교','Gaebong Middle School',5),
('7041164','가산중학교','Gasan Middle School',5),
('7031261','가재울중학교','Gajaeul Middle School',9),
('7031223','홍익대학교사범대학부속여자중학교','Hongik University Girls’ Middle School',9),
('7031222','홍은중학교','Hong-eun Middle School',9),
('7031221','한성중학교','Hanseong Middle School',9),
('7031220','충암중학교','Choongam Middle School',9),
('7031219','창천중학교','Changchun Middle School',9),
('7031218','진관중학교','Jingwan Middle School',9),
('7031217','증산중학교','Jeungsan Middle School',9),
('7031216','중앙여자중학교','Jungang Girls’ Middle School',9),
('7031215','중암중학교','Joongam Middle School',9),
('7031214','정원여자중학교','Jungwon Girls’ Middle School',9),
('7031213','인창중학교','Inchang Middle School',9),
('7031212','인왕중학교','Inwang Middle School',9),
('7031211','이화여자대학교사범대학부속이화·금란중학교','Ewha Womans University  Middle School',9),
('7031210','은평중학교','Eunpyeong Middle School',9),
('7031209','예일여자중학교','Yale Girls` Junior High school',9),
('7031208','영락중학교','Youngnak Middle School',9),
('7031207','연희중학교','Yeonhui Middle School',9),
('7031206','연천중학교','Yeoncheon Middle School',9),
('7031205','연신중학교','Yonsin Middle School',9),
('7031204','연서중학교','Yeonseo Middle School',9),
('7031203','연북중학교','Yeonbuk Middle School',9),
('7031202','아현중학교','Ahyeon Middle School',9),
('7031201','신연중학교','Sinyeon Middle School',9),
('7031200','신수중학교','Sinsu Middle School',9),
('7031199','신도중학교','SHINDO MIDDLE SCHOOL',9),
('7031198','숭실중학교','Soongsil Middle School',9),
('7031197','숭문중학교','Soongmoon Middle School',9),
('7031196','성서중학교','Seongseo Middle School',9),
('7031195','성산중학교','Sungsan Middle School',9),
('7031194','성사중학교','Sungsa Middle School',9),
('7031193','선정중학교','Sunjung Middle School',9),
('7031192','선일여자중학교','Sunil Girls’ Middle School',9),
('7031191','서울여자중학교','Seoul Girls’ Middle School',9),
('7031190','서연중학교','Seoyeon Middle School',9),
('7031189','상암중학교','Sangam middle school',9),
('7031188','상신중학교','Sangsin Middle School',9),
('7031187','불광중학교','Bulgwang Middle School',9),
('7031186','명지중학교','Myongji Middle School',9),
('7031185','동명여자중학교','Dongmyung Girls’ Middle School',9),
('7031184','동도중학교','Dongdo Middle School',9),
('7031183','덕산중학교','Duksan Middle School',9),
('7031182','대성중학교','Daeseong Middle School',9),
('7031181','구산중학교','Gusan Middle School',9),
('7031180','광성중학교','Kwangsung Middle School',9),
('7031179','경성중학교','Gyeongseong Middle School',9),
('7021150','휘경중학교','Hwigyong Middle School',6),
('7021149','휘경여자중학교','Hwikyung Girls’ Middle School',6),
('7021148','혜원여자중학교','Hyewon Girls’ Middle School',6),
('7021147','태릉중학교','Taereung Middle School',6),
('7021146','청량중학교','Cheongryang Middle School',6),
('7021145','중화중학교','Junghwa Middle School',6),
('7021144','중랑중학교','Joongrang Middle School',6),
('7021143','정화여자중학교','Jeonghwa Girls’ Middle School',6),
('7021142','전일중학교','Jeonil Middle School',6),
('7021141','전동중학교','Jeondong Middle School',6),
('7021140','전농중학교','Jeonnong Middle School',6),
('7021139','장평중학교','Jangpyung Middle School',6),
('7021138','장안중학교','Jang-an Middle School',6),
('7021137','원묵중학교','Wonmook Middle School',6),
('7021136','용마중학교','Yongma Middle School',6),
('7021135','영란여자중학교','Youngran Girls’ Middle School',6),
('7021134','신현중학교','Sinhyeon Middle School',6),
('7021133','숭인중학교','Soongin Middle School',6),
('7021132','송곡여자중학교','Songgok Girls’ Middle School',6),
('7021131','성일중학교','Sung-il Middle School',6),
('7021130','상봉중학교','Sangbong Middle School',6),
('7021129','봉화중학교','Bonghwa Middle School',6),
('7021128','면목중학교','Myeonmok Middle School',6),
('7021127','동원중학교','Dongwon Middle School',6),
('7021126','동대문중학교','Dongdaemun Middle School',6),
('7021125','동국대학교사범대학부속중학교','Middle School Attached to College of Education Dongguk University',6),
('7021124','대광중학교','Daegwang Middle School',6),
('7021123','경희중학교','Kyunghee Middle School',6),
('7021122','경희여자중학교','Kyunghee Girls’ Middle School',6);

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_no` int(9) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(8) NOT NULL COMMENT '학교 코드',
  `teacher_id` varchar(40) NOT NULL COMMENT '선생님 번호',
  `teacher_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '선생님 명',
  PRIMARY KEY (`teacher_no`),
  CONSTRAINT `teacher_FK01` FOREIGN KEY (`school_code`) REFERENCES `school` (`school_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='선생님';

INSERT INTO `teacher` VALUES
(1,'7021123','eunjung.park','박은정'),
(2,'7021123','najon.kim','김나전'),
(3,'7021123','honey.lee','이호니'),
(4,'7021123','jaemi.you','유재미');

-- select school.name, s.name from school left join support_office as s on school.support_office_id=s.support_office_id where s.name='서울강남서초교육지원청';
-- select t.teacher_name, s.name, t.teacher_id from teacher as t left join school as s on s.school_code = t.school_code;

--
-- Table structure for table `teacher_classroom`
--

DROP TABLE IF EXISTS `teacher_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_classroom` (
  `teacher_no` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '선생님 no',
  `classroom` varchar(5) NOT NULL COMMENT '학급',
  PRIMARY KEY (`teacher_no`,`classroom`),
  KEY `teacher_classroom_FK01` (`teacher_no`),
  CONSTRAINT `teacher_classroom_FK01` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='권한 인가';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_no` int(9) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(8) NOT NULL COMMENT '학교 코드',
  `student_id` varchar(40) NOT NULL COMMENT '학생 아이디',
  `student_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '학생 별명',
  `classroom` varchar(5) NOT NULL COMMENT '학급',
  PRIMARY KEY (`student_no`),
  CONSTRAINT `student_FK01` FOREIGN KEY (`school_code`) REFERENCES `school` (`school_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='학생';
