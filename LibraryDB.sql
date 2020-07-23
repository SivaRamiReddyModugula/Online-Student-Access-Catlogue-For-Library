/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - library
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `library`;

USE `library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `date` date NOT NULL,
  `status` varchar(80) NOT NULL default 'sending',
  PRIMARY KEY  (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `sno` int(100) NOT NULL auto_increment,
  `bname` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publication` varchar(100) NOT NULL,
  `count` int(255) NOT NULL default '1',
  `issue` int(255) NOT NULL default '0',
  `available` int(255) NOT NULL default '1',
  PRIMARY KEY  (`sno`,`bname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bid` varchar(20) NOT NULL,
  `callno` varchar(50) default NULL,
  `bname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publication` varchar(60) NOT NULL,
  `yearofpublication` varchar(50) default NULL,
  `vendorordoner` varchar(50) default NULL,
  `invoiceno` varchar(50) default NULL,
  `pages` varchar(50) default NULL,
  `edition` varchar(50) default NULL,
  `price` varchar(50) default NULL,
  `course` varchar(50) default NULL,
  `branch` varchar(50) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `factissue` */

DROP TABLE IF EXISTS `factissue`;

CREATE TABLE `factissue` (
  `sno` int(255) NOT NULL auto_increment,
  `bid` varchar(50) NOT NULL default '',
  `bname` varchar(50) NOT NULL default '',
  `author` varchar(50) NOT NULL default '',
  `fid` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `issue` date NOT NULL default '0000-00-00',
  `submit` date NOT NULL default '0000-00-00',
  `submitted` date default NULL,
  `status` varchar(50) NOT NULL default 'issued',
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `fid` varchar(20) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(20) NOT NULL default '',
  `mno` varchar(20) NOT NULL default '',
  `dept` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL default '',
  `status` varchar(10) NOT NULL default 'waiting',
  `pic` longblob NOT NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `issue` */

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `sno` int(255) NOT NULL auto_increment,
  `bid` varchar(50) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `htno` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `issue` date NOT NULL,
  `submit` date NOT NULL,
  `submitted` date default NULL,
  `status` varchar(50) NOT NULL default 'issued',
  `fine` int(255) default '0',
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `htno` varchar(10) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(20) NOT NULL,
  `mno` varchar(20) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL default 'waiting',
  `pic` longblob NOT NULL,
  PRIMARY KEY  (`htno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
