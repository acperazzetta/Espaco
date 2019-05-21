CREATE DATABASE  IF NOT EXISTS `espatial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `espatial`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: espatial
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clinics` (
  `id` varchar(20) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics`
--

LOCK TABLES `clinics` WRITE;
/*!40000 ALTER TABLE `clinics` DISABLE KEYS */;
INSERT INTO `clinics` VALUES ('anything','Test 4, Swords','<p>This is the Swords branch. Nice place!',53.4628,-6.21805),('blanchardstown','Test 2 Therapy, BlanchardsTown','<p>BlanchardsTown branch. The best options for who is living at North Dublin. We have many options for your relaxation</p><p>For more informations, please call 01 532 5234</p>',53.3931,-6.38622),('cityCentre','Test 1, City Centre','<p>This is our main clinic. You can find all our therapies and therapists.</p><p>For more informations, please call 01 123 4567</p>',53.3521,-6.26451),('rathmines','Test 3 Therapy, Rathmines','<p>Prathmines branch. Perfect for who needs to use public transportation. Just beside the Beechwood Luas Stop, it is easy and fast to commute to here.</p><p>For more informations, please call 01 153 8468</p>',53.3212,-6.25626);
/*!40000 ALTER TABLE `clinics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `services` (
  `id` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `text` varchar(8000) DEFAULT NULL,
  `subtitle` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('asf','asdf','asdf',NULL),('asfasf','af','asf',NULL),('asfd','asdf','asdf',NULL),('asfdf','asdf','asfd',NULL),('asfdsafd','asfdasf','asdfasdf',NULL),('ewert','af','asdf',NULL),('idxxx','Title','Text','SubTitle'),('newId','Title Edited','Any Text I want',NULL),('psicoCriancas','Psychotherapy Children and Young People','<p> Today, children and young people also face challenges that can disorganize them emotionally and manifest themselves in anxious, depressed behavior, eating disorders, lack of concentration, hyperactivity , etc. Others may have had traumatic experiences of bullying, violence, bereavement, divorce or other issues that hinder their ability to self-regulate and resilience. </ p> <p> Our mission is to help them restore his confidence and joy, through techniques of corporal psychotherapy, where the word and the joke come together in order to safely rescue his Child Being and his Adolescent Being. </ p>',NULL),('psicoGrupo','Group Psychotherapy','<p> Using a variety of techniques and therapeutic tools, the group process helps in understanding one\'s own thoughts and feelings, allowing one to observe, experience and improve the way one relates to oneself and in a group. - to look and be looked at, to listen and to be listened to - gaining feelings of belonging, increasing self-esteem, self-confidence and developing personal resources. </ P> <p> The group operates as a laboratory, where each person has the freedom to express a different way of being and being that can and should lead to your life outside the group. In a safe, trustworthy and ethical context, it gives everyone the opportunity to learn to be with you and with others in a more confident and healthier way, without criticism and without judgment. </ p> <p> \"Alone as petals, united as pink.',NULL),('psicoIndiv','Individual Psychotherapy','<p> Psychotherapy aims to promote the well-being and quality of life of the Human Being. </ p> <p> It embraces all its dimensions and respects its uniqueness. self discovery and self knowledge, body psychotherapy allows the person to contact and explore their internal resources that strengthen their structure, enabling them to deal with all their personal and professional issues. </ p>',NULL),('sdfsadf','asfd','afsd',NULL),('terapiaCasal','Couple Therapy','<p> Enables a look that goes beyond the difficulties and resistances of each one, providing a greater awareness and perception of the relationship itself. </ p> <p> Through techniques adapted to the couple and their needs, </ p> <p> \"I see you exactly as you are, I see myself in you, I recognize and receive the truth.\" </p>',NULL),('terapiaSE','SE Therapy - Trauma Resolution','Somatic experience is a psychobiological approach to the treatment of anxiety and post-traumatic stress. </ p> <p> Somatic Experience will help the client to make their Nervous System more resilient by modifying the physiological basis of the symptoms of post-traumatic stress.The person is helped to complete the physiological responses that were frozen in the traumatic moment, and thus to discharge the high activation energy that accompanied a moment of intense fear. > <p> It is especially suitable for the treatment of posttraumatic stress resulting from situations commonly recognized as traumatic - accidents, surgical procedures, pre and perinatal complications, various violence, serious illnesses, natural disasters, car accidents, assaults, However, they may also stem from seemingly insignificant events, as long as the \"fright\" has not been completely I downloaded you. </ p> ',NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 23:22:53
