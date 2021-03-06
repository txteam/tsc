DROP TABLE OPER_OPERATOR_REF;
CREATE TABLE OPER_OPERATOR_REF(
	EFFECTIVEDATE datetime,
	CREATEDATE datetime not null,
	OPERATORID varchar(64) not null,
	REFID varchar(64) not null,
	ENDDATE datetime,
	INVALIDDATE datetime,
	REFTYPE varchar(255) not null,
	PRIMARY KEY(OPERATORID,REFID,REFTYPE)
);
CREATE INDEX IDX_OPER_OPERREF_00 ON OPER_OPERATOR_REF(OPERATORID,REFTYPE);
CREATE INDEX IDX_OPER_OPERREF_01 ON OPER_OPERATOR_REF(REFID,REFTYPE);
CREATE INDEX IDX_OPER_OPERREF_02 ON OPER_OPERATOR_REF(INVALIDDATE);
