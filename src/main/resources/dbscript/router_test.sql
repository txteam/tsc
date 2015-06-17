/*
Navicat MySQL Data Transfer

Source Server         : 192.168.85.103
Source Server Version : 50619
Source Host           : 192.168.85.103:3306
Source Database       : router_test

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2015-04-02 15:51:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mobileapp_user_session`
-- ----------------------------
DROP TABLE IF EXISTS `mobileapp_user_session`;
CREATE TABLE `mobileapp_user_session` (
	`ID` varchar(64),
	`LASTCALLTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���һ�ε���ʱ��', 
	`LOGINNAME` varchar(64) NOT NULL,
	`OPERATORID` varchar(64) NOT NULL,
	primary key(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '�ֻ�Ӧ���û�session';

-- ----------------------------
-- Records of mobileapp_user_session
-- ----------------------------

-- ----------------------------
-- Table structure for `atta_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `atta_attachment`;
CREATE TABLE `atta_attachment` (
  `DELETEDATE` datetime DEFAULT NULL,
  `FILENAMEEXTENSION` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(64) DEFAULT NULL,
  `SERVICETYPE` varchar(255) DEFAULT NULL,
  `PREID` varchar(64) DEFAULT NULL,
  `LASTUPDATEOPERATORID` varchar(64) DEFAULT NULL,
  `NEXTID` varchar(64) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CREATEOPERATORID` varchar(64) DEFAULT NULL,
  `ID` varchar(64) NOT NULL DEFAULT '',
  `PARENTID` varchar(64) DEFAULT NULL,
  `LASTUPDATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `DELETEOPERATORID` varchar(64) DEFAULT NULL,
  `FILEID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of atta_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `atta_attachment_log`
-- ----------------------------
DROP TABLE IF EXISTS `atta_attachment_log`;
CREATE TABLE `atta_attachment_log` (
  `ORGANIZATIONID` varchar(64) DEFAULT NULL,
  `ATTACHEMENTID` varchar(64) DEFAULT NULL,
  `OPERATORID` varchar(64) DEFAULT NULL,
  `SERVICETYPE` varchar(255) DEFAULT NULL,
  `OPERATORNAME` varchar(64) DEFAULT NULL,
  `PROCESSTYPE` varchar(255) DEFAULT NULL,
  `CLIENTIPADDRESS` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `VCID` varchar(64) DEFAULT NULL,
  `ID` varchar(64) NOT NULL DEFAULT '',
  `OPERATORLOGINNAME` varchar(64) DEFAULT NULL,
  `FILEID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������־��';

-- ----------------------------
-- Records of atta_attachment_log
-- ----------------------------

-- ----------------------------
-- Table structure for `atta_attachment_ref`
-- ----------------------------
DROP TABLE IF EXISTS `atta_attachment_ref`;
CREATE TABLE `atta_attachment_ref` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `ATTACHMENTID` varchar(64) DEFAULT NULL,
  `REFID` varchar(64) DEFAULT NULL,
  `REFTYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����������ñ�';

-- ----------------------------
-- Records of atta_attachment_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_authitem_router`
-- ----------------------------
DROP TABLE IF EXISTS `auth_authitem_router`;
CREATE TABLE `auth_authitem_router` (
  `id` varchar(64) NOT NULL,
  `refId` varchar(64) NOT NULL,
  `refType` varchar(64) NOT NULL,
  `systemid` varchar(64) NOT NULL,
  `parentId` varchar(64) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `authType` varchar(64) NOT NULL,
  `viewAble` smallint(1) DEFAULT '1',
  `editAble` smallint(1) DEFAULT '1',
  `valid` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`systemid`),
  KEY `idx_auth_authitem_01` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_authitem_router
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_authref_his_router`
-- ----------------------------
DROP TABLE IF EXISTS `auth_authref_his_router`;
CREATE TABLE `auth_authref_his_router` (
  `id` varchar(64) NOT NULL,
  `refId` varchar(64) NOT NULL,
  `refType` varchar(64) NOT NULL,
  `authreftype` varchar(64) NOT NULL,
  `authid` varchar(128) NOT NULL,
  `systemid` varchar(64) NOT NULL,
  `authType` varchar(64) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effectiveDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invalidDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createoperid` varchar(64) DEFAULT NULL,
  `temp` smallint(6) NOT NULL DEFAULT '0',
  KEY `idx_auth_ref_his01` (`systemid`,`refId`),
  KEY `idx_auth_ref_his02` (`systemid`,`refId`,`authreftype`),
  KEY `idx_auth_ref_his03` (`systemid`,`authid`),
  KEY `idx_auth_ref_his04` (`systemid`,`authid`,`authreftype`),
  KEY `idx_auth_ref_his05` (`systemid`,`authreftype`),
  KEY `idx_auth_ref_his06` (`effectiveDate`),
  KEY `idx_auth_ref_his07` (`invalidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_authref_his_router
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_authref_router`
-- ----------------------------
DROP TABLE IF EXISTS `auth_authref_router`;
CREATE TABLE `auth_authref_router` (
  `id` varchar(64) NOT NULL,
  `refid` varchar(64) NOT NULL,
  `authreftype` varchar(64) NOT NULL,
  `authid` varchar(128) NOT NULL,
  `systemid` varchar(64) NOT NULL,
  `authType` varchar(64) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effectiveDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invalidDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createoperid` varchar(64) DEFAULT NULL,
  `temp` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auth_authref_00` (`refid`,`authreftype`,`authid`,`systemid`,`authType`,`temp`),
  KEY `idx_auth_authref_01` (`systemid`,`refid`),
  KEY `idx_auth_authref_02` (`systemid`,`refid`,`authreftype`),
  KEY `idx_auth_authref_03` (`systemid`,`authid`),
  KEY `idx_auth_authref_04` (`systemid`,`authid`,`authreftype`),
  KEY `idx_auth_authref_05` (`systemid`,`authreftype`),
  KEY `idx_auth_authref_06` (`effectiveDate`),
  KEY `idx_auth_authref_07` (`invalidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_authref_router
-- ----------------------------

-- ----------------------------
-- Table structure for `basic_district`
-- ----------------------------
DROP TABLE IF EXISTS `basic_district`;
CREATE TABLE `basic_district` (
  `id` varchar(64) NOT NULL,
  `parentId` varchar(64) DEFAULT NULL,
  `postalCode` varchar(64) DEFAULT NULL COMMENT '�����Ӧ��������',
  `remark` varchar(2000) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `fullName` varchar(64) DEFAULT NULL,
  `idCardCode` varchar(64) DEFAULT NULL COMMENT '�����Ӧ���֤����',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bas_district_00` (`code`),
  KEY `idx_bas_district_01` (`parentId`),
  KEY `idx_bas_district_02` (`idCardCode`),
  KEY `idx_bas_district_03` (`postalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of basic_district
-- ----------------------------

-- ----------------------------
-- Table structure for `core_config_context`
-- ----------------------------
DROP TABLE IF EXISTS `core_config_context`;
CREATE TABLE `core_config_context` (
  `ID` varchar(64) NOT NULL,
  `SYSTEMID` varchar(64) NOT NULL,
  `KEYNAME` varchar(64) NOT NULL,
  `VALUE` varchar(64) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LASTUPDATEDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VALIDATEEXPRESSION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_config_context
-- ----------------------------
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f78040002', 'router', 'timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 11:14:30', '2015-04-02 11:14:30', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f78270003', 'router', 'url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 11:14:30', '2015-04-02 11:14:30', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f78470004', 'router', 'test1.timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 11:14:30', '2015-04-02 11:14:30', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f787a0005', 'router', 'test1.url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 11:14:30', '2015-04-02 11:14:30', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f78ae0006', 'router', 'test1.testchild1.timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 11:14:30', '2015-04-02 11:14:30', '��ʱʱ��:required;integer[+0];range[0~60000]');
INSERT INTO `core_config_context` VALUES ('4028d6e14c781f76014c781f78cd0007', 'router', 'test1.testchild1.url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 11:14:30', '2015-04-02 11:14:30', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9c270000', 'test', 'timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 14:09:25', '2015-04-02 14:09:25', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9c5f0001', 'test', 'url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 14:09:25', '2015-04-02 14:09:25', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9c840002', 'test', 'test1.timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 14:09:25', '2015-04-02 14:09:25', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9cb40003', 'test', 'test1.url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 14:09:25', '2015-04-02 14:09:25', null);
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9ce70004', 'test', 'test1.testchild1.timeout', '2000', '��ʱʱ��', '��λ����,С�ڻ����0����ʾ�����Ƴ�ʱʱ��', '2015-04-02 14:09:25', '2015-04-02 14:09:25', '��ʱʱ��:required;integer[+0];range[0~60000]');
INSERT INTO `core_config_context` VALUES ('4028d6e14c78bf9c014c78bf9d010005', 'test', 'test1.testchild1.url', 'http://localhost:8080/HelloWorldService', '�����ַ', null, '2015-04-02 14:09:25', '2015-04-02 14:09:25', null);

-- ----------------------------
-- Table structure for `core_dbscript_context`
-- ----------------------------
DROP TABLE IF EXISTS `core_dbscript_context`;
CREATE TABLE `core_dbscript_context` (
  `ID` varchar(64) NOT NULL,
  `TABLENAME` varchar(64) NOT NULL,
  `TABLEVERSION` varchar(64) NOT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LASTUPDATEDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_CORE_DBS_CON_00` (`TABLENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_dbscript_context
-- ----------------------------
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f768f0000', 'CORE_DBSCRIPT_CONTEXT', '1.0.0', '2015-04-02 11:14:29', '2015-04-02 11:14:29');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f77a30001', 'CORE_CONFIG_CONTEXT', '1.0.2', '2015-04-02 11:14:30', '2015-04-02 11:14:30');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f834b0008', 'auth_authitem_router', '1.1.0', '2015-04-02 11:14:33', '2015-04-02 11:14:33');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f8a550009', 'auth_authref_router', '1.1.0', '2015-04-02 11:14:33', '2015-04-02 11:14:33');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f90c3000a', 'auth_authref_his_router', '1.1.0', '2015-04-02 11:14:35', '2015-04-02 11:14:35');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f92e4000b', 'core_file_definition', '1.1.0', '2015-04-02 11:14:37', '2015-04-02 11:14:37');
INSERT INTO `core_dbscript_context` VALUES ('4028d6e14c781f76014c781f9423000c', 'core_file_definition_his', '1.1.0', '2015-04-02 11:14:37', '2015-04-02 11:14:37');

-- ----------------------------
-- Table structure for `core_file_definition`
-- ----------------------------
DROP TABLE IF EXISTS `core_file_definition`;
CREATE TABLE `core_file_definition` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `system` varchar(64) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `relativePath` varchar(256) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `filenameExtension` varchar(64) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_file_definition
-- ----------------------------

-- ----------------------------
-- Table structure for `core_file_definition_his`
-- ----------------------------
DROP TABLE IF EXISTS `core_file_definition_his`;
CREATE TABLE `core_file_definition_his` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `system` varchar(64) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `relativePath` varchar(256) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `filenameExtension` varchar(64) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_file_definition_his
-- ----------------------------

-- ----------------------------
-- Table structure for `mainframe_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `mainframe_login_log`;
CREATE TABLE `mainframe_login_log` (
  `CLIENTIPADDRESS` varchar(255) DEFAULT NULL,
  `SYSTEMID` varchar(64) DEFAULT NULL,
  `ORGANIZATIONID` varchar(64) DEFAULT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `VCID` varchar(64) DEFAULT NULL COMMENT '������',
  `LOGINTYPE` tinyint(1) NOT NULL,
  `ID` varchar(64) NOT NULL,
  `OPERATORID` varchar(64) DEFAULT NULL,
  `OPERATORNAME` varchar(64) DEFAULT NULL,
  `OPERATORLOGINNAME` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��¼��־';

-- ----------------------------
-- Records of mainframe_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `mainframe_sysope_log`
-- ----------------------------
DROP TABLE IF EXISTS `mainframe_sysope_log`;
CREATE TABLE `mainframe_sysope_log` (
  `CLIENTIPADDRESS` varchar(255) DEFAULT NULL,
  `FUNCTION` varchar(255) DEFAULT NULL,
  `SYSTEMID` varchar(64) DEFAULT NULL,
  `ORGANIZATIONID` varchar(64) DEFAULT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VCID` varchar(64) DEFAULT NULL,
  `ID` varchar(64) NOT NULL,
  `OPERATORID` varchar(64) DEFAULT NULL,
  `OPERATORNAME` varchar(64) DEFAULT NULL,
  `OPERATORLOGINNAME` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainframe_sysope_log
-- ----------------------------

-- ----------------------------
-- Table structure for `mobileapp_investigate_report`
-- ----------------------------
DROP TABLE IF EXISTS `mobileapp_investigate_report`;
CREATE TABLE `mobileapp_investigate_report` (
  `SUMMARY` varchar(255) DEFAULT NULL,
  `CREATEUSERCODE` varchar(64) DEFAULT NULL,
  `STAFFNUMBER` varchar(255) DEFAULT NULL,
  `BUSINESSAREA` varchar(255) DEFAULT NULL,
  `INVESTIGATEADDR` varchar(255) DEFAULT NULL,
  `COMPANYNAME` varchar(64) DEFAULT NULL,
  `OTHER` varchar(255) DEFAULT NULL,
  `INVESTIGATEENDTIME` varchar(255) DEFAULT NULL,
  `INVENTORY` varchar(255) DEFAULT NULL,
  `INVESTIGATETYPE` tinyint(1) DEFAULT NULL,
  `COMPANYSCALE` varchar(255) DEFAULT NULL,
  `PRODUCTIONAPPARATUS` varchar(255) DEFAULT NULL,
  `IMAGESIZE` int(5) DEFAULT NULL,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CONTACTPHONE` varchar(255) DEFAULT NULL,
  `INTERVIEWCONTENT` varchar(255) DEFAULT NULL,
  `ID` varchar(64) NOT NULL DEFAULT '',
  `TASKID` varchar(64) DEFAULT NULL,
  `SERVICECONTENT` varchar(255) DEFAULT NULL,
  `CONTACTPOST` varchar(255) DEFAULT NULL,
  `CONTACTNAME` varchar(64) DEFAULT NULL,
  `HAVECOMPANYBOARD` bit(1) DEFAULT NULL,
  `COMPANYNATURE` varchar(255) DEFAULT NULL,
  `HAVECOMPANYNAMEATOFFICEAREA` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���챨��';

-- ----------------------------
-- Records of mobileapp_investigate_report
-- ----------------------------

-- ----------------------------
-- Table structure for `mobileapp_json_log`
-- ----------------------------
DROP TABLE IF EXISTS `mobileapp_json_log`;
CREATE TABLE `mobileapp_json_log` (
  `ID` varchar(64) NOT NULL DEFAULT '',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `METHOD` varchar(255) DEFAULT NULL,
  `REQUEST` bit(1) DEFAULT NULL,
  `TESTDATA` bit(1) DEFAULT NULL,
  `VERSION` varchar(64) DEFAULT NULL,
  `SERIALNUMBER` varchar(255) DEFAULT NULL,
  `UUID` varchar(64) DEFAULT NULL,
  `LOGINNAME` varchar(64) DEFAULT NULL,
  `RESPONSECODE` varchar(64) DEFAULT NULL,
  `RESPONSECODEMESSAGE` varchar(64) DEFAULT NULL,
  `PRIVAT` varchar(4000) DEFAULT NULL,
  `REQUESTBODY` varchar(4000) DEFAULT NULL,
  `RESPONSEBODY` varchar(4000) DEFAULT NULL,
  `JSON` varchar(4000) DEFAULT NULL,
  `CLIENTIPADDRESS` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(4000) DEFAULT NULL,
  `ORGANIZATIONID` varchar(64) DEFAULT NULL,
  `OPERATORLOGINNAME` varchar(64) DEFAULT NULL,
  `OPERATORID` varchar(64) DEFAULT NULL,
  `OPERATORNAME` varchar(64) DEFAULT NULL,
  `VCID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֻ�Ӧ��������Ӧ��־';

-- ----------------------------
-- Records of mobileapp_json_log
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_employeeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `oper_employeeinfo`;
CREATE TABLE `oper_employeeinfo` (
  `leavingDate` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `operatorid` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(64) DEFAULT NULL,
  `officialDate` date DEFAULT NULL,
  `entryDate` date DEFAULT NULL,
  `trialPeriodEndDate` date DEFAULT NULL,
  `leaving` tinyint(1) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `age` tinyint(1) DEFAULT NULL,
  `official` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdatePhoneLinkInfoDate` date DEFAULT NULL,
  `cardNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`operatorid`),
  UNIQUE KEY `idx_oper_emp_00` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_employeeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_employeeinfo_his`
-- ----------------------------
DROP TABLE IF EXISTS `oper_employeeinfo_his`;
CREATE TABLE `oper_employeeinfo_his` (
  `leavingDate` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `operatorid` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(64) DEFAULT NULL,
  `officialDate` date DEFAULT NULL,
  `entryDate` date DEFAULT NULL,
  `trialPeriodEndDate` date DEFAULT NULL,
  `leaving` tinyint(1) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `age` tinyint(1) DEFAULT NULL,
  `official` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdatePhoneLinkInfoDate` date DEFAULT NULL,
  `cardNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`operatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_employeeinfo_his
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_operator`
-- ----------------------------
DROP TABLE IF EXISTS `oper_operator`;
CREATE TABLE `oper_operator` (
  `id` varchar(64) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч 0 ��Ч  1��Ч  Ĭ����Ч',
  `pwdErrCount` int(10) DEFAULT NULL,
  `historyPwd` varchar(255) DEFAULT NULL,
  `organizationId` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `invalidDate` date DEFAULT NULL,
  `lastUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pwdUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mainPostId` varchar(64) DEFAULT NULL,
  `userName` varchar(64) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `examinePwd` varchar(255) DEFAULT NULL,
  `loginName` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oper_oper_00` (`loginName`),
  KEY `idx_oper_oper_01` (`loginName`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ϵͳʹ����Ա��Ϣ��';

-- ----------------------------
-- Records of oper_operator
-- ----------------------------
INSERT INTO `oper_operator` VALUES ('123456', '1', null, null, '1000000', 'admin', null, '2015-05-02 11:42:06', '2015-05-02 11:42:06', null, 'admin', '0', '2015-05-02 11:42:06', null, 'admin');
INSERT INTO `oper_operator` VALUES ('123456001', '1', null, null, '1000000', 'yr', null, '2015-05-02 11:42:06', '2015-05-02 11:42:06', null, 'yr', '0', '2015-05-02 11:42:06', null, 'yr');
INSERT INTO `oper_operator` VALUES ('123456002', '1', null, null, '1000000', 'pqy', null, '2015-05-02 11:42:06', '2015-05-02 11:42:06', null, 'pqy', '0', '2015-05-02 11:42:06', null, 'pqy');

-- ----------------------------
-- Table structure for `oper_operator_his`
-- ----------------------------
DROP TABLE IF EXISTS `oper_operator_his`;
CREATE TABLE `oper_operator_his` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `pwdErrCount` int(10) DEFAULT NULL,
  `historyPwd` varchar(255) DEFAULT NULL,
  `organizationId` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `invalidDate` date DEFAULT NULL,
  `lastUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pwdUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mainPostId` varchar(64) DEFAULT NULL,
  `userName` varchar(64) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `examinePwd` varchar(255) DEFAULT NULL,
  `loginName` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_operator_his
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_operator_ref`
-- ----------------------------
DROP TABLE IF EXISTS `oper_operator_ref`;
CREATE TABLE `oper_operator_ref` (
  `EFFECTIVEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATORID` varchar(64) NOT NULL,
  `REFID` varchar(64) NOT NULL,
  `ENDDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `INVALIDDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REFTYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`OPERATORID`,`REFID`,`REFTYPE`),
  KEY `IDX_OPER_OPERREF_00` (`OPERATORID`,`REFTYPE`),
  KEY `IDX_OPER_OPERREF_01` (`REFID`,`REFTYPE`),
  KEY `IDX_OPER_OPERREF_02` (`INVALIDDATE`),
  KEY `IDX_OPER_OPERREF_HIS_00` (`OPERATORID`,`REFTYPE`),
  KEY `IDX_OPER_OPERREF_HIS_01` (`REFID`,`REFTYPE`),
  KEY `IDX_OPER_OPERREF_HIS_02` (`INVALIDDATE`),
  KEY `IDX_OPER_OPERREF_HIS_10` (`OPERATORID`,`REFID`,`REFTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_operator_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_operator_ref_his`
-- ----------------------------
DROP TABLE IF EXISTS `oper_operator_ref_his`;
CREATE TABLE `oper_operator_ref_his` (
  `EFFECTIVEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OPERATORID` varchar(64) NOT NULL,
  `REFID` varchar(64) NOT NULL,
  `ENDDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `INVALIDDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REFTYPE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_operator_ref_his
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_organization`
-- ----------------------------
DROP TABLE IF EXISTS `oper_organization`;
CREATE TABLE `oper_organization` (
  `vcid` varchar(64) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ���Ч 1 ��Ч 0 ��Ч',
  `fullAddress` varchar(255) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `type` varchar(64) DEFAULT NULL COMMENT '��֯����',
  `id` varchar(64) NOT NULL,
  `parentId` varchar(64) DEFAULT NULL,
  `districtId` varchar(64) DEFAULT NULL,
  `chiefType` varchar(64) DEFAULT NULL COMMENT '��֯�������ͣ���������Ա��������ְλ��Ҳ����������...',
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `fullName` varchar(64) NOT NULL,
  `chiefId` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oper_organ_01` (`code`),
  KEY `idx_oper_organ_02` (`vcid`),
  KEY `idx_oper_organ_03` (`parentId`),
  KEY `idx_oper_organ_04` (`chiefType`,`chiefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��֯��Ϣ';

-- ----------------------------
-- Records of oper_organization
-- ----------------------------
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1000000', '��˾', '1000000', null, null, '��Ա', null, '���Ź�˾', '���Ź�˾', null);
INSERT INTO `oper_organization` VALUES ('1000001', '1', null, null, null, '1000001', '�ֹ�˾', '1000001', '1000000', null, '��Ա', null, '�ֹ�˾A', '���Ź�˾_�ֹ�˾A', null);
INSERT INTO `oper_organization` VALUES ('1000001', '1', null, null, null, '100000101', '����', '100000101', '1000001', null, '��Ա', null, '����A', '���Ź�˾_�ֹ�˾A_����A', null);
INSERT INTO `oper_organization` VALUES ('1000001', '1', null, null, null, '100000102', '����', '100000102', '1000001', null, '��Ա', null, '����B', '���Ź�˾_�ֹ�˾A_����B', null);
INSERT INTO `oper_organization` VALUES ('1000001', '1', null, null, null, '100000103', '����', '100000103', '1000001', null, '��Ա', null, '����C', '���Ź�˾_�ֹ�˾A_����C', null);
INSERT INTO `oper_organization` VALUES ('1000002', '1', null, null, null, '1000002', '�ֹ�˾', '1000002', '1000000', null, '��Ա', null, '�ֹ�˾B', '�ֹ�˾B', null);
INSERT INTO `oper_organization` VALUES ('1000002', '1', null, null, null, '1000002002', '����', '1000002002', '1000002', null, '��Ա', null, '�ֹ�˾����B', '�ֹ�˾����B', null);
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1100000001', '����', '1100000001', '1000000', null, '��Ա', null, 'ϵͳ������', '���Ź�˾_ϵͳ������', null);
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1100000002', '����', '1100000002', '1000000', null, '��Ա', null, '������Դ��', '���Ź�˾_ϵͳ������', null);
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1100000004', '����', '1100000004', '1000000', null, '��Ա', null, '�г���', '���Ź�˾_�г���', null);
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1100000004001', '����', '1100000004001', '1100000004', null, '��Ա', null, '����һ��', '���Ź�˾_�г���_����һ��', null);
INSERT INTO `oper_organization` VALUES ('1000000', '1', null, null, null, '1100000004002', '����', '1100000004002', '1100000004', null, '��Ա', null, '���۶���', '���Ź�˾_�г���_���۶���', null);
INSERT INTO `oper_organization` VALUES ('2000000', '1', null, null, null, '2000000', '�ֹ�˾', '2000000', null, null, '��Ա', null, '��������˾A', '��������˾A', null);
INSERT INTO `oper_organization` VALUES ('3000000', '1', null, null, null, '3000000', '�ֹ�˾', '3000000', null, null, '��Ա', null, '��������˾B', '��������˾B', null);
INSERT INTO `oper_organization` VALUES ('3000000', '1', null, null, null, '30000001', '����', '30000001', '3000000', null, '��Ա', null, '���´�A', '��������˾B_���´�A', null);

-- ----------------------------
-- Table structure for `oper_organization_his`
-- ----------------------------
DROP TABLE IF EXISTS `oper_organization_his`;
CREATE TABLE `oper_organization_his` (
  `vcid` varchar(64) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `fullAddress` varchar(255) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `id` varchar(64) NOT NULL,
  `parentId` varchar(64) DEFAULT NULL,
  `districtId` varchar(64) DEFAULT NULL,
  `chiefType` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `fullName` varchar(64) NOT NULL,
  `chiefId` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_organization_his
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_post`
-- ----------------------------
DROP TABLE IF EXISTS `oper_post`;
CREATE TABLE `oper_post` (
  `id` varchar(64) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `parentId` varchar(64) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `organizationId` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL COMMENT 'ְλ����',
  `fullName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oper_post_00` (`parentId`),
  KEY `idx_oper_post_01` (`code`),
  KEY `idx_oper_post_02` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ְλ��Ϣ';

-- ----------------------------
-- Records of oper_post
-- ----------------------------
INSERT INTO `oper_post` VALUES ('1000000301', '1', null, '���Ź�˾ϵͳ���������ž���', '���ž���', '1000000', null, null);
INSERT INTO `oper_post` VALUES ('100000030101', '1', '1000000301', '���Ź�˾ϵͳ��������Ŀ����', '��Ŀ����', '1000000', null, null);
INSERT INTO `oper_post` VALUES ('10000003010101', '1', '100000030101', '���Ź�˾ϵͳ�������߼��������ʦ', '�߼��������ʦ', '1000000', null, null);
INSERT INTO `oper_post` VALUES ('10000003010102', '1', '100000030101', '���Ź�˾ϵͳ����������ʦ', '����ʦ', '1000000', null, null);
INSERT INTO `oper_post` VALUES ('10000003010103', '1', '100000030101', '���Ź�˾ϵͳ������������ʦ', '������ʦ', '1000000', null, null);
INSERT INTO `oper_post` VALUES ('100000030102', '1', '1000000301', '���Ź�˾ϵͳ������SE', 'SE', '1000000', null, null);

-- ----------------------------
-- Table structure for `oper_posttype`
-- ----------------------------
DROP TABLE IF EXISTS `oper_posttype`;
CREATE TABLE `oper_posttype` (
  `NAME` varchar(64) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `ID` varchar(64) NOT NULL DEFAULT '',
  `REMARK` varchar(2000) DEFAULT NULL,
  `LASTUPDATEDATE` datetime DEFAULT NULL,
  `VALID` bit(1) DEFAULT NULL,
  `CODE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oper_posttype
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_post_his`
-- ----------------------------
DROP TABLE IF EXISTS `oper_post_his`;
CREATE TABLE `oper_post_his` (
  `id` varchar(64) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `parentId` varchar(64) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `organizationId` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʷְλ��Ϣ';

-- ----------------------------
-- Records of oper_post_his
-- ----------------------------

-- ----------------------------
-- Table structure for `oper_vc`
-- ----------------------------
DROP TABLE IF EXISTS `oper_vc`;
CREATE TABLE `oper_vc` (
  `id` varchar(64) NOT NULL,
  `parentId` varchar(64) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `name` varchar(64) NOT NULL COMMENT '��������',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_OPER_VC` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of oper_vc
-- ----------------------------
INSERT INTO `oper_vc` VALUES ('001', null, '���Ź�˾', '���Ź�˾');
INSERT INTO `oper_vc` VALUES ('00101', '001', '�ֹ�˾һ', '�ֹ�˾һ');
INSERT INTO `oper_vc` VALUES ('00102', '001', '�ֹ�˾��', '�ֹ�˾��');
INSERT INTO `oper_vc` VALUES ('002', '001', '��������˾A', '��������˾A');
INSERT INTO `oper_vc` VALUES ('003', '001', '��������˾B', '��������˾B');
