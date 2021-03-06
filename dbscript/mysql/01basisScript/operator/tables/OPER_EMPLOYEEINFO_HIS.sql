DROP TABLE OPER_EMPLOYEEINFO_HIS;
CREATE TABLE OPER_EMPLOYEEINFO_HIS(
	leavingDate datetime,
	sex smallint,
	operatorid varchar(64),
	code varchar(64),
	officialDate datetime,
	entryDate datetime,
	trialPeriodEndDate datetime,
	leaving smallint,
	name varchar(64),
	age smallint,
	official smallint default 0 not null,
	lastUpdatePhoneLinkInfoDate datetime,
	cardNum varchar(255),
	primary key(OPERATORID)
);
