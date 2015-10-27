/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS "companies";

CREATE TABLE "companies" (
  "company_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "company_name" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "company_jurisdiction_id" int(11) DEFAULT NULL,
  "company_untraceable" tinyint(1) NOT NULL DEFAULT '0',
  "company_registration" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "company_hq" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "company_formed" date DEFAULT NULL,
  "company_dissolved" date DEFAULT NULL,
  "company_address" text COLLATE utf8_unicode_ci,
  "company_notes" text COLLATE utf8_unicode_ci,
  "company_source_url" text COLLATE utf8_unicode_ci,
  "company_google_doc_url" text COLLATE utf8_unicode_ci,
  PRIMARY KEY ("company_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "companies" WRITE;
/*!40000 ALTER TABLE "companies" DISABLE KEYS */;

INSERT INTO "companies" ("company_id", "company_name", "company_jurisdiction_id", "company_untraceable", "company_registration", "company_hq", "company_formed", "company_dissolved", "company_address", "company_notes", "company_source_url", "company_google_doc_url")
VALUES
	(1,'Alberta Oil Sands Inc.',3,0,NULL,'Alberta','2003-12-05',NULL,'#600, 815 - 8th Avenue SW Calgary, Alberta T2P 3P2','Alberta Oilsands has reportedly agreed to acquire an 85% net stake in offshore blocks 2712A & 2812A, NW of Kudu in the Orange Basin (Namibia). The deal is through the acquisition of Maroon Hill Intl, which itself owns 85% of domestic Leopard Investments Ten, holder of the 11,000-sq km acreage. The deal is costed at US$1.5 MM plus 20 MM AO shares, and $1 MM a year after closing.','',''),
	(2,'Alumni Exploration East Namibia',1,0,'2011/0782','Windhoek','2011-11-29',NULL,'136 Jan Jonker Road','','','https://drive.google.com/open?id=0BxJXmk2XL1rdV1kxcXQxaUVBNW8'),
	(3,'Azimuth Namibia Ltd',4,0,'46437','','2012-04-12',NULL,'','Toronto, Ontario April 12, 2012 / CNW ECO (ATLANTIC) OIL AND GAS LTD. (TSX-V:EOG) Eco (Atlantic) Oil & Gas Ltd. (“Eco Atlantic” or the “Company”) is pleased to announce that it has signed a definitive Farm-out Agreement with Azimuth Ltd. (“Azimuth”) of Hamilton, Bermuda, an exploration and production company backed by majority-owner Seacrest Capital Ltd. and Petroleum Geo-Services ASA (“PGS”) (Letter of Intent announced on December 22, 2011).   Pursuant to the agreement, Azimuth will earn  a 20% working interest in each of Eco Atlantic’s offshore Namibia licenses, namely the “Cooper License” (Block 2012A), the “Sharon License” (Blocks 2213A & 2213B) and the “Guy License” (Blocks 2111B & 2211A) (jointly, the “Licenses”) in return for funding 40% of the cost of 3D seismic surveys covering 2,500 square kilometers across all three Licenses, the acquisition of which is expected to cost in excess of US$25 million.  The assignment of a 20% working interest in the Licenses to Azimuth is subject to the approval of Namibia’s Ministry of Mines and Energy.  Eco Atlantic currently holds a 90% working interest in the Licenses through its wholly-owned subsidiary Eco Oil and Gas Namibia (PTY) Ltd. (“Eco Namibia\") and NAMCOR, the Namibian national oil and Gas Company, holds a 10% working interest. As a result of this transaction, Eco Namibia’s interest will be 70%, Azimuth will earn a 20% interest, and NAMCOR will retain its 10% carried interest. Eco Atlantic, through the project management group of Kinley Exploration and Azimuth will be responsible for designing, sourcing and operating all aspects of the 3D seismic program.','',''),
	(4,'AziNam Exploration Exploration Limited',4,0,'46765','','2012-08-01',NULL,'','','',''),
	(5,'AziNam Exploration Namibia (Proprietary) Limited',1,0,'2015/0121','','2015-02-24',NULL,'','AziNam Ltd., formerly Azimuth Ltd. (“AziNam”), an exploration and production company jointly owned by Seacrest Capital Ltd. and Petroleum Geo-Services ASA, holds a 20% interest.','',''),
	(6,'Camelot Investment Group',1,0,'CY/2008/0890','Windhoek','2008-10-16',NULL,'15 Allan Street, Northern Industrial Area, Windhoek','','','https://drive.google.com/open?id=0BxJXmk2XL1rdeUJQVmZDdmVlb00'),
	(7,'Canadian Overseas Petroleum (Bermuda Holdings) Limited',4,0,'45376','',NULL,NULL,'','','',''),
	(8,'Canadian Overseas Petroleum Limited (Canada)',8,0,'420463-8','',NULL,NULL,'3200, 715 - 5th Avenue SW Calgary, Alberta Canada T2P 2X6','','',''),
	(9,'CSG Energy Namibia',1,0,'2010/0144','Windhoek','2010-03-11',NULL,'1st Floor LA Chambers, Ausspann Plaza, Dr Agostinho Neto Road','','','https://drive.google.com/open?id=0BxJXmk2XL1rdWG9GR2NXdFdZaEk'),
	(10,'Eco (Atlantic) Oil and Gas Ltd.',9,0,NULL,'Toronto','2007-11-06',NULL,'120 Adelaide St. W., Suite 800, Toronto, Ontario, M5H 1T1','On November 25, 2011, Goldbard completed a business combination (the “Business Combination”) when its wholly owned subsidiary, Goldbard Resources Inc., amalgamated with Eco Oil and Gas Ltd. Eco (Atlantic) Oil & Gas Ltd. (British Columbia) Eco (BVI) Oil & Gas Ltd. (British Virgin Islands) Eco Oil and Gas Services (Proprietary) Limited (Namibia) Eco Atlantic (Ghana) Limited (Ghana) Eco Oil and Gas (Namibia) (Proprietary) Limited (Namibia) 100% 100% 3 (“EOG”), a private company incorporated in the Territory of the British Virgin Islands, to identify, acquire, explore and develop petroleum, natural gas and coal bed methane (“CBM”) licenses in the Republic of Namibia (“Namibia”). The Business Combination was accomplished through an exchange of shares, and qualified as a Reverse Takeover under the policies of the Exchange. In connection with the Business Combination, the shareholders of Goldbard approved a consolidation of the common shares of the Goldbard on the basis of 2.5 old commons shares for one new common share (a “Consolidated Share”). Under the terms of the Business Combination, the shareholders of EOG received 1.253 Consolidated Shares for each share of EOG held, with a total of 45,359,971 Consolidated Shares issued to the shareholders of EOG. Holders of EOG share purchase warrants received replacement warrants entitling them to acquire an aggregate of 3,759,116 Consolidated Shares. As part of the Business Combination, the Company changed its name from “Goldbard Capital Corporation” to “Eco (Atlantic) Oil & Gas Ltd.”, changed its financial year end from December 31 to March 31, and was continued into British Columbia under t','',''),
	(11,'Eco Oil (BVI) Oil and Gas Ltd',5,0,NULL,'',NULL,NULL,'','','',''),
	(12,'Eco Oil and Gas Namibia',1,0,'CY/2008/0616','Windhoek','2008-07-17',NULL,'141 Werner List Street','','','https://drive.google.com/open?id=0BxJXmk2XL1rdYTN1QWVsV3NjOVU'),
	(13,'Hallie Investments 3041',1,0,NULL,'',NULL,NULL,'','There are dozens of Hallie Investments but I cannot find 3041','',''),
	(14,'Hydrocarb Namibia Energy (Pty) Limited',1,0,'NA:2010/0794','Windhoek',NULL,NULL,'','Previously known as Aupindi Tobie Aupindi (Proprietary) Limited)','',''),
	(15,'Lekoil Exploration and Production',1,0,'2011/0523','Windhoek','2011-08-15',NULL,'8, Sinclair Street','On 17 May 2013 Lekoil successfully listed on the AIM market of the London Stock Exchange with a US$50million fundraising.','','https://drive.google.com/open?id=0BxJXmk2XL1rdV1kxcXQxaUVBNW8'),
	(16,'Lekoil Limited',6,0,'WK-248859','Lagos, Nigeria','2010-12-03',NULL,'Walker House, 190 Elgin Avenue, George Town, Grand Cayman, Cayman Islands.','','',''),
	(17,'Leopard Investments',1,0,'2011/0440','Windhoek','2011-06-13',NULL,'12th floor Sanlam Centre 145-157 Independence Avenue','','','https://drive.google.com/open?id=0BxJXmk2XL1rdN1liNVNGb3BYMGc'),
	(18,'Leopard Investments Ten (Pty.) Ltd.',1,0,'2011/0440','Windhoek','2011-07-13',NULL,'12th floor Sanlam Centre 145-157 Independence Avenue','','','https://drive.google.com/open?id=0BxJXmk2XL1rdN1liNVNGb3BYMGc'),
	(19,'Maroon Hill International Limited',5,0,NULL,'',NULL,NULL,'','','',''),
	(20,'Maurel and Prom Namibia',1,0,'F/531877884','Windhoek','2014-03-19',NULL,'344 Independence Avenue','','','https://drive.google.com/open?id=0BxJXmk2XL1rdV1kxcXQxaUVBNW8'),
	(21,'MIBIA Energy',1,0,'2011/0108','Windhoek','2011-02-15',NULL,'13 Kasteel Street, Luxury Hill','','','https://drive.google.com/open?id=0BxJXmk2XL1rddVh1MlZaQ2FzLTg'),
	(22,'Namibia Exploration Inc',2,0,'US:NV20121074524','Houston',NULL,NULL,'800 Gessner, Suite 200, Houston, TX, USA 77024','','',''),
	(23,'Reconnaissance Energy Namibia',1,0,'2014/0948','Windhoek','2014-10-09',NULL,'129 Hosea Kutako Drive','','','https://drive.google.com/open?id=0BxJXmk2XL1rdV1kxcXQxaUVBNW8'),
	(24,'Ropat Petroleum Investments (Pty) Ltd',1,0,'2012/0354','','2012-04-23',NULL,'','http://www.reuters.com/article/2013/02/06/idUSnCCN8bC9Fa+1ca+MKW20130206 Westbridge Energy Corporation (TSX VENTURE:WEB)(FRANKFURT:PUQ1) (\"Westbridge\") is pleased to announce having entered into a letter of intent (the \"LOI\") with Ropat Petroleum Investments (PTY) Ltd. (\"Ropat\") to acquire a majority interest in the oil and gas exploration blocks 1911A relinquished, 1912B, 1910A relinquished and 2011A relinquished (the \"Licenses\") offshore Namibia (the \"Transaction\"), Westbridge and Ropat have signed a Petroleum Agreement dated February 1, 2013 with the Mining, Minerals and Energy Department of the Republic of Namibia in relation to the Licenses. Ropat is a private oil and gas company incorporated in Namibia.   Upon completion of the Transaction, Westbridge will be the Operator of the Licenses with a 75% interest. Ropat will have a 15% interest and the remaining 10% interest will be held by NAMCOR, the Namibian state oil company. NAMCOR\'s interest will be a carried interest with certain back-in rights for the Licenses.   Westbridge and Ropat have agreed to proceed diligently and in good faith to negotiate and enter into a definitive agreement in relation to the Transaction on or before February 28, 2013.   Consideration for the Transaction will comprise 5 million common shares in the capital of Westbridge (the \"Westbridge Shares\") to the shareholders of Ropat and a cash payment of US$500,000 on the closing date of the Transaction. The Westbridge Shares will be subject to a statutory four-month hold period from the date of issue and such other regulatory hold period imposed by the TSX Venture Exchange (the \"TSX-V\"). In addition the Westbridge Shares will be subject to a contractual hold period (the \"Lock-up Arrangements\") from the date of issue providing for release on the following basis: 1/3rd will be released 6 months from the date of issue, a further 1/3rd will be released 12 month from the date of issue and the final 1/3rd will be released 18 months from the date of issue.  In addition, Westbridge will make a cash payment to Ropat of US$1 million upon the satisfactory completion of the following conditions to be set out in a definitive agreement in relation to the Transaction:    1.  receipt by Westbridge of an independent technical report from a     reputable firm indicating the Licenses contain a risked, recoverable,     P50 resource estimate of 1,000MMboe or greater; and  2.  Westbridge having a net cash balance of more than US$15million.','',''),
	(25,'Seacrest Capital Ltd',4,0,'44493','','2010-08-13',NULL,'','Bermuda based fund founded by Erik Tiller in 2010 http://www.oilandgascouncil.com/assets/SEACREST_CONFIDENTIAL_asia_assembly.pdf','',''),
	(26,'Shell Namibia Upstream B.V.',1,0,'F/55853188','Windhoek','2014-06-17',NULL,'Unit 3, 3rd floor, Dr Agostinho Neto Street, Ausspannplatz','','','https://drive.google.com/open?id=0BxJXmk2XL1rdSDQxeGNFdkF0dnM'),
	(27,'Shoreline CanOverseas Petroleum Development Corporation',4,0,'49613','','2014-10-24',NULL,'','On or around 31st December 2014 ShoreCan entered into a Farm Out Agreement with Camelot Investment Group (Pty) Ltd (\"Camelot\"), a Namibian registered company, whereby ShoreCan acquired an 80% working interest in Block 1708, 1709, 1808 offshore Namibia deepwater blocks. ShoreCan is to be the Operator of the blocks. Camelot retains a 10% carried interest and the Namibian National Oil Company, NAMCOR, also has a 10% carried interest. ShoreCan paid a signature bonus to Camelot of $150,000 US Dollars and licence rental fees of Namibian Dollars 1,367,644.80 and training fees of $49,000 US Dollars. ShoreCan will meet 100% of the exploration costs (the \"carried costs\") and such costs will be adjusted by inflation and recoverable by ShoreCan from any Cost Oil as defined in the Farm Out Agreement. The Farm Out Agreement was amended on 4th February 2015 to clarify that Camelot would be entitled to 40% of the net gain to ShoreCan on disposal of the assets or any company holding such assets. In the event of a corporate disposal, the Namibian assets would be independently valued and such value ascribed to them for the purposes of determining any sum due to Camelot. The assignation of the interest and re-issuance of the Petroleum Exploration Licence to include ShoreCan was signed by the Minister of Mines and Energy on the 20th February 2015. The Parties have agreed to negotiate an AIPN standard Joint Operating Agreement','',''),
	(28,'Shoreline Energy International Limited',NULL,0,NULL,'',NULL,NULL,'46 Industrial Avenue Ilupeju Lagos Ikeja, Nigeria','Shoreline Energy International Limited (SEI) is a leading energy and infrastructure company. Closely held and founded in 1997 with offices around the globe SEI operates across Sub-Saharan Africa. The energy division of SEI is a full life cycle energy company focussed on creating integrated energy solutions to maximize returns to leverage the company\'s portfolio of assets. Shoreline Energy International Limited through its majority ownership of a subsidiary owns 55% ownership of affiliate Shoreline Natural Resources Limited, the company with a 45% non-operating participant in the producing Nigerian block OML 30 and the Trans-Forcados pipeline.','',''),
	(29,'TSE Oil & Gas',1,0,'2010/0334','Windhoek','2010-07-02',NULL,'c/o Auas Secretarial Services, Bougain Villas, 78 Sam Nujoma Drive','','','https://drive.google.com/open?id=0BxJXmk2XL1rdWVdFTjVkaUx3S2M'),
	(30,'Tullow Kudu Limited',1,0,'FOR/062370C','','1993-04-06',NULL,'','','',''),
	(31,'Tullow Kudu Limited',7,0,'062370C','','1993-04-06',NULL,'','company was disolved in 2013  https://opencorporates.com/companies/im/062370C','',''),
	(32,'Tullow Oil PLC',NULL,0,'3919249','','2000-02-04',NULL,'','','',''),
	(33,'Westbridge Energy Corporation',9,0,'C-521736','British Colombia','2009-12-11',NULL,'625 Howe St, Vancouver, BC V6C 2T6','2009 is date of name change - previously Porrush Petroleum Corporation','',''),
	(34,'Westbridge Energy Namibia',1,0,'2013/0365','Windhoek','2013-05-08',NULL,'Unit 3, 2rd floor,  LA Chambers, Dr Agostinho Neto Street, Ausspannplatz',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeGxvcDRDRGJZSjQ'),
	(35,'Azimuth Ltd',4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(36,'PGS',10,0,NULL,'Oslo',NULL,NULL,NULL,NULL,NULL,NULL),
	(37,'Tate Oil And Gas (Proprietary) Limited',1,0,'2011/0525','Windhoek','2011-08-15',NULL,'8 Sinclair Street, Windhoek',NULL,NULL,NULL),
	(41,'Government of Namibia',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(42,'NAMCOR	',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE "companies" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company_holdings
# ------------------------------------------------------------

DROP TABLE IF EXISTS "company_holdings";

CREATE TABLE "company_holdings" (
  "company_holding_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "company_holding_start_date" date DEFAULT NULL,
  "company_holding_end_date" date DEFAULT NULL,
  "company_holding_date_approx" tinyint(1) NOT NULL DEFAULT '0',
  "company_holding_parent_company_id" int(11) DEFAULT NULL,
  "company_holding_child_company_id" int(11) DEFAULT NULL,
  "company_holding_stake_percent" decimal(11,2) DEFAULT NULL,
  PRIMARY KEY ("company_holding_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES "company_holdings" WRITE;
/*!40000 ALTER TABLE "company_holdings" DISABLE KEYS */;

INSERT INTO "company_holdings" ("company_holding_id", "company_holding_start_date", "company_holding_end_date", "company_holding_date_approx", "company_holding_parent_company_id", "company_holding_child_company_id", "company_holding_stake_percent")
VALUES
	(1,NULL,NULL,0,11,12,100.00),
	(2,NULL,NULL,0,10,11,100.00),
	(3,NULL,NULL,0,4,5,100.00),
	(4,NULL,NULL,0,35,4,100.00),
	(5,NULL,NULL,0,25,35,65.00),
	(6,NULL,NULL,0,36,35,35.00),
	(7,NULL,NULL,0,31,30,100.00),
	(8,NULL,NULL,0,32,31,100.00),
	(9,NULL,NULL,0,16,15,80.00),
	(10,NULL,NULL,0,37,15,20.00),
	(11,NULL,'2012-12-18',0,19,18,85.00),
	(12,'2012-12-18',NULL,0,1,18,85.00),
	(13,NULL,NULL,0,28,27,50.00),
	(14,NULL,NULL,0,7,27,50.00),
	(15,NULL,NULL,0,8,7,100.00);

/*!40000 ALTER TABLE "company_holdings" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table concessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS "concessions";

CREATE TABLE "concessions" (
  "concession_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "concession_number" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "concession_license_id" int(11) NOT NULL,
  PRIMARY KEY ("concession_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "concessions" WRITE;
/*!40000 ALTER TABLE "concessions" DISABLE KEYS */;

INSERT INTO "concessions" ("concession_id", "concession_number", "concession_license_id")
VALUES
	(1,'2012A',16),
	(2,'2111B',1),
	(3,'2211A',1),
	(4,'2013A',7),
	(5,'1913B',7),
	(6,'1714A',2),
	(7,'1715',2),
	(8,'1814A',2),
	(9,'1815',2),
	(10,'2914B',3),
	(11,'2913A',3),
	(12,'2212B',8),
	(13,'2313',9),
	(14,'2413A',9),
	(15,'1810',15),
	(16,'2813B',4),
	(17,'2514',14),
	(18,'2712A',5),
	(19,'2812A',5),
	(20,'1911A',13),
	(21,'1912B',13),
	(22,'2011Aa',13),
	(23,'1910Arel',13),
	(24,'2219',11),
	(25,'2319',11),
	(26,'1719',10),
	(27,'1720',10),
	(28,'1819',10),
	(29,'1820',10),
	(30,'1721',10),
	(31,'1821',10),
	(32,'1909',12),
	(33,'2009',12),
	(34,'1708',6),
	(35,'1709',6),
	(36,'1808',6);

/*!40000 ALTER TABLE "concessions" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jurisdictions
# ------------------------------------------------------------

DROP TABLE IF EXISTS "jurisdictions";

CREATE TABLE "jurisdictions" (
  "jurisdiction_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "jurisdiction_name" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "jurisdiction_tax_haven_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("jurisdiction_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "jurisdictions" WRITE;
/*!40000 ALTER TABLE "jurisdictions" DISABLE KEYS */;

INSERT INTO "jurisdictions" ("jurisdiction_id", "jurisdiction_name", "jurisdiction_tax_haven_id")
VALUES
	(1,'Namibia',NULL),
	(2,'Nevada, USA',1),
	(3,'Alberta, Canada',2),
	(4,'Bermuda',3),
	(5,'BVI',4),
	(6,'Cayman Islands',5),
	(7,'Isle of Man',6),
	(8,'Canada',2),
	(9,'British Columbia, Canada',2),
	(10,'Norway',NULL);

/*!40000 ALTER TABLE "jurisdictions" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table license_holdings
# ------------------------------------------------------------

DROP TABLE IF EXISTS "license_holdings";

CREATE TABLE "license_holdings" (
  "license_holding_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "license_holding_license_id" int(11) NOT NULL,
  "license_holding_start_date" date DEFAULT NULL,
  "license_holding_end_date" date DEFAULT NULL,
  "license_holding_date_approx" tinyint(1) NOT NULL DEFAULT '0',
  "license_holding_company_id" int(11) NOT NULL,
  "license_holding_stake_percent" decimal(11,2) DEFAULT NULL,
  PRIMARY KEY ("license_holding_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES "license_holdings" WRITE;
/*!40000 ALTER TABLE "license_holdings" DISABLE KEYS */;

INSERT INTO "license_holdings" ("license_holding_id", "license_holding_license_id", "license_holding_start_date", "license_holding_end_date", "license_holding_date_approx", "license_holding_company_id", "license_holding_stake_percent")
VALUES
	(1,16,NULL,'2011-03-14',0,41,100.00),
	(2,16,'2011-03-14',NULL,0,42,10.00),
	(3,16,'2011-03-14','2012-04-12',0,12,90.00),
	(4,16,'2012-04-12','2015-01-05',0,3,20.00),
	(5,16,'2012-04-12','2014-07-17',0,12,70.00),
	(6,16,'2014-07-14',NULL,0,30,25.00),
	(7,16,'2014-07-14','2015-01-05',0,12,45.00),
	(8,16,'2015-01-05',NULL,0,3,32.50),
	(9,16,'2015-01-05',NULL,0,12,32.50);

/*!40000 ALTER TABLE "license_holdings" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table licenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS "licenses";

CREATE TABLE "licenses" (
  "license_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "license_number" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "license_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "license_granted_date" date DEFAULT NULL,
  "license_expiry_date" date DEFAULT NULL,
  "license_source_url" text COLLATE utf8_unicode_ci,
  "license_google_doc_url" text COLLATE utf8_unicode_ci,
  "license_notes" text COLLATE utf8_unicode_ci,
  PRIMARY KEY ("license_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "licenses" WRITE;
/*!40000 ALTER TABLE "licenses" DISABLE KEYS */;

INSERT INTO "licenses" ("license_id", "license_number", "license_type", "license_granted_date", "license_expiry_date", "license_source_url", "license_google_doc_url", "license_notes")
VALUES
	(1,'PEL0034','exploration','2011-03-14','2015-05-14','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(2,'PEL0038','exploration','2011-08-03',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(3,'PEL0039','exploration','2011-08-19','2015-08-19','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(4,'PEL0055','exploration','2012-03-28','2016-03-28','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(5,'PEL0062','exploration','2012-12-21','2016-12-21','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(6,'PEL0075','exploration','2015-01-20',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(7,'PEL0036','exploration','2011-05-03','2015-05-03','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(8,'PEL0044','exploration','2011-12-16','2015-12-16','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(9,'PEL0045','exploration','2011-12-16','2015-12-16','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(10,'PEL0073','exploration','2015-01-29',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(11,'PEL0068','exploration','2013-06-28','2017-06-28','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(12,'PEL0074','exploration','2015-01-20',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(13,'PEL0063','exploration','2013-06-18','2017-06-18','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(14,'PEL0059','exploration','2012-06-27','2016-07-27','','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',''),
	(15,'PEL0052','exploration','2012-03-28',NULL,'','https://drive.google.com/open?id=0BxJXmk2XL1rdeEdJR1Q0SmwtY3c',NULL),
	(16,'PEL0030','exploration','2011-03-14',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE "licenses" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table operators
# ------------------------------------------------------------

DROP TABLE IF EXISTS "operators";

CREATE TABLE "operators" (
  "operator_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "operator_license_id" int(11) NOT NULL,
  "operator_company_id" int(11) NOT NULL,
  "operator_start_date" date DEFAULT NULL,
  "operator_end_date" date DEFAULT NULL,
  "operator_date_approximate" tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY ("operator_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES "operators" WRITE;
/*!40000 ALTER TABLE "operators" DISABLE KEYS */;

INSERT INTO "operators" ("operator_id", "operator_license_id", "operator_company_id", "operator_start_date", "operator_end_date", "operator_date_approximate")
VALUES
	(1,16,12,NULL,NULL,0),
	(2,14,15,NULL,NULL,0),
	(3,5,18,NULL,NULL,0),
	(4,13,24,NULL,'2013-06-26',0),
	(5,13,33,'2013-06-26',NULL,0),
	(6,6,6,NULL,'2014-12-31',0),
	(7,6,27,'2014-12-31',NULL,0),
	(8,2,14,NULL,NULL,0);

/*!40000 ALTER TABLE "operators" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table people
# ------------------------------------------------------------

DROP TABLE IF EXISTS "people";

CREATE TABLE "people" (
  "person_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "person_name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "person_dob" date DEFAULT NULL,
  "person_national_id" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "person_nationality" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("person_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "people" WRITE;
/*!40000 ALTER TABLE "people" DISABLE KEYS */;

INSERT INTO "people" ("person_id", "person_name", "person_dob", "person_national_id", "person_nationality")
VALUES
	(1,'Binh Vu',NULL,NULL,'Canadian'),
	(2,'Colin Kinley',NULL,NULL,'Canadian'),
	(3,'Jeremy Driver',NULL,'',''),
	(5,'Christophe Maitre','1959-05-14',NULL,'French'),
	(6,'Maija Nghishiitende','1978-07-14','78071400068','Namibian'),
	(7,'Anne Shilengudwa','1973-12-16','73121600064','Namibian'),
	(8,'Naeman Amalwa','1963-11-18','63111800393','Namibian'),
	(9,'Botosan Omatsola','1976-02-19',NULL,'American'),
	(10,'Nadiema Eberenz','1979-03-19','79031910465','Namibian'),
	(12,'Michael Galloro','1974-09-19',NULL,'Canadian'),
	(13,'Juliana Schoeman','1949-08-05','49050801050','Namibian'),
	(14,'Johanna Maresch','1951-09-03','51030900175','Namibian'),
	(15,'Alan Bootenberg','1952-05-02',NULL,'Canadian'),
	(16,'Moshe Peterburg','1953-06-11',NULL,'Israeli'),
	(17,'Ian Tchacos','1959-07-01',NULL,'Australian'),
	(18,'Peter Russell-Jones','1960-03-09',NULL,'Australian'),
	(19,'Alastair Milne','1963-04-18',NULL,'British'),
	(20,'Onesmus Amadhila','1963-05-04','63040501380','Namibian'),
	(21,'James Crawford','1963-12-01',NULL,'Australian'),
	(22,'Gregory Eckersley','1964-08-09',NULL,'British'),
	(23,'Tanya Retief','1969-11-02','69021100614','Namibian'),
	(24,'Wolf-Dieter Wohlers','1970-10-06','70061000027','Namibian'),
	(25,'David Robinson','1971-05-01',NULL,'Australian'),
	(26,'Thomas Adams','1971-10-12','71121010148','Namibian'),
	(27,'Tangeni Ya-Shiimi','1974-03-07','74070300090','Namibian'),
	(28,'John Wareing','1974-05-09',NULL,'British'),
	(29,'Cornelis Wiersma','1976-11-09',NULL,'Dutch'),
	(30,'Gerome Prizonsky','1978-09-04','7804091050','Namibian'),
	(31,'Jurius Nkoshi','1978-12-03','78031200246','Namibian'),
	(32,'Marah Zaire','1956-07-20','56072000754','Namibian'),
	(33,'Jose Baston','1936-06-21','36062100160','Namibian'),
	(34,'Simon Steyn','1971-06-21','7106215185081','South African'),
	(35,'Zebald Rijatua','1966-07-22','66072200109','Namibian'),
	(36,'King Frans Indongo','1983-09-22','83092211138','Namibian'),
	(37,'Olekekan Akinyanmi','1971-09-23',NULL,'Nigerian'),
	(38,'Izolda Williams','1985-04-24','85042410562','Namibian'),
	(39,'Phillipine Angula','1979-02-26','79022610306','Namibian'),
	(40,'Christo Smit','1955-08-26','5508265156080','South African'),
	(41,'Roberto Colcellini','1939-10-26','39102610035','Namibian'),
	(42,'Stephen Larkin','1973-02-27',NULL,'American'),
	(43,'Pieter Gerssen','1972-04-27',NULL,'Dutch'),
	(44,'Themistokles Murorua','1958-08-27','58082700165','Namibian'),
	(45,'Ellis Ratjama','1965-05-29','65052900228','Namibian'),
	(46,'Gil Holzman','1972-09-29',NULL,'German'),
	(47,'Robert Downey','1966-08-31',NULL,'Australian');

/*!40000 ALTER TABLE "people" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS "relationships";

CREATE TABLE "relationships" (
  "relationship_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "relationship_person1_id" int(11) NOT NULL,
  "relationship_person2_id" int(11) NOT NULL,
  "relationship_type" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY ("relationship_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS "roles";

CREATE TABLE "roles" (
  "role_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "role_person_id" int(11) NOT NULL,
  "role_company_id" int(11) NOT NULL,
  "role_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "role_title" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "role_percent" decimal(11,2) DEFAULT NULL,
  "role_start_date" date DEFAULT NULL,
  "role_end_date" date DEFAULT NULL,
  "role_date_approximate" tinyint(1) NOT NULL DEFAULT '0',
  "role_source_url" text COLLATE utf8_unicode_ci,
  "role_google_doc_url" text COLLATE utf8_unicode_ci,
  PRIMARY KEY ("role_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "roles" WRITE;
/*!40000 ALTER TABLE "roles" DISABLE KEYS */;

INSERT INTO "roles" ("role_id", "role_person_id", "role_company_id", "role_type", "role_title", "role_percent", "role_start_date", "role_end_date", "role_date_approximate", "role_source_url", "role_google_doc_url")
VALUES
	(1,1,17,'management','director',NULL,'2012-12-13',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdYXdRdFJqMENaTlU'),
	(2,2,12,'management','director',NULL,'2010-07-11',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(3,3,14,'management','CEO',NULL,NULL,NULL,0,'',''),
	(4,3,14,'control',NULL,NULL,NULL,NULL,0,'',''),
	(5,5,20,'management','director',NULL,'2014-09-20',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdX0M1QzBvbElQQzg'),
	(6,6,29,'management','director',NULL,'2012-07-27',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdNVNXMW1CT0QtWWc'),
	(7,7,15,'management','director',NULL,'2011-08-15','2011-11-21',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdN3o1ZjVwSVJRUFU'),
	(8,8,12,'management','director',NULL,'2008-09-02','2014-01-21',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(9,9,34,'management','director',NULL,'2013-08-08',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdVHFVdUVBdjVrOFk'),
	(10,10,6,'management','director',NULL,NULL,'2008-10-21',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdbzNjUE01M3ptX28'),
	(11,10,23,'management','director',NULL,'2014-10-09',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdYTdNclltbndkdkU'),
	(12,12,17,'management','director',NULL,'2012-12-13',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdYXdRdFJqMENaTlU'),
	(13,13,29,'management','director',NULL,'2010-06-30',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdNVNXMW1CT0QtWWc'),
	(14,14,17,'management','director',NULL,'2011-07-13','2013-12-13',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdYXdRdFJqMENaTlU'),
	(15,15,12,'management','director',NULL,'2013-04-11',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(16,16,12,'management','director',NULL,'2011-02-02',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(17,17,9,'management','director',NULL,'2012-10-31',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ'),
	(18,18,21,'management','director',NULL,'2011-02-15',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddm03d3I4UlVzdnM'),
	(19,19,26,'management','director',NULL,'2014-05-19',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdRXZrRExKbFlPcms'),
	(20,20,29,'management','director',NULL,'2013-04-05',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdNVNXMW1CT0QtWWc'),
	(21,21,9,'management','director',NULL,'2011-05-23',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ'),
	(22,22,15,'management','director',NULL,'2011-11-21',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdN3o1ZjVwSVJRUFU'),
	(23,23,21,'management','director',NULL,'2011-02-15',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddm03d3I4UlVzdnM'),
	(24,24,9,'management','director',NULL,'2010-02-18',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ'),
	(25,25,15,'management','director',NULL,'2011-11-21',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdN3o1ZjVwSVJRUFU'),
	(26,26,29,'management','director',NULL,'2012-05-07',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdNVNXMW1CT0QtWWc'),
	(27,27,15,'management','director',NULL,'2011-11-21',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdN3o1ZjVwSVJRUFU'),
	(28,28,9,'management','director',NULL,'2010-05-03','2012-10-31',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ'),
	(29,29,26,'management','director',NULL,'2014-05-19',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdRXZrRExKbFlPcms'),
	(30,30,21,'management','director',NULL,'2011-02-15',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddm03d3I4UlVzdnM'),
	(31,31,6,'management','director',NULL,'2008-10-21',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdbzNjUE01M3ptX28'),
	(32,32,20,'management','public officer',NULL,'2014-03-14',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdX0M1QzBvbElQQzg'),
	(33,33,12,'management','director',NULL,'2013-05-10',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(34,34,34,'management','director',NULL,'2013-05-08',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdVHFVdUVBdjVrOFk'),
	(35,35,2,'management','director',NULL,'2011-12-14','2013-08-21',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdWWUzamVSYTllRGc'),
	(36,36,17,'management','director',NULL,'2012-12-13',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdYXdRdFJqMENaTlU'),
	(37,37,15,'management','director',NULL,'2011-11-21',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdN3o1ZjVwSVJRUFU'),
	(38,38,2,'management','director',NULL,'2011-11-29','2011-12-14',0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdWWUzamVSYTllRGc'),
	(39,39,12,'management','director',NULL,'2008-09-01',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(40,40,2,'management','director',NULL,'2011-12-14',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdWWUzamVSYTllRGc'),
	(41,41,21,'management','director',NULL,'2011-05-09',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddm03d3I4UlVzdnM'),
	(42,42,2,'management','director',NULL,'2011-12-14',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdWWUzamVSYTllRGc'),
	(43,43,26,'management','director',NULL,'2014-05-19',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdRXZrRExKbFlPcms'),
	(44,44,9,'management','director',NULL,'2010-05-03',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ'),
	(45,45,29,'management','director',NULL,'2012-05-07',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdNVNXMW1CT0QtWWc'),
	(46,46,12,'management','director',NULL,'2011-02-02',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rddEg1d3RHRWo5Qkk'),
	(47,47,9,'management','director',NULL,'2010-05-03',NULL,0,'','https://drive.google.com/open?id=0BxJXmk2XL1rdOExJbHpwUlAwdzQ');

/*!40000 ALTER TABLE "roles" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_havens
# ------------------------------------------------------------

DROP TABLE IF EXISTS "tax_havens";

CREATE TABLE "tax_havens" (
  "tax_haven_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "tax_haven_name" varchar(255) DEFAULT NULL,
  "tax_haven_secrecy_score" decimal(11,0) DEFAULT NULL,
  PRIMARY KEY ("tax_haven_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES "tax_havens" WRITE;
/*!40000 ALTER TABLE "tax_havens" DISABLE KEYS */;

INSERT INTO "tax_havens" ("tax_haven_id", "tax_haven_name", "tax_haven_secrecy_score")
VALUES
	(1,'United States',58),
	(2,'Canada',54),
	(3,'Bermuda',80),
	(4,'British Virgin Islands',66),
	(5,'Cayman Islands',70),
	(6,'Isle of Man',67);

/*!40000 ALTER TABLE "tax_havens" ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transfers
# ------------------------------------------------------------

DROP TABLE IF EXISTS "transfers";

CREATE TABLE "transfers" (
  "transfer_id" int(11) unsigned NOT NULL AUTO_INCREMENT,
  "transfer_date" date DEFAULT NULL,
  "transfer_license_id" int(11) NOT NULL,
  "transfer_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "transfer_seller_company_id" int(11) DEFAULT NULL,
  "transfer_seller_stake_percent_prior" decimal(11,2) DEFAULT NULL,
  "transfer_seller_stake_percent_after" decimal(11,2) DEFAULT NULL,
  "transfer_buyer_company_id" int(11) DEFAULT NULL,
  "transfer_buyer_stake_percent_after" decimal(11,2) DEFAULT NULL,
  "transfer_operator_prior_company_id" int(11) DEFAULT NULL,
  "transfer_operator_after_company_id" int(11) DEFAULT NULL,
  "transfer_transaction_notes" text COLLATE utf8_unicode_ci,
  "transfer_source_url" text COLLATE utf8_unicode_ci,
  "transfer_google_doc_url" text COLLATE utf8_unicode_ci,
  "transfer_notes" text COLLATE utf8_unicode_ci,
  PRIMARY KEY ("transfer_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES "transfers" WRITE;
/*!40000 ALTER TABLE "transfers" DISABLE KEYS */;

INSERT INTO "transfers" ("transfer_id", "transfer_date", "transfer_license_id", "transfer_type", "transfer_seller_company_id", "transfer_seller_stake_percent_prior", "transfer_seller_stake_percent_after", "transfer_buyer_company_id", "transfer_buyer_stake_percent_after", "transfer_operator_prior_company_id", "transfer_operator_after_company_id", "transfer_transaction_notes", "transfer_source_url", "transfer_google_doc_url", "transfer_notes")
VALUES
	(1,'2011-03-14',16,'transfer',41,100.00,10.00,12,90.00,NULL,12,'',NULL,'',''),
	(2,'2011-03-14',16,'transfer',41,10.00,0.00,42,10.00,NULL,12,'',NULL,'',''),
	(3,'2012-04-12',16,'transfer',12,90.00,70.00,3,20.00,12,12,'Toronto, Ontario April 12, 2012 / CNW ECO (ATLANTIC) OIL AND GAS LTD. (TSX-V:EOG) Eco (Atlantic) Oil & Gas Ltd. (“Eco Atlantic” or the “Company”) is pleased to announce that it has signed a definitive Farm-out Agreement with Azimuth Ltd. (“Azimuth”) of Hamilton, Bermuda, an exploration and production company backed by majority-owner Seacrest Capital Ltd. and Petroleum Geo-Services ASA (“PGS”) (Letter of Intent announced on December 22, 2011).   Pursuant to the agreement, Azimuth will earn  a 20% working interest in each of Eco Atlantic’s offshore Namibia licenses, namely the “Cooper License” (Block 2012A), the “Sharon License” (Blocks 2213A & 2213B) and the “Guy License” (Blocks 2111B & 2211A) (jointly, the “Licenses”) in return for funding 40% of the cost of 3D seismic surveys covering 2,500 square kilometers across all three Licenses, the acquisition of which is expected to cost in excess of US$25 million.  The assignment of a 20% working interest in the Licenses to Azimuth is subject to the approval of Namibia’s Ministry of Mines and Energy.  Eco Atlantic currently holds a 90% working interest in the Licenses through its wholly-owned subsidiary Eco Oil and Gas Namibia (PTY) Ltd. (“Eco Namibia\") and NAMCOR, the Namibian national oil and Gas Company, holds a 10% working interest. As a result of this transaction, Eco Namibia’s interest will be 70%, Azimuth will earn a 20% interest, and NAMCOR will retain its 10% carried interest. Eco Atlantic, through the project management group of Kinley Exploration and Azimuth will be responsible for designing, sourcing and operating all aspects of the 3D seismic program.',NULL,'',''),
	(4,'2014-07-17',16,'transfer',12,70.00,45.00,30,25.00,12,12,'On July 17, 2014, the Company entered into a farmout agreement (the “Tullow Farmout Agreement”) with Tullow Kudu Limited, a wholly owned subsidiary of Tullow Oil plc (“Tullow”), pursuant to which Tullow has agreed to acquire up to a 40% working interest in the Cooper License. In October, 2014, The Company completed the transfer of a 25% working interest in the Cooper License to Tullow in in return for a carry (capped at US$4.103 million) of the Company’s share of costs to execute and process a 1,000 square kilometer 3D seismic survey, and the reimbursement of 25% of the Company’s past costs in an amount of approximately US$1,000,000 (the “First Transfer”). Following the First Transfer, if Tullow elects to participate in the drilling of an exploration well on the Cooper Block, Tullow will acquire an additional 15% working interest in the Cooper License, in return for a full carry (capped at $18.17 million) of the Company’s share of costs to drill an exploration well on the Cooper Block and the reimbursement of an additional 15% of the Company’s past costs (the “Second Transfer”). There is no guarantee that the Second Transfer will be completed.',NULL,'',''),
	(6,'2015-01-05',16,'transfer',12,45.00,32.50,NULL,32.50,12,12,'The Company has agreed to transfer an additional 12.5% participating interest in Block 2012A offshore Namibia (the “Cooper Block”) to Azinam in exchange for US$3.5 million in cash. Azinam’s working commitments on the Cooper Block was not amended by the Agreement.',NULL,'',''),
	(7,'2012-07-27',14,'transfer',41,100.00,22.50,15,77.50,15,15,'',NULL,'','Lekoil AIM submission document confirms that these all happened at the same time'),
	(8,'2012-07-27',14,'transfer',41,22.50,10.00,13,12.50,15,15,'',NULL,'',''),
	(9,'2012-07-27',14,'transfer',41,10.00,0.00,NULL,10.00,15,15,'',NULL,'',''),
	(10,'2012-12-21',5,'transfer',41,100.00,10.00,18,90.00,NULL,18,'',NULL,'',''),
	(11,'2012-12-21',5,'transfer',41,10.00,0.00,NULL,10.00,NULL,18,'',NULL,'',''),
	(12,'2013-06-18',13,'transfer',41,100.00,10.00,24,90.00,NULL,24,'',NULL,'',''),
	(13,'2013-06-18',13,'transfer',41,10.00,0.00,NULL,10.00,NULL,24,'',NULL,'',''),
	(14,'2013-06-26',13,'transfer',24,90.00,15.00,33,75.00,24,33,'',NULL,'',''),
	(15,'2015-01-20',6,'transfer',41,100.00,10.00,6,90.00,NULL,6,'',NULL,'',''),
	(16,'2015-01-20',6,'transfer',41,10.00,0.00,NULL,10.00,NULL,6,'',NULL,'',''),
	(17,'2014-12-31',6,'transfer',6,90.00,10.00,27,NULL,6,27,'On or around 31st December 2014 ShoreCan entered into a Farm Out Agreement with Camelot Investment Group (Pty) Ltd (\"Camelot\"), a Namibian registered company, whereby ShoreCan acquired an 80% working interest in Block 1708, 1709, 1808 offshore Namibia deepwater blocks. ShoreCan is to be the Operator of the blocks. Camelot retains a 10% carried interest and the Namibian National Oil Company, NAMCOR, also has a 10% carried interest. ShoreCan paid a signature bonus to Camelot of $150,000 US Dollars and licence rental fees of Namibian Dollars 1,367,644.80 and training fees of $49,000 US Dollars. ShoreCan will meet 100% of the exploration costs (the \"carried costs\") and such costs will be adjusted by inflation and recoverable by ShoreCan from any Cost Oil as defined in the Farm Out Agreement. The Farm Out Agreement was amended on 4th February 2015 to clarify that Camelot would be entitled to 40% of the net gain to ShoreCan on disposal of the assets or any company holding such assets. In the event of a corporate disposal, the Namibian assets would be independently valued and such value ascribed to them for the purposes of determining any sum due to Camelot. The assignation of the interest and re-issuance of the Petroleum Exploration Licence to include ShoreCan was signed by the Minister of Mines and Energy on the 20th February 2015. The Parties have agreed to negotiate an AIPN standard Joint Operating Agreement',NULL,'',''),
	(21,'2011-03-08',2,'transfer',41,100.00,0.00,14,100.00,NULL,14,'','contracts_na_na_Blocks-1714B-1814B-1715_dd20110803_Operating-Agree_Namibia-Energy_Namibia-Exploration.pdf','',''),
	(22,'2012-08-28',2,'transfer',NULL,100.00,57.00,22,43.00,14,14,'','contracts_na_na_Blocks-1714B-1814B-1715_dd20110803_Operating-Agree_Namibia-Energy_Namibia-Exploration.pdf','',NULL);

/*!40000 ALTER TABLE "transfers" ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
