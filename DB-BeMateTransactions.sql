-- ----------------------------------------------------
-- -------------- BeMate Transactions -----------------
-- ----------------------------------------------------
-- ----------------------------------------------------
-- ------- Part I: Destroy tables if necessary --------
-- ----------------------------------------------------

DROP TABLE BEMATETRANSACTIONS CASCADE CONSTRAINTS;

-- ----------------------------------------------------
-- ------ Part II: Create tables ----------------------
-- ----------------------------------------------------

CREATE TABLE BEMATETRANSACTIONS(
   oficina 	 		    NUMBER(4),
   fecha_operacion  DATE NOT NULL,
   fecha_valor    	DATE NOT NULL,
   concepto_comun   NUMBER(2) NOT NULL,
   concepto_propio  NUMBER(3) NOT NULL,
   debe_haber      	VARCHAR2(1) NOT NULL,
   importe    		  VARCHAR2(14) NOT NULL,--ojito con este, son 12,2
   numero_documento VARCHAR2(10) NOT NULL,
   ref1 			      VARCHAR2(12) NOT NULL,
   ref2 			      VARCHAR2(16) NOT NULL,
   cod_registro 	  NUMBER(2) NOT NULL,
   cod_dato 		    NUMBER(2) NOT NULL,
   concepto1 		    VARCHAR2(38) NOT NULL,
   concepto2 		    VARCHAR2(38) NOT NULL,
   CONSTRAINT PK_TRANSACTIONS PRIMARY KEY (oficina),
   CONSTRAINT CK_DH CHECK (debe_haber IN ('1','2'))
);

--ceros a la izquierda--
Update BEMATETRANSACTIONS Set oficina=RIGHT('0000' + Ltrim(Rtrim(oficina)),4);
Update BEMATETRANSACTIONS Set importe=RIGHT('00000000000000' + Ltrim(Rtrim(importe)),14);
Update BEMATETRANSACTIONS Set numero_documento=RIGHT('0000000000' + Ltrim(Rtrim(numero_documento)),10);
Update BEMATETRANSACTIONS Set ref1=RIGHT('000000000000' + Ltrim(Rtrim(ref1)),12);
--Meter la coma--
SELECT (SUBSTRING(importe, 1, 12) + ', ' + SUBSTRING(importe, 13, 2)) AS import
FROM BEMATETRANSACTIONS;
