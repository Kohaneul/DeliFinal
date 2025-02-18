--delivery
CREATE TABLE restaurant(
    restno NUMBER(6)
        CONSTRAINT RS_NO_PK PRIMARY KEY,
    rname VARCHAR2(20 CHAR)
        CONSTRAINT RS_NAME_NN NOT NULL,
    cname NUMBER(4)
        CONSTRAINT RS_CTG_FK REFERENCES menucategory(code)
        CONSTRAINT RS_CTG_NN NOT NULL,
    addr VARCHAR2(60 CHAR)
        CONSTRAINT RS_ADDR_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT RS_TEL_UK UNIQUE
        CONSTRAINT RS_TEL_NN NOT NULL,
    rotime VARCHAR2(20CHAR)
        CONSTRAINT RS_ROTIME_NN NOT NULL,
    rctime VARCHAR2(20CHAR)
        CONSTRAINT RS_RCTIME_NN NOT NULL,
    esti NUMBER(2, 1) DEFAULT 0
        CONSTRAINT RS_ESTI_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RS_SHOW_CK CHECK (isshow IN('Y','N'))
        CONSTRAINT RS_SHOW_NN NOT NULL,
    delpay NUMBER(6) DEFAULT 0
        CONSTRAINT RS_DEL_NN NOT NULL,
    minprice NUMBER(6) DEFAULT 0
        CONSTRAINT RS_MINP_NN NOT NULL,
    mcode
        CONSTRAINT RS_MCODE_FK REFERENCES middlearea(code)
        CONSTRAINT RS_MCODE_NN NOT NULL
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    'a중국집', 1002, '서울특별시 관악구 남부순환로 1820', '02-6020-0052', 
    '10:00','21:00' ,21
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    'b중국집', 1002, '서울특별시 관악구 남부순환로 1000', '02-1111-2222', 
    '10:00','21:30' ,21
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    '안래홍', 1002, '서울특별시 종로구 종로7길 43', '02-739-8013', 
    '11:00','22:00' , 1
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    '서호장', 1002, '서울특별시 종로구 관수동 수표로 91-1', '02-2265-5329', 
    '11:00','21:30' ,1
);


INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울특별시 영등포구 영등포로62길 10','02-6020-0154','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로62길 10',INSTR('서울특별시 영등포구 영등포로62길 10', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로62길 10',' ',1,2)-INSTR('서울특별시 영등포구 영등포로62길 10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울특별시 영등포구 대방천로 260 1층','02-6020-0155','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 260 1층',INSTR('서울특별시 영등포구 대방천로 260 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 260 1층',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 260 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울특별시 영등포구 영등포로72길 18','02-6020-0156','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로72길 18',INSTR('서울특별시 영등포구 영등포로72길 18', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로72길 18',' ',1,2)-INSTR('서울특별시 영등포구 영등포로72길 18',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울특별시 영등포구 대방천로 249 1층','02-6020-0157','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 249 1층',INSTR('서울특별시 영등포구 대방천로 249 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 249 1층',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 249 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울특별시 영등포구 여의대방로29길 9','02-6020-0158','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로29길 9',INSTR('서울특별시 영등포구 여의대방로29길 9', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로29길 9',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로29길 9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울특별시 영등포구 가마산로 412','02-6020-0159','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로 412',INSTR('서울특별시 영등포구 가마산로 412', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로 412',' ',1,2)-INSTR('서울특별시 영등포구 가마산로 412',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울특별시 영등포구 가마산로89길 8 1층','02-6020-0160','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로89길 8 1층',INSTR('서울특별시 영등포구 가마산로89길 8 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로89길 8 1층',' ',1,2)-INSTR('서울특별시 영등포구 가마산로89길 8 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울특별시 영등포구 신길로 167 1층 104호','02-6020-0161','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신길로 167 1층 104호',INSTR('서울특별시 영등포구 신길로 167 1층 104호', ' ',1,1)+1, INSTR('서울특별시 영등포구 신길로 167 1층 104호',' ',1,2)-INSTR('서울특별시 영등포구 신길로 167 1층 104호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울특별시 영등포구 여의대방로 177 1층','02-6020-0162','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로 177 1층',INSTR('서울특별시 영등포구 여의대방로 177 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로 177 1층',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로 177 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울특별시 영등포구 도신로 114 하나빌딩 1층','02-6020-0163','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로 114 하나빌딩 1층',INSTR('서울특별시 영등포구 도신로 114 하나빌딩 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로 114 하나빌딩 1층',' ',1,2)-INSTR('서울특별시 영등포구 도신로 114 하나빌딩 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울특별시 영등포구 대방천로 260','02-6020-0164','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 260',INSTR('서울특별시 영등포구 대방천로 260', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 260',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 260',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울특별시 영등포구 대방천로 190','02-6020-0165','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 190',INSTR('서울특별시 영등포구 대방천로 190', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 190',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 190',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울특별시 영등포구 신길로39길 4','02-6020-0166','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신길로39길 4',INSTR('서울특별시 영등포구 신길로39길 4', ' ',1,1)+1, INSTR('서울특별시 영등포구 신길로39길 4',' ',1,2)-INSTR('서울특별시 영등포구 신길로39길 4',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'서울특별시 영등포구 도신로60길 22-3 2층','02-6020-0167','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로60길 22-3 2층',INSTR('서울특별시 영등포구 도신로60길 22-3 2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로60길 22-3 2층',' ',1,2)-INSTR('서울특별시 영등포구 도신로60길 22-3 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울특별시 영등포구 신길로 137 1,2층','02-6020-0168','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신길로 137 1,2층',INSTR('서울특별시 영등포구 신길로 137 1,2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 신길로 137 1,2층',' ',1,2)-INSTR('서울특별시 영등포구 신길로 137 1,2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울특별시 영등포구 영등포로62길 2 명성힐타워 1층','02-6020-0169','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로62길 2 명성힐타워 1층',INSTR('서울특별시 영등포구 영등포로62길 2 명성힐타워 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로62길 2 명성힐타워 1층',' ',1,2)-INSTR('서울특별시 영등포구 영등포로62길 2 명성힐타워 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울특별시 영등포구 여의대방로 101 1,2층','02-6020-0170','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로 101 1,2층',INSTR('서울특별시 영등포구 여의대방로 101 1,2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로 101 1,2층',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로 101 1,2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울특별시 영등포구 가마산로 501','02-6020-0171','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로 501',INSTR('서울특별시 영등포구 가마산로 501', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로 501',' ',1,2)-INSTR('서울특별시 영등포구 가마산로 501',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울특별시 영등포구 가마산로88길 1','02-6020-0172','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로88길 1',INSTR('서울특별시 영등포구 가마산로88길 1', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로88길 1',' ',1,2)-INSTR('서울특별시 영등포구 가마산로88길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울특별시 영등포구 대방천로 247 이화빌딩 1층','02-6020-0173','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 247 이화빌딩 1층',INSTR('서울특별시 영등포구 대방천로 247 이화빌딩 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 247 이화빌딩 1층',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 247 이화빌딩 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울특별시 영등포구 가마산로61길 10 상가 1층 102호','02-6020-0174','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로61길 10 상가 1층 102호',INSTR('서울특별시 영등포구 가마산로61길 10 상가 1층 102호', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로61길 10 상가 1층 102호',' ',1,2)-INSTR('서울특별시 영등포구 가마산로61길 10 상가 1층 102호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울특별시 영등포구 신풍로 87','02-6020-0175','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신풍로 87',INSTR('서울특별시 영등포구 신풍로 87', ' ',1,1)+1, INSTR('서울특별시 영등포구 신풍로 87',' ',1,2)-INSTR('서울특별시 영등포구 신풍로 87',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울특별시 영등포구 신길로33길 8','02-6020-0176','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신길로33길 8',INSTR('서울특별시 영등포구 신길로33길 8', ' ',1,1)+1, INSTR('서울특별시 영등포구 신길로33길 8',' ',1,2)-INSTR('서울특별시 영등포구 신길로33길 8',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울특별시 영등포구 대방천로 233 2층','02-6020-0177','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 233 2층',INSTR('서울특별시 영등포구 대방천로 233 2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 233 2층',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 233 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울특별시 영등포구 여의대방로 209','02-6020-0178','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로 209',INSTR('서울특별시 영등포구 여의대방로 209', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로 209',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로 209',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울특별시 영등포구 여의대방로47길 26 1층','02-6020-0179','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로47길 26 1층',INSTR('서울특별시 영등포구 여의대방로47길 26 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로47길 26 1층',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로47길 26 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1009,'서울특별시 영등포구 도신로 166','02-6020-0180','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로 166',INSTR('서울특별시 영등포구 도신로 166', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로 166',' ',1,2)-INSTR('서울특별시 영등포구 도신로 166',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울특별시 영등포구 가마산로90길 3','02-6020-0181','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 가마산로90길 3',INSTR('서울특별시 영등포구 가마산로90길 3', ' ',1,1)+1, INSTR('서울특별시 영등포구 가마산로90길 3',' ',1,2)-INSTR('서울특별시 영등포구 가마산로90길 3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울특별시 영등포구 도림로 276','02-6020-0182','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도림로 276',INSTR('서울특별시 영등포구 도림로 276', ' ',1,1)+1, INSTR('서울특별시 영등포구 도림로 276',' ',1,2)-INSTR('서울특별시 영등포구 도림로 276',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1010,'서울특별시 영등포구 신풍로10길 2-16','02-6020-0183','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 신풍로10길 2-16',INSTR('서울특별시 영등포구 신풍로10길 2-16', ' ',1,1)+1, INSTR('서울특별시 영등포구 신풍로10길 2-16',' ',1,2)-INSTR('서울특별시 영등포구 신풍로10길 2-16',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울특별시 영등포구 영등포로 371-2 1층','02-6020-0184','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로 371-2 1층',INSTR('서울특별시 영등포구 영등포로 371-2 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로 371-2 1층',' ',1,2)-INSTR('서울특별시 영등포구 영등포로 371-2 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울특별시 영등포구 도신로 106 1층','02-6020-0185','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로 106 1층',INSTR('서울특별시 영등포구 도신로 106 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로 106 1층',' ',1,2)-INSTR('서울특별시 영등포구 도신로 106 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1011,'서울특별시 영등포구 영등포로76길 1','02-6020-0186','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로76길 1',INSTR('서울특별시 영등포구 영등포로76길 1', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로76길 1',' ',1,2)-INSTR('서울특별시 영등포구 영등포로76길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울특별시 영등포구 대방천로 155 1,2층','02-6020-0187','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 대방천로 155 1,2층',INSTR('서울특별시 영등포구 대방천로 155 1,2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 대방천로 155 1,2층',' ',1,2)-INSTR('서울특별시 영등포구 대방천로 155 1,2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울특별시 관악구 보라매로 20 지하1층','02-6020-0188','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 관악구 보라매로 20 지하1층',INSTR('서울특별시 관악구 보라매로 20 지하1층', ' ',1,1)+1, INSTR('서울특별시 관악구 보라매로 20 지하1층',' ',1,2)-INSTR('서울특별시 관악구 보라매로 20 지하1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1012,'서울특별시 영등포구 영등포로 195-1 1층','02-6020-0189','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로 195-1 1층',INSTR('서울특별시 영등포구 영등포로 195-1 1층', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로 195-1 1층',' ',1,2)-INSTR('서울특별시 영등포구 영등포로 195-1 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울특별시 구로구 시흥대로 577 지하1층','02-6020-0190','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 구로구 시흥대로 577 지하1층',INSTR('서울특별시 구로구 시흥대로 577 지하1층', ' ',1,1)+1, INSTR('서울특별시 구로구 시흥대로 577 지하1층',' ',1,2)-INSTR('서울특별시 구로구 시흥대로 577 지하1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울특별시 영등포구 여의대방로 145 세인트빌딩','02-6020-0191','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 여의대방로 145 세인트빌딩',INSTR('서울특별시 영등포구 여의대방로 145 세인트빌딩', ' ',1,1)+1, INSTR('서울특별시 영등포구 여의대방로 145 세인트빌딩',' ',1,2)-INSTR('서울특별시 영등포구 여의대방로 145 세인트빌딩',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1013,'서울특별시 영등포구 도신로 237','02-6020-0192','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로 237',INSTR('서울특별시 영등포구 도신로 237', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로 237',' ',1,2)-INSTR('서울특별시 영등포구 도신로 237',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울특별시 영등포구 영등포로 416 1,2층','02-6020-0193','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 영등포로 416 1,2층',INSTR('서울특별시 영등포구 영등포로 416 1,2층', ' ',1,1)+1, INSTR('서울특별시 영등포구 영등포로 416 1,2층',' ',1,2)-INSTR('서울특별시 영등포구 영등포로 416 1,2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울특별시 영등포구 도신로 181 성지빌딩4층','02-6020-0194','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 영등포구 도신로 181 성지빌딩4층',INSTR('서울특별시 영등포구 도신로 181 성지빌딩4층', ' ',1,1)+1, INSTR('서울특별시 영등포구 도신로 181 성지빌딩4층',' ',1,2)-INSTR('서울특별시 영등포구 도신로 181 성지빌딩4층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울특별시 동작구 상도로 42 1층 2호','02-6020-0195','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 동작구 상도로 42 1층 2호',INSTR('서울특별시 동작구 상도로 42 1층 2호', ' ',1,1)+1, INSTR('서울특별시 동작구 상도로 42 1층 2호',' ',1,2)-INSTR('서울특별시 동작구 상도로 42 1층 2호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울특별시 종로구 경희궁1길 5 1층','02-6020-0196','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 경희궁1길 5 1층',INSTR('서울특별시 종로구 경희궁1길 5 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 경희궁1길 5 1층',' ',1,2)-INSTR('서울특별시 종로구 경희궁1길 5 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울특별시 종로구 자하문로 17-2','02-6020-0197','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로 17-2',INSTR('서울특별시 종로구 자하문로 17-2', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로 17-2',' ',1,2)-INSTR('서울특별시 종로구 자하문로 17-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울특별시 종로구 자하문로 32 1층','02-6020-0198','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로 32 1층',INSTR('서울특별시 종로구 자하문로 32 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로 32 1층',' ',1,2)-INSTR('서울특별시 종로구 자하문로 32 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울특별시 종로구 새문안로5길 31 센터포인트 광화문빌딩 2층','02-6020-0199','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5길 31 센터포인트 광화문빌딩 2층',INSTR('서울특별시 종로구 새문안로5길 31 센터포인트 광화문빌딩 2층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5길 31 센터포인트 광화문빌딩 2층',' ',1,2)-INSTR('서울특별시 종로구 새문안로5길 31 센터포인트 광화문빌딩 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울특별시 종로구 자하문로7길 9','02-6020-0200','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로7길 9',INSTR('서울특별시 종로구 자하문로7길 9', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로7길 9',' ',1,2)-INSTR('서울특별시 종로구 자하문로7길 9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울특별시 종로구 새문안로5가길 7 세종클럽 2층','02-6020-0201','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',' ',1,2)-INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울특별시 종로구 자하문로 17-1','02-6020-0202','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로 17-1',INSTR('서울특별시 종로구 자하문로 17-1', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로 17-1',' ',1,2)-INSTR('서울특별시 종로구 자하문로 17-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울특별시 종로구 사직로8길 21-1','02-6020-0203','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로8길 21-1',INSTR('서울특별시 종로구 사직로8길 21-1', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로8길 21-1',' ',1,2)-INSTR('서울특별시 종로구 사직로8길 21-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울특별시 종로구 사직로8길 19','02-6020-0204','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로8길 19',INSTR('서울특별시 종로구 사직로8길 19', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로8길 19',' ',1,2)-INSTR('서울특별시 종로구 사직로8길 19',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울특별시 종로구 사직로9길 22 102호','02-6020-0205','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로9길 22 102호',INSTR('서울특별시 종로구 사직로9길 22 102호', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로9길 22 102호',' ',1,2)-INSTR('서울특별시 종로구 사직로9길 22 102호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울특별시 종로구 자하문로5길 5','02-6020-0206','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로5길 5',INSTR('서울특별시 종로구 자하문로5길 5', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로5길 5',' ',1,2)-INSTR('서울특별시 종로구 자하문로5길 5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울특별시 종로구 자하문로1길 15 1층','02-6020-0207','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로1길 15 1층',INSTR('서울특별시 종로구 자하문로1길 15 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로1길 15 1층',' ',1,2)-INSTR('서울특별시 종로구 자하문로1길 15 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울특별시 종로구 새문안로 76 지하1층','02-6020-0208','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로 76 지하1층',INSTR('서울특별시 종로구 새문안로 76 지하1층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로 76 지하1층',' ',1,2)-INSTR('서울특별시 종로구 새문안로 76 지하1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'서울특별시 종로구 사직로8길 21 1층','02-6020-0209','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로8길 21 1층',INSTR('서울특별시 종로구 사직로8길 21 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로8길 21 1층',' ',1,2)-INSTR('서울특별시 종로구 사직로8길 21 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울특별시 종로구 자하문로4길 21-9','02-6020-0210','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로4길 21-9',INSTR('서울특별시 종로구 자하문로4길 21-9', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로4길 21-9',' ',1,2)-INSTR('서울특별시 종로구 자하문로4길 21-9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울특별시 종로구 새문안로5가길 7 세종클럽 지하 1층','02-6020-0211','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 지하 1층',INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 지하 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 지하 1층',' ',1,2)-INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 지하 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울특별시 종로구 세종대로23길 25','02-6020-0212','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 세종대로23길 25',INSTR('서울특별시 종로구 세종대로23길 25', ' ',1,1)+1, INSTR('서울특별시 종로구 세종대로23길 25',' ',1,2)-INSTR('서울특별시 종로구 세종대로23길 25',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울특별시 종로구 새문안로3길 23','02-6020-0213','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로3길 23',INSTR('서울특별시 종로구 새문안로3길 23', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로3길 23',' ',1,2)-INSTR('서울특별시 종로구 새문안로3길 23',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울특별시 종로구 새문안로5길 11','02-6020-0214','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5길 11',INSTR('서울특별시 종로구 새문안로5길 11', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5길 11',' ',1,2)-INSTR('서울특별시 종로구 새문안로5길 11',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울특별시 종로구 새문안로5길 19 로얄빌딩','02-6020-0215','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5길 19 로얄빌딩',INSTR('서울특별시 종로구 새문안로5길 19 로얄빌딩', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5길 19 로얄빌딩',' ',1,2)-INSTR('서울특별시 종로구 새문안로5길 19 로얄빌딩',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울특별시 종로구 사직로10길 3 1층','02-6020-0216','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로10길 3 1층',INSTR('서울특별시 종로구 사직로10길 3 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로10길 3 1층',' ',1,2)-INSTR('서울특별시 종로구 사직로10길 3 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울특별시 종로구 새문안로5가길 3-10 선덕빌딩 2층','02-6020-0217','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5가길 3-10 선덕빌딩 2층',INSTR('서울특별시 종로구 새문안로5가길 3-10 선덕빌딩 2층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5가길 3-10 선덕빌딩 2층',' ',1,2)-INSTR('서울특별시 종로구 새문안로5가길 3-10 선덕빌딩 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울특별시 종로구 자하문로1길 51 1층','02-6020-0218','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로1길 51 1층',INSTR('서울특별시 종로구 자하문로1길 51 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로1길 51 1층',' ',1,2)-INSTR('서울특별시 종로구 자하문로1길 51 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울특별시 종로구 경희궁2길 10','02-6020-0219','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 경희궁2길 10',INSTR('서울특별시 종로구 경희궁2길 10', ' ',1,1)+1, INSTR('서울특별시 종로구 경희궁2길 10',' ',1,2)-INSTR('서울특별시 종로구 경희궁2길 10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울특별시 종로구 사직로12길 1-5','02-6020-0220','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로12길 1-5',INSTR('서울특별시 종로구 사직로12길 1-5', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로12길 1-5',' ',1,2)-INSTR('서울특별시 종로구 사직로12길 1-5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울특별시 종로구 효자로7길 23 1층','02-6020-0221','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 효자로7길 23 1층',INSTR('서울특별시 종로구 효자로7길 23 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 효자로7길 23 1층',' ',1,2)-INSTR('서울특별시 종로구 효자로7길 23 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1010,'서울특별시 종로구 세종대로 175 세종문화회관 지하1층','02-6020-0222','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 세종대로 175 세종문화회관 지하1층',INSTR('서울특별시 종로구 세종대로 175 세종문화회관 지하1층', ' ',1,1)+1, INSTR('서울특별시 종로구 세종대로 175 세종문화회관 지하1층',' ',1,2)-INSTR('서울특별시 종로구 세종대로 175 세종문화회관 지하1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울특별시 종로구 새문안로9길 19-1 일선빌딩 1층','02-6020-0223','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로9길 19-1 일선빌딩 1층',INSTR('서울특별시 종로구 새문안로9길 19-1 일선빌딩 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로9길 19-1 일선빌딩 1층',' ',1,2)-INSTR('서울특별시 종로구 새문안로9길 19-1 일선빌딩 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울특별시 종로구 자하문로1나길 1','02-6020-0224','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로1나길 1',INSTR('서울특별시 종로구 자하문로1나길 1', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로1나길 1',' ',1,2)-INSTR('서울특별시 종로구 자하문로1나길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1011,'서울특별시 종로구 자하문로4길 7','02-6020-0225','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로4길 7',INSTR('서울특별시 종로구 자하문로4길 7', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로4길 7',' ',1,2)-INSTR('서울특별시 종로구 자하문로4길 7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울특별시 종로구 자하문로7길 27','02-6020-0226','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로7길 27',INSTR('서울특별시 종로구 자하문로7길 27', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로7길 27',' ',1,2)-INSTR('서울특별시 종로구 자하문로7길 27',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울특별시 종로구 자하문로7길 9','02-6020-0227','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로7길 9',INSTR('서울특별시 종로구 자하문로7길 9', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로7길 9',' ',1,2)-INSTR('서울특별시 종로구 자하문로7길 9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1012,'서울특별시 종로구 새문안로9길 29','02-6020-0228','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로9길 29',INSTR('서울특별시 종로구 새문안로9길 29', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로9길 29',' ',1,2)-INSTR('서울특별시 종로구 새문안로9길 29',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울특별시 종로구 새문안로5가길 7 세종클럽 2층','02-6020-0229','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',' ',1,2)-INSTR('서울특별시 종로구 새문안로5가길 7 세종클럽 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울특별시 종로구 사직로10길 7','02-6020-0230','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로10길 7',INSTR('서울특별시 종로구 사직로10길 7', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로10길 7',' ',1,2)-INSTR('서울특별시 종로구 사직로10길 7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1013,'서울특별시 종로구 경희궁1길 5 1층','02-6020-0231','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 경희궁1길 5 1층',INSTR('서울특별시 종로구 경희궁1길 5 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 경희궁1길 5 1층',' ',1,2)-INSTR('서울특별시 종로구 경희궁1길 5 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울특별시 종로구 새문안로3길 15 동원빌딩 3층','02-6020-0232','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로3길 15 동원빌딩 3층',INSTR('서울특별시 종로구 새문안로3길 15 동원빌딩 3층', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로3길 15 동원빌딩 3층',' ',1,2)-INSTR('서울특별시 종로구 새문안로3길 15 동원빌딩 3층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울특별시 종로구 세종대로 167 현대해상본사사옥','02-6020-0233','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 세종대로 167 현대해상본사사옥',INSTR('서울특별시 종로구 세종대로 167 현대해상본사사옥', ' ',1,1)+1, INSTR('서울특별시 종로구 세종대로 167 현대해상본사사옥',' ',1,2)-INSTR('서울특별시 종로구 세종대로 167 현대해상본사사옥',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1014,'서울특별시 종로구 필운대로1길 4','02-6020-0234','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 필운대로1길 4',INSTR('서울특별시 종로구 필운대로1길 4', ' ',1,1)+1, INSTR('서울특별시 종로구 필운대로1길 4',' ',1,2)-INSTR('서울특별시 종로구 필운대로1길 4',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울특별시 종로구 자하문로 17-1','02-6020-0235','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 자하문로 17-1',INSTR('서울특별시 종로구 자하문로 17-1', ' ',1,1)+1, INSTR('서울특별시 종로구 자하문로 17-1',' ',1,2)-INSTR('서울특별시 종로구 자하문로 17-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울특별시 종로구 새문안로9길 29-1','02-6020-0236','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 새문안로9길 29-1',INSTR('서울특별시 종로구 새문안로9길 29-1', ' ',1,1)+1, INSTR('서울특별시 종로구 새문안로9길 29-1',' ',1,2)-INSTR('서울특별시 종로구 새문안로9길 29-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울특별시 종로구 효자로 22','02-6020-0237','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 효자로 22',INSTR('서울특별시 종로구 효자로 22', ' ',1,1)+1, INSTR('서울특별시 종로구 효자로 22',' ',1,2)-INSTR('서울특별시 종로구 효자로 22',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울특별시 종로구 통일로 230 경희궁롯데캐슬상가','02-6020-0238','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬상가',INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬상가', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬상가',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬상가',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울특별시 종로구 통일로 262','02-6020-0239','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 262',INSTR('서울특별시 종로구 통일로 262', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 262',' ',1,2)-INSTR('서울특별시 종로구 통일로 262',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울특별시 종로구 통일로 230 경희궁롯데캐슬 1층 104호','02-6020-0240','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 1층 104호',INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 1층 104호', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 1층 104호',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 1층 104호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울특별시 종로구 통일로 230 경희궁롯데캐슬 상가 107호','02-6020-0241','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 상가 107호',INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 상가 107호', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 상가 107호',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬 상가 107호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울특별시 종로구 통일로 230','02-6020-0242','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230',INSTR('서울특별시 종로구 통일로 230', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230',' ',1,2)-INSTR('서울특별시 종로구 통일로 230',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울특별시 종로구 통일로 276','02-6020-0243','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 276',INSTR('서울특별시 종로구 통일로 276', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 276',' ',1,2)-INSTR('서울특별시 종로구 통일로 276',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울특별시 종로구 통일로14길 24','02-6020-0244','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 24',INSTR('서울특별시 종로구 통일로14길 24', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 24',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 24',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울특별시 종로구 통일로 230 경희궁 롯데캐슬 상가 118호','02-6020-0245','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 경희궁 롯데캐슬 상가 118호',INSTR('서울특별시 종로구 통일로 230 경희궁 롯데캐슬 상가 118호', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 경희궁 롯데캐슬 상가 118호',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 경희궁 롯데캐슬 상가 118호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울특별시 종로구 통일로14길 8','02-6020-0246','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 8',INSTR('서울특별시 종로구 통일로14길 8', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 8',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 8',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울특별시 종로구 통일로 266 102호','02-6020-0247','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 266 102호',INSTR('서울특별시 종로구 통일로 266 102호', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 266 102호',' ',1,2)-INSTR('서울특별시 종로구 통일로 266 102호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울특별시 종로구 통일로14길 24-2','02-6020-0248','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 24-2',INSTR('서울특별시 종로구 통일로14길 24-2', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 24-2',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 24-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울특별시 종로구 통일로 252','02-6020-0249','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 252',INSTR('서울특별시 종로구 통일로 252', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 252',' ',1,2)-INSTR('서울특별시 종로구 통일로 252',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울특별시 종로구 통일로 230 경희궁롯데캐슬아파트','02-6020-0250','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬아파트',INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬아파트', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬아파트',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 경희궁롯데캐슬아파트',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'서울특별시 종로구 통일로 250','02-6020-0251','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 250',INSTR('서울특별시 종로구 통일로 250', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 250',' ',1,2)-INSTR('서울특별시 종로구 통일로 250',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울특별시 종로구 통일로 246-10','02-6020-0252','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 246-10',INSTR('서울특별시 종로구 통일로 246-10', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 246-10',' ',1,2)-INSTR('서울특별시 종로구 통일로 246-10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울특별시 종로구 통일로 246-10 무악현대상가 ','02-6020-0253','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 246-10 무악현대상가 ',INSTR('서울특별시 종로구 통일로 246-10 무악현대상가 ', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 246-10 무악현대상가 ',' ',1,2)-INSTR('서울특별시 종로구 통일로 246-10 무악현대상가 ',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울특별시 종로구 통일로14길 5','02-6020-0254','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 5',INSTR('서울특별시 종로구 통일로14길 5', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 5',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울특별시 종로구 통일로14길 6','02-6020-0255','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 6',INSTR('서울특별시 종로구 통일로14길 6', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 6',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울특별시 종로구 통일로 246-10 무악현대아파트 ','02-6020-0256','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 246-10 무악현대아파트 ',INSTR('서울특별시 종로구 통일로 246-10 무악현대아파트 ', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 246-10 무악현대아파트 ',' ',1,2)-INSTR('서울특별시 종로구 통일로 246-10 무악현대아파트 ',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울특별시 종로구 통일로14길 6','02-6020-0257','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 6',INSTR('서울특별시 종로구 통일로14길 6', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 6',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울특별시 종로구 통일로14길 10','02-6020-0258','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 10',INSTR('서울특별시 종로구 통일로14길 10', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 10',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울특별시 종로구 통일로16길 2','02-6020-0259','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로16길 2',INSTR('서울특별시 종로구 통일로16길 2', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로16길 2',' ',1,2)-INSTR('서울특별시 종로구 통일로16길 2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울특별시 종로구 통일로 266','02-6020-0260','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 266',INSTR('서울특별시 종로구 통일로 266', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 266',' ',1,2)-INSTR('서울특별시 종로구 통일로 266',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울특별시 종로구 통일로 230 상가 1층 105호','02-6020-0261','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 230 상가 1층 105호',INSTR('서울특별시 종로구 통일로 230 상가 1층 105호', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 230 상가 1층 105호',' ',1,2)-INSTR('서울특별시 종로구 통일로 230 상가 1층 105호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울특별시 종로구 통일로 246-1','02-6020-0262','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 246-1',INSTR('서울특별시 종로구 통일로 246-1', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 246-1',' ',1,2)-INSTR('서울특별시 종로구 통일로 246-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울특별시 종로구 통일로14길 6','02-6020-0263','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로14길 6',INSTR('서울특별시 종로구 통일로14길 6', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로14길 6',' ',1,2)-INSTR('서울특별시 종로구 통일로14길 6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1010,'서울특별시 종로구 사직로 5 1층','02-6020-0264','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로 5 1층',INSTR('서울특별시 종로구 사직로 5 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로 5 1층',' ',1,2)-INSTR('서울특별시 종로구 사직로 5 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울특별시 종로구 통일로12길 10-18 1층','02-6020-0265','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로12길 10-18 1층',INSTR('서울특별시 종로구 통일로12길 10-18 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로12길 10-18 1층',' ',1,2)-INSTR('서울특별시 종로구 통일로12길 10-18 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울특별시 종로구 통일로12길 8','02-6020-0266','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로12길 8',INSTR('서울특별시 종로구 통일로12길 8', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로12길 8',' ',1,2)-INSTR('서울특별시 종로구 통일로12길 8',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1011,'서울특별시 종로구 통일로12길 6','02-6020-0267','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로12길 6',INSTR('서울특별시 종로구 통일로12길 6', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로12길 6',' ',1,2)-INSTR('서울특별시 종로구 통일로12길 6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울특별시 종로구 통일로 224','02-6020-0268','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 224',INSTR('서울특별시 종로구 통일로 224', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 224',' ',1,2)-INSTR('서울특별시 종로구 통일로 224',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울특별시 종로구 통일로12길 10-10','02-6020-0269','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로12길 10-10',INSTR('서울특별시 종로구 통일로12길 10-10', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로12길 10-10',' ',1,2)-INSTR('서울특별시 종로구 통일로12길 10-10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1012,'서울특별시 종로구 사직로1길 57 1층','02-6020-0270','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로1길 57 1층',INSTR('서울특별시 종로구 사직로1길 57 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로1길 57 1층',' ',1,2)-INSTR('서울특별시 종로구 사직로1길 57 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울특별시 종로구 통일로 220','02-6020-0271','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 220',INSTR('서울특별시 종로구 통일로 220', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 220',' ',1,2)-INSTR('서울특별시 종로구 통일로 220',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울특별시 종로구 통일로12길 10-16 1층','02-6020-0272','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로12길 10-16 1층',INSTR('서울특별시 종로구 통일로12길 10-16 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로12길 10-16 1층',' ',1,2)-INSTR('서울특별시 종로구 통일로12길 10-16 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1013,'서울특별시 종로구 사직로2길 14','02-6020-0273','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로2길 14',INSTR('서울특별시 종로구 사직로2길 14', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로2길 14',' ',1,2)-INSTR('서울특별시 종로구 사직로2길 14',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울특별시 종로구 통일로 222 1층','02-6020-0274','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 222 1층',INSTR('서울특별시 종로구 통일로 222 1층', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 222 1층',' ',1,2)-INSTR('서울특별시 종로구 통일로 222 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울특별시 종로구 사직로 11 1층 103호','02-6020-0275','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로 11 1층 103호',INSTR('서울특별시 종로구 사직로 11 1층 103호', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로 11 1층 103호',' ',1,2)-INSTR('서울특별시 종로구 사직로 11 1층 103호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1014,'서울특별시 종로구 인왕산로1길 70','02-6020-0276','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 인왕산로1길 70',INSTR('서울특별시 종로구 인왕산로1길 70', ' ',1,1)+1, INSTR('서울특별시 종로구 인왕산로1길 70',' ',1,2)-INSTR('서울특별시 종로구 인왕산로1길 70',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울특별시 종로구 송월길 155 경희궁자이 ','02-6020-0277','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 송월길 155 경희궁자이 ',INSTR('서울특별시 종로구 송월길 155 경희궁자이 ', ' ',1,1)+1, INSTR('서울특별시 종로구 송월길 155 경희궁자이 ',' ',1,2)-INSTR('서울특별시 종로구 송월길 155 경희궁자이 ',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울특별시 종로구 사직로 11','02-6020-0278','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 사직로 11',INSTR('서울특별시 종로구 사직로 11', ' ',1,1)+1, INSTR('서울특별시 종로구 사직로 11',' ',1,2)-INSTR('서울특별시 종로구 사직로 11',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울특별시 종로구 통일로 223','02-6020-0279','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 통일로 223',INSTR('서울특별시 종로구 통일로 223', ' ',1,1)+1, INSTR('서울특별시 종로구 통일로 223',' ',1,2)-INSTR('서울특별시 종로구 통일로 223',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울 영등포구 국회대로76길 10 ','02-6020-0280','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 국회대로76길 10 ',INSTR('서울 영등포구 국회대로76길 10 ', ' ',1,1)+1, INSTR('서울 영등포구 국회대로76길 10 ',' ',1,2)-INSTR('서울 영등포구 국회대로76길 10 ',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울 영등포구 국제금융로6길 33','02-6020-0281','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 국제금융로6길 33',INSTR('서울 영등포구 국제금융로6길 33', ' ',1,1)+1, INSTR('서울 영등포구 국제금융로6길 33',' ',1,2)-INSTR('서울 영등포구 국제금융로6길 33',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울 영등포구 영등포로51길','02-6020-0282','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 영등포로51길',INSTR('서울 영등포구 영등포로51길', ' ',1,1)+1, INSTR('서울 영등포구 영등포로51길',' ',1,2)-INSTR('서울 영등포구 영등포로51길',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울 영등포구 문래로 203','02-6020-0283','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 문래로 203',INSTR('서울 영등포구 문래로 203', ' ',1,1)+1, INSTR('서울 영등포구 문래로 203',' ',1,2)-INSTR('서울 영등포구 문래로 203',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울 영등포구 경인로 870 2층','02-6020-0284','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 경인로 870 2층',INSTR('서울 영등포구 경인로 870 2층', ' ',1,1)+1, INSTR('서울 영등포구 경인로 870 2층',' ',1,2)-INSTR('서울 영등포구 경인로 870 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울 영등포구 당산로37길 1 2층','02-6020-0285','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 당산로37길 1 2층',INSTR('서울 영등포구 당산로37길 1 2층', ' ',1,1)+1, INSTR('서울 영등포구 당산로37길 1 2층',' ',1,2)-INSTR('서울 영등포구 당산로37길 1 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울 영등포구 도림로139길 13 1층','02-6020-0286','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도림로139길 13 1층',INSTR('서울 영등포구 도림로139길 13 1층', ' ',1,1)+1, INSTR('서울 영등포구 도림로139길 13 1층',' ',1,2)-INSTR('서울 영등포구 도림로139길 13 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울 영등포구 도림로 469-1','02-6020-0287','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도림로 469-1',INSTR('서울 영등포구 도림로 469-1', ' ',1,1)+1, INSTR('서울 영등포구 도림로 469-1',' ',1,2)-INSTR('서울 영등포구 도림로 469-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울 영등포구 여의대방로53길 30','02-6020-0288','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로53길 30',INSTR('서울 영등포구 여의대방로53길 30', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로53길 30',' ',1,2)-INSTR('서울 영등포구 여의대방로53길 30',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울 영등포구 신길로 108','02-6020-0289','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신길로 108',INSTR('서울 영등포구 신길로 108', ' ',1,1)+1, INSTR('서울 영등포구 신길로 108',' ',1,2)-INSTR('서울 영등포구 신길로 108',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울 영등포구 영등포로 410','02-6020-0290','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 영등포로 410',INSTR('서울 영등포구 영등포로 410', ' ',1,1)+1, INSTR('서울 영등포구 영등포로 410',' ',1,2)-INSTR('서울 영등포구 영등포로 410',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울 영등포구 가마산로 575 한성상가','02-6020-0291','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로 575 한성상가',INSTR('서울 영등포구 가마산로 575 한성상가', ' ',1,1)+1, INSTR('서울 영등포구 가마산로 575 한성상가',' ',1,2)-INSTR('서울 영등포구 가마산로 575 한성상가',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울 영등포구 신풍로25길 6 1층','02-6020-0292','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신풍로25길 6 1층',INSTR('서울 영등포구 신풍로25길 6 1층', ' ',1,1)+1, INSTR('서울 영등포구 신풍로25길 6 1층',' ',1,2)-INSTR('서울 영등포구 신풍로25길 6 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'서울 영등포구 여의대방로 137','02-6020-0293','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로 137',INSTR('서울 영등포구 여의대방로 137', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로 137',' ',1,2)-INSTR('서울 영등포구 여의대방로 137',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울 영등포구 신길로39길 1','02-6020-0294','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신길로39길 1',INSTR('서울 영등포구 신길로39길 1', ' ',1,1)+1, INSTR('서울 영등포구 신길로39길 1',' ',1,2)-INSTR('서울 영등포구 신길로39길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울 영등포구 가마산로89길 19','02-6020-0295','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로89길 19',INSTR('서울 영등포구 가마산로89길 19', ' ',1,1)+1, INSTR('서울 영등포구 가마산로89길 19',' ',1,2)-INSTR('서울 영등포구 가마산로89길 19',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울 영등포구 여의대방로 137','02-6020-0296','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로 137',INSTR('서울 영등포구 여의대방로 137', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로 137',' ',1,2)-INSTR('서울 영등포구 여의대방로 137',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울 영등포구 신길동 95-254','02-6020-0297','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신길동 95-254',INSTR('서울 영등포구 신길동 95-254', ' ',1,1)+1, INSTR('서울 영등포구 신길동 95-254',' ',1,2)-INSTR('서울 영등포구 신길동 95-254',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울 영등포구 도신로60길 15-2','02-6020-0298','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도신로60길 15-2',INSTR('서울 영등포구 도신로60길 15-2', ' ',1,1)+1, INSTR('서울 영등포구 도신로60길 15-2',' ',1,2)-INSTR('서울 영등포구 도신로60길 15-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울 영등포구 대림로8길 39','02-6020-0299','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 대림로8길 39',INSTR('서울 영등포구 대림로8길 39', ' ',1,1)+1, INSTR('서울 영등포구 대림로8길 39',' ',1,2)-INSTR('서울 영등포구 대림로8길 39',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울 영등포구 대림로 179','02-6020-0300','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 대림로 179',INSTR('서울 영등포구 대림로 179', ' ',1,1)+1, INSTR('서울 영등포구 대림로 179',' ',1,2)-INSTR('서울 영등포구 대림로 179',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울 영등포구 도림로 439-1','02-6020-0301','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도림로 439-1',INSTR('서울 영등포구 도림로 439-1', ' ',1,1)+1, INSTR('서울 영등포구 도림로 439-1',' ',1,2)-INSTR('서울 영등포구 도림로 439-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울 영등포구 경인로 846','02-6020-0302','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 경인로 846',INSTR('서울 영등포구 경인로 846', ' ',1,1)+1, INSTR('서울 영등포구 경인로 846',' ',1,2)-INSTR('서울 영등포구 경인로 846',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울 관악구 조원로 133 1층','02-6020-0303','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 관악구 조원로 133 1층',INSTR('서울 관악구 조원로 133 1층', ' ',1,1)+1, INSTR('서울 관악구 조원로 133 1층',' ',1,2)-INSTR('서울 관악구 조원로 133 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울 영등포구 여의대방로43길 6','02-6020-0304','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로43길 6',INSTR('서울 영등포구 여의대방로43길 6', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로43길 6',' ',1,2)-INSTR('서울 영등포구 여의대방로43길 6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울 영등포구 가마산로61길 9-1 102호','02-6020-0305','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로61길 9-1 102호',INSTR('서울 영등포구 가마산로61길 9-1 102호', ' ',1,1)+1, INSTR('서울 영등포구 가마산로61길 9-1 102호',' ',1,2)-INSTR('서울 영등포구 가마산로61길 9-1 102호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1010,'서울 영등포구 신풍로 77','02-6020-0306','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신풍로 77',INSTR('서울 영등포구 신풍로 77', ' ',1,1)+1, INSTR('서울 영등포구 신풍로 77',' ',1,2)-INSTR('서울 영등포구 신풍로 77',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울 영등포구 가마산로 501','02-6020-0307','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로 501',INSTR('서울 영등포구 가마산로 501', ' ',1,1)+1, INSTR('서울 영등포구 가마산로 501',' ',1,2)-INSTR('서울 영등포구 가마산로 501',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울 영등포구 가마산로 517','02-6020-0308','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로 517',INSTR('서울 영등포구 가마산로 517', ' ',1,1)+1, INSTR('서울 영등포구 가마산로 517',' ',1,2)-INSTR('서울 영등포구 가마산로 517',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1011,'서울 영등포구 신풍로19가길 2','02-6020-0309','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신풍로19가길 2',INSTR('서울 영등포구 신풍로19가길 2', ' ',1,1)+1, INSTR('서울 영등포구 신풍로19가길 2',' ',1,2)-INSTR('서울 영등포구 신풍로19가길 2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울 영등포구 가마산로 505','02-6020-0310','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 가마산로 505',INSTR('서울 영등포구 가마산로 505', ' ',1,1)+1, INSTR('서울 영등포구 가마산로 505',' ',1,2)-INSTR('서울 영등포구 가마산로 505',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울 영등포구 도신로 166','02-6020-0311','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도신로 166',INSTR('서울 영등포구 도신로 166', ' ',1,1)+1, INSTR('서울 영등포구 도신로 166',' ',1,2)-INSTR('서울 영등포구 도신로 166',' ',1,1)-1)= middlearea.city));

INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1012,'서울 영등포구 신길로42길 15','02-6020-0312','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 신길로42길 15',INSTR('서울 영등포구 신길로42길 15', ' ',1,1)+1, INSTR('서울 영등포구 신길로42길 15',' ',1,2)-INSTR('서울 영등포구 신길로42길 15',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울 영등포구 영등포로 347','02-6020-0313','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 영등포로 347',INSTR('서울 영등포구 영등포로 347', ' ',1,1)+1, INSTR('서울 영등포구 영등포로 347',' ',1,2)-INSTR('서울 영등포구 영등포로 347',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울 영등포구 대방천로 260','02-6020-0314','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 대방천로 260',INSTR('서울 영등포구 대방천로 260', ' ',1,1)+1, INSTR('서울 영등포구 대방천로 260',' ',1,2)-INSTR('서울 영등포구 대방천로 260',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1013,'서울 영등포구 도신로49길 3','02-6020-0315','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도신로49길 3',INSTR('서울 영등포구 도신로49길 3', ' ',1,1)+1, INSTR('서울 영등포구 도신로49길 3',' ',1,2)-INSTR('서울 영등포구 도신로49길 3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울 영등포구 도신로60길 12','02-6020-0316','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 도신로60길 12',INSTR('서울 영등포구 도신로60길 12', ' ',1,1)+1, INSTR('서울 영등포구 도신로60길 12',' ',1,2)-INSTR('서울 영등포구 도신로60길 12',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울 영등포구 영등포로 377','02-6020-0317','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 영등포로 377',INSTR('서울 영등포구 영등포로 377', ' ',1,1)+1, INSTR('서울 영등포구 영등포로 377',' ',1,2)-INSTR('서울 영등포구 영등포로 377',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1014,'서울 영등포구 대방천로 256','02-6020-0318','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 대방천로 256',INSTR('서울 영등포구 대방천로 256', ' ',1,1)+1, INSTR('서울 영등포구 대방천로 256',' ',1,2)-INSTR('서울 영등포구 대방천로 256',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울 영등포구 영등포로62길 2','02-6020-0319','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 영등포로62길 2',INSTR('서울 영등포구 영등포로62길 2', ' ',1,1)+1, INSTR('서울 영등포구 영등포로62길 2',' ',1,2)-INSTR('서울 영등포구 영등포로62길 2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울 영등포구 여의대방로7길 13','02-6020-0320','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로7길 13',INSTR('서울 영등포구 여의대방로7길 13', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로7길 13',' ',1,2)-INSTR('서울 영등포구 여의대방로7길 13',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울 영등포구 여의대방로29길 9','02-6020-0321','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울 영등포구 여의대방로29길 9',INSTR('서울 영등포구 여의대방로29길 9', ' ',1,1)+1, INSTR('서울 영등포구 여의대방로29길 9',' ',1,2)-INSTR('서울 영등포구 여의대방로29길 9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울특별시 중구 북창동 14-5','02-6020-0322','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 북창동 14-5',INSTR('서울특별시 중구 북창동 14-5', ' ',1,1)+1, INSTR('서울특별시 중구 북창동 14-5',' ',1,2)-INSTR('서울특별시 중구 북창동 14-5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울특별시 중구 순화동 151','02-6020-0323','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 순화동 151',INSTR('서울특별시 중구 순화동 151', ' ',1,1)+1, INSTR('서울특별시 중구 순화동 151',' ',1,2)-INSTR('서울특별시 중구 순화동 151',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울특별시 중구 서소문동 57-1','02-6020-0324','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 서소문동 57-1',INSTR('서울특별시 중구 서소문동 57-1', ' ',1,1)+1, INSTR('서울특별시 중구 서소문동 57-1',' ',1,2)-INSTR('서울특별시 중구 서소문동 57-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울특별시 중구 남대문로5가 177','02-6020-0325','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로5가 177',INSTR('서울특별시 중구 남대문로5가 177', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로5가 177',' ',1,2)-INSTR('서울특별시 중구 남대문로5가 177',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울특별시 중구 태평로1가','02-6020-0326','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 태평로1가',INSTR('서울특별시 중구 태평로1가', ' ',1,1)+1, INSTR('서울특별시 중구 태평로1가',' ',1,2)-INSTR('서울특별시 중구 태평로1가',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울특별시 중구 소공동 63','02-6020-0327','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공동 63',INSTR('서울특별시 중구 소공동 63', ' ',1,1)+1, INSTR('서울특별시 중구 소공동 63',' ',1,2)-INSTR('서울특별시 중구 소공동 63',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울특별시 중구 소공로 106','02-6020-0328','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공로 106',INSTR('서울특별시 중구 소공로 106', ' ',1,1)+1, INSTR('서울특별시 중구 소공로 106',' ',1,2)-INSTR('서울특별시 중구 소공로 106',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울특별시 중구 세종대로14길 6-2','02-6020-0329','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 세종대로14길 6-2',INSTR('서울특별시 중구 세종대로14길 6-2', ' ',1,1)+1, INSTR('서울특별시 중구 세종대로14길 6-2',' ',1,2)-INSTR('서울특별시 중구 세종대로14길 6-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울특별시 중구 북창동 11-2','02-6020-0330','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 북창동 11-2',INSTR('서울특별시 중구 북창동 11-2', ' ',1,1)+1, INSTR('서울특별시 중구 북창동 11-2',' ',1,2)-INSTR('서울특별시 중구 북창동 11-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울특별시 중구 남대문시장길 73-3','02-6020-0331','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문시장길 73-3',INSTR('서울특별시 중구 남대문시장길 73-3', ' ',1,1)+1, INSTR('서울특별시 중구 남대문시장길 73-3',' ',1,2)-INSTR('서울특별시 중구 남대문시장길 73-3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울특별시 종로구 신문로2가 12-5','02-6020-0332','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 종로구 신문로2가 12-5',INSTR('서울특별시 종로구 신문로2가 12-5', ' ',1,1)+1, INSTR('서울특별시 종로구 신문로2가 12-5',' ',1,2)-INSTR('서울특별시 종로구 신문로2가 12-5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울특별시 중구 덕수궁길 7','02-6020-0333','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 덕수궁길 7',INSTR('서울특별시 중구 덕수궁길 7', ' ',1,1)+1, INSTR('서울특별시 중구 덕수궁길 7',' ',1,2)-INSTR('서울특별시 중구 덕수궁길 7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울특별시 중구 퇴계로 42-2 2층','02-6020-0334','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 퇴계로 42-2 2층',INSTR('서울특별시 중구 퇴계로 42-2 2층', ' ',1,1)+1, INSTR('서울특별시 중구 퇴계로 42-2 2층',' ',1,2)-INSTR('서울특별시 중구 퇴계로 42-2 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'서울특별시 중구 퇴계로 67 레스케이프 호텔 6F','02-6020-0335','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 퇴계로 67 레스케이프 호텔 6F',INSTR('서울특별시 중구 퇴계로 67 레스케이프 호텔 6F', ' ',1,1)+1, INSTR('서울특별시 중구 퇴계로 67 레스케이프 호텔 6F',' ',1,2)-INSTR('서울특별시 중구 퇴계로 67 레스케이프 호텔 6F',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울특별시 중구 회현동1가 100-123 번지 하 1층','02-6020-0336','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 회현동1가 100-123 번지 하 1층',INSTR('서울특별시 중구 회현동1가 100-123 번지 하 1층', ' ',1,1)+1, INSTR('서울특별시 중구 회현동1가 100-123 번지 하 1층',' ',1,2)-INSTR('서울특별시 중구 회현동1가 100-123 번지 하 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울특별시 중구 소공동 소공로 96','02-6020-0337','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공동 소공로 96',INSTR('서울특별시 중구 소공동 소공로 96', ' ',1,1)+1, INSTR('서울특별시 중구 소공동 소공로 96',' ',1,2)-INSTR('서울특별시 중구 소공동 소공로 96',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울특별시 중구 남대문로4가 71-1','02-6020-0338','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로4가 71-1',INSTR('서울특별시 중구 남대문로4가 71-1', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로4가 71-1',' ',1,2)-INSTR('서울특별시 중구 남대문로4가 71-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울특별시 중구 유원빌딩 1706호','02-6020-0339','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 유원빌딩 1706호',INSTR('서울특별시 중구 유원빌딩 1706호', ' ',1,1)+1, INSTR('서울특별시 중구 유원빌딩 1706호',' ',1,2)-INSTR('서울특별시 중구 유원빌딩 1706호',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울특별시 중구 소공동 소공로 112','02-6020-0340','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공동 소공로 112',INSTR('서울특별시 중구 소공동 소공로 112', ' ',1,1)+1, INSTR('서울특별시 중구 소공동 소공로 112',' ',1,2)-INSTR('서울특별시 중구 소공동 소공로 112',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울특별시 중구 남대문로7길 16','02-6020-0341','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로7길 16',INSTR('서울특별시 중구 남대문로7길 16', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로7길 16',' ',1,2)-INSTR('서울특별시 중구 남대문로7길 16',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울특별시 중구 남대문로4가 45번지 1층','02-6020-0342','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로4가 45번지 1층',INSTR('서울특별시 중구 남대문로4가 45번지 1층', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로4가 45번지 1층',' ',1,2)-INSTR('서울특별시 중구 남대문로4가 45번지 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울특별시 중구 덕수궁길 5','02-6020-0343','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 덕수궁길 5',INSTR('서울특별시 중구 덕수궁길 5', ' ',1,1)+1, INSTR('서울특별시 중구 덕수궁길 5',' ',1,2)-INSTR('서울특별시 중구 덕수궁길 5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울특별시 중구 충무로1가 1','02-6020-0344','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 충무로1가 1',INSTR('서울특별시 중구 충무로1가 1', ' ',1,1)+1, INSTR('서울특별시 중구 충무로1가 1',' ',1,2)-INSTR('서울특별시 중구 충무로1가 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울특별시 중구 중림동 청파로 464','02-6020-0345','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 중림동 청파로 464',INSTR('서울특별시 중구 중림동 청파로 464', ' ',1,1)+1, INSTR('서울특별시 중구 중림동 청파로 464',' ',1,2)-INSTR('서울특별시 중구 중림동 청파로 464',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울특별시 중구 소공동 세종대로 82','02-6020-0346','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공동 세종대로 82',INSTR('서울특별시 중구 소공동 세종대로 82', ' ',1,1)+1, INSTR('서울특별시 중구 소공동 세종대로 82',' ',1,2)-INSTR('서울특별시 중구 소공동 세종대로 82',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울특별시 중구 충무로2가 7-1','02-6020-0347','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 충무로2가 7-1',INSTR('서울특별시 중구 충무로2가 7-1', ' ',1,1)+1, INSTR('서울특별시 중구 충무로2가 7-1',' ',1,2)-INSTR('서울특별시 중구 충무로2가 7-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1009,'서울특별시 중구 퇴계로 18','02-6020-0348','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 퇴계로 18',INSTR('서울특별시 중구 퇴계로 18', ' ',1,1)+1, INSTR('서울특별시 중구 퇴계로 18',' ',1,2)-INSTR('서울특별시 중구 퇴계로 18',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울특별시 중구 남대문로5가 21-2','02-6020-0349','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로5가 21-2',INSTR('서울특별시 중구 남대문로5가 21-2', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로5가 21-2',' ',1,2)-INSTR('서울특별시 중구 남대문로5가 21-2',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울특별시 중구 세종대로2길 6-1','02-6020-0350','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 세종대로2길 6-1',INSTR('서울특별시 중구 세종대로2길 6-1', ' ',1,1)+1, INSTR('서울특별시 중구 세종대로2길 6-1',' ',1,2)-INSTR('서울특별시 중구 세종대로2길 6-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1010,'서울특별시 중구 서소문동 134-6','02-6020-0351','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 서소문동 134-6',INSTR('서울특별시 중구 서소문동 134-6', ' ',1,1)+1, INSTR('서울특별시 중구 서소문동 134-6',' ',1,2)-INSTR('서울특별시 중구 서소문동 134-6',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울특별시 중구 남대문로4가 남대문로 2-3','02-6020-0352','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 남대문로4가 남대문로 2-3',INSTR('서울특별시 중구 남대문로4가 남대문로 2-3', ' ',1,1)+1, INSTR('서울특별시 중구 남대문로4가 남대문로 2-3',' ',1,2)-INSTR('서울특별시 중구 남대문로4가 남대문로 2-3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울특별시 중구 을지로 30 롯데백화점 본점 지하 1층','02-6020-0353','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 을지로 30 롯데백화점 본점 지하 1층',INSTR('서울특별시 중구 을지로 30 롯데백화점 본점 지하 1층', ' ',1,1)+1, INSTR('서울특별시 중구 을지로 30 롯데백화점 본점 지하 1층',' ',1,2)-INSTR('서울특별시 중구 을지로 30 롯데백화점 본점 지하 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1011,'서울특별시 중구 태평로2가 333','02-6020-0354','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 태평로2가 333',INSTR('서울특별시 중구 태평로2가 333', ' ',1,1)+1, INSTR('서울특별시 중구 태평로2가 333',' ',1,2)-INSTR('서울특별시 중구 태평로2가 333',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울특별시 중구 무교로 12','02-6020-0355','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 무교로 12',INSTR('서울특별시 중구 무교로 12', ' ',1,1)+1, INSTR('서울특별시 중구 무교로 12',' ',1,2)-INSTR('서울특별시 중구 무교로 12',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울특별시 중구 명동2가','02-6020-0356','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 명동2가',INSTR('서울특별시 중구 명동2가', ' ',1,1)+1, INSTR('서울특별시 중구 명동2가',' ',1,2)-INSTR('서울특별시 중구 명동2가',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1012,'서울특별시 중구 퇴계로 116-1','02-6020-0357','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 퇴계로 116-1',INSTR('서울특별시 중구 퇴계로 116-1', ' ',1,1)+1, INSTR('서울특별시 중구 퇴계로 116-1',' ',1,2)-INSTR('서울특별시 중구 퇴계로 116-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울특별시 중구 서소문로11길 2-1','02-6020-0358','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 서소문로11길 2-1',INSTR('서울특별시 중구 서소문로11길 2-1', ' ',1,1)+1, INSTR('서울특별시 중구 서소문로11길 2-1',' ',1,2)-INSTR('서울특별시 중구 서소문로11길 2-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울특별시 중구 소공동 남대문로 81','02-6020-0359','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 소공동 남대문로 81',INSTR('서울특별시 중구 소공동 남대문로 81', ' ',1,1)+1, INSTR('서울특별시 중구 소공동 남대문로 81',' ',1,2)-INSTR('서울특별시 중구 소공동 남대문로 81',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1013,'서울특별시 중구 세종대로 76','02-6020-0360','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 세종대로 76',INSTR('서울특별시 중구 세종대로 76', ' ',1,1)+1, INSTR('서울특별시 중구 세종대로 76',' ',1,2)-INSTR('서울특별시 중구 세종대로 76',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울특별시 중구 세종대로14길 22-3','02-6020-0361','10:00','21:00', (
SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 세종대로14길 22-3',INSTR('서울특별시 중구 세종대로14길 22-3', ' ',1,1)+1, INSTR('서울특별시 중구 세종대로14길 22-3',' ',1,2)-INSTR('서울특별시 중구 세종대로14길 22-3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울특별시 중구 북창동 세종대로14길 28-3','02-6020-0362','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 북창동 세종대로14길 28-3',INSTR('서울특별시 중구 북창동 세종대로14길 28-3', ' ',1,1)+1, INSTR('서울특별시 중구 북창동 세종대로14길 28-3',' ',1,2)-INSTR('서울특별시 중구 북창동 세종대로14길 28-3',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울특별시 중구 정동 11-5','02-6020-0363','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 중구 정동 11-5',INSTR('서울특별시 중구 정동 11-5', ' ',1,1)+1, INSTR('서울특별시 중구 정동 11-5',' ',1,2)-INSTR('서울특별시 중구 정동 11-5',' ',1,1)-1)= middlearea.city));


INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 일식집',1001,'서울특별시 용산구 후암로48길 1','02-6020-0364','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암로48길 1',INSTR('서울특별시 용산구 후암로48길 1', ' ',1,1)+1, INSTR('서울특별시 용산구 후암로48길 1',' ',1,2)-INSTR('서울특별시 용산구 후암로48길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 일식집',1001,'서울특별시 용산구 후암로 8-1 1층','02-6020-0365','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암로 8-1 1층',INSTR('서울특별시 용산구 후암로 8-1 1층', ' ',1,1)+1, INSTR('서울특별시 용산구 후암로 8-1 1층',' ',1,2)-INSTR('서울특별시 용산구 후암로 8-1 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 일식집',1001,'서울특별시 용산구 후암로 66-1','02-6020-0366','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암로 66-1',INSTR('서울특별시 용산구 후암로 66-1', ' ',1,1)+1, INSTR('서울특별시 용산구 후암로 66-1',' ',1,2)-INSTR('서울특별시 용산구 후암로 66-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 중식',1002,'서울특별시 용산구 후암로 31','02-6020-0367','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암로 31',INSTR('서울특별시 용산구 후암로 31', ' ',1,1)+1, INSTR('서울특별시 용산구 후암로 31',' ',1,2)-INSTR('서울특별시 용산구 후암로 31',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 중식',1002,'서울특별시 용산구 후암동 458','02-6020-0368','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 458',INSTR('서울특별시 용산구 후암동 458', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 458',' ',1,2)-INSTR('서울특별시 용산구 후암동 458',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 중식',1002,'서울특별시 용산구 후암동 65-1','02-6020-0369','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 65-1',INSTR('서울특별시 용산구 후암동 65-1', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 65-1',' ',1,2)-INSTR('서울특별시 용산구 후암동 65-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 치킨',1003,'서울특별시 용산구 소월로2길 7','02-6020-0370','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로2길 7',INSTR('서울특별시 용산구 소월로2길 7', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로2길 7',' ',1,2)-INSTR('서울특별시 용산구 소월로2길 7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 치킨',1003,'서울특별시 용산구 후암동 105-165','02-6020-0371','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 105-165',INSTR('서울특별시 용산구 후암동 105-165', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 105-165',' ',1,2)-INSTR('서울특별시 용산구 후암동 105-165',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 치킨',1003,'서울특별시 용산구 후암동 103-10번지 2층','02-6020-0372','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 103-10번지 2층',INSTR('서울특별시 용산구 후암동 103-10번지 2층', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 103-10번지 2층',' ',1,2)-INSTR('서울특별시 용산구 후암동 103-10번지 2층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 백반',1004,'서울특별시 용산구 후암동 103-11','02-6020-0373','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 103-11',INSTR('서울특별시 용산구 후암동 103-11', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 103-11',' ',1,2)-INSTR('서울특별시 용산구 후암동 103-11',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 백반',1004,'서울특별시 용산구 후암동 후암로28길 10','02-6020-0374','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 후암로28길 10',INSTR('서울특별시 용산구 후암동 후암로28길 10', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 후암로28길 10',' ',1,2)-INSTR('서울특별시 용산구 후암동 후암로28길 10',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 백반',1004,'서울특별시 용산구 한강대로104길60','02-6020-0375','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 한강대로104길60',INSTR('서울특별시 용산구 한강대로104길60', ' ',1,1)+1, INSTR('서울특별시 용산구 한강대로104길60',' ',1,2)-INSTR('서울특별시 용산구 한강대로104길60',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 카페',1005,'서울특별시 용산구 후암동 439','02-6020-0376','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 439',INSTR('서울특별시 용산구 후암동 439', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 439',' ',1,2)-INSTR('서울특별시 용산구 후암동 439',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 카페',1005,'t서울특별시 용산구 후암동 244-72번지 1층','02-6020-0377','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('t서울특별시 용산구 후암동 244-72번지 1층',INSTR('t서울특별시 용산구 후암동 244-72번지 1층', ' ',1,1)+1, INSTR('t서울특별시 용산구 후암동 244-72번지 1층',' ',1,2)-INSTR('t서울특별시 용산구 후암동 244-72번지 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 카페',1005,'서울특별시 용산구 후암동 후암로 42-1','02-6020-0378','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 후암로 42-1',INSTR('서울특별시 용산구 후암동 후암로 42-1', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 후암로 42-1',' ',1,2)-INSTR('서울특별시 용산구 후암동 후암로 42-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 분식',1006,'서울특별시 용산구 후암동 후암로28길 7','02-6020-0379','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 후암로28길 7',INSTR('서울특별시 용산구 후암동 후암로28길 7', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 후암로28길 7',' ',1,2)-INSTR('서울특별시 용산구 후암동 후암로28길 7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 분식',1006,'서울특별시 용산구 후암동 254-35','02-6020-0380','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 254-35',INSTR('서울특별시 용산구 후암동 254-35', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 254-35',' ',1,2)-INSTR('서울특별시 용산구 후암동 254-35',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 분식',1006,'서울특별시 용산구 후암동 한강대로104길 60','02-6020-0381','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 한강대로104길 60',INSTR('서울특별시 용산구 후암동 한강대로104길 60', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 한강대로104길 60',' ',1,2)-INSTR('서울특별시 용산구 후암동 한강대로104길 60',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 찌개집',1007,'서울특별시 용산구 후암동 후암로48길 1','02-6020-0382','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 후암로48길 1',INSTR('서울특별시 용산구 후암동 후암로48길 1', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 후암로48길 1',' ',1,2)-INSTR('서울특별시 용산구 후암동 후암로48길 1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 찌개집',1007,'서울특별시 용산구 후암동 259-8','02-6020-0383','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 259-8',INSTR('서울특별시 용산구 후암동 259-8', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 259-8',' ',1,2)-INSTR('서울특별시 용산구 후암동 259-8',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 찌개집',1007,'서울특별시 용산구 후암동 102-44번지 1층','02-6020-0384','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 102-44번지 1층',INSTR('서울특별시 용산구 후암동 102-44번지 1층', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 102-44번지 1층',' ',1,2)-INSTR('서울특별시 용산구 후암동 102-44번지 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 피자',1008,'서울특별시 용산구 후암동 194-7','02-6020-0385','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 194-7',INSTR('서울특별시 용산구 후암동 194-7', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 194-7',' ',1,2)-INSTR('서울특별시 용산구 후암동 194-7',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 피자',1008,'서울특별시 용산구 후암동 신흥로36길 4','02-6020-0386','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 신흥로36길 4',INSTR('서울특별시 용산구 후암동 신흥로36길 4', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 신흥로36길 4',' ',1,2)-INSTR('서울특별시 용산구 후암동 신흥로36길 4',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 피자',1008,'서울특별시 용산구 소월로2길 5','02-6020-0387','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로2길 5',INSTR('서울특별시 용산구 소월로2길 5', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로2길 5',' ',1,2)-INSTR('서울특별시 용산구 소월로2길 5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 양식',1009,'서울특별시 용산구 후암로57길 35-15','02-6020-0388','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암로57길 35-15',INSTR('서울특별시 용산구 후암로57길 35-15', ' ',1,1)+1, INSTR('서울특별시 용산구 후암로57길 35-15',' ',1,2)-INSTR('서울특별시 용산구 후암로57길 35-15',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 양식',1009,'서울특별시 용산구 후암동 236-9번지 1층','02-6020-0389','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 236-9번지 1층',INSTR('서울특별시 용산구 후암동 236-9번지 1층', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 236-9번지 1층',' ',1,2)-INSTR('서울특별시 용산구 후암동 236-9번지 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 양식',1009,'서울특별시 용산구 소월로 56','02-6020-0390','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로 56',INSTR('서울특별시 용산구 소월로 56', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로 56',' ',1,2)-INSTR('서울특별시 용산구 소월로 56',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 고기집',1010,'서울특별시 용산구 후암동 105-122','02-6020-0391','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 105-122',INSTR('서울특별시 용산구 후암동 105-122', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 105-122',' ',1,2)-INSTR('서울특별시 용산구 후암동 105-122',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 고기집',1010,'서울특별시 용산구 후암동 한강대로104길 85','02-6020-0392','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 한강대로104길 85',INSTR('서울특별시 용산구 후암동 한강대로104길 85', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 한강대로104길 85',' ',1,2)-INSTR('서울특별시 용산구 후암동 한강대로104길 85',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 고기집',1010,'서울특별시 용산구 소월로2길 27','02-6020-0393','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로2길 27',INSTR('서울특별시 용산구 소월로2길 27', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로2길 27',' ',1,2)-INSTR('서울특별시 용산구 소월로2길 27',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 보쌈집',1011,'서울특별시 용산구 소월로2길 11','02-6020-0394','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로2길 11',INSTR('서울특별시 용산구 소월로2길 11', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로2길 11',' ',1,2)-INSTR('서울특별시 용산구 소월로2길 11',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 보쌈집',1011,'서울특별시 용산구 동자동 19-55번지 1층','02-6020-0395','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 19-55번지 1층',INSTR('서울특별시 용산구 동자동 19-55번지 1층', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 19-55번지 1층',' ',1,2)-INSTR('서울특별시 용산구 동자동 19-55번지 1층',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 보쌈집',1011,'서울특별시 용산구 소월로2나길 6-1','02-6020-0396','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 소월로2나길 6-1',INSTR('서울특별시 용산구 소월로2나길 6-1', ' ',1,1)+1, INSTR('서울특별시 용산구 소월로2나길 6-1',' ',1,2)-INSTR('서울특별시 용산구 소월로2나길 6-1',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 태국음식집',1012,'서울특별시 용산구 동자동 9','02-6020-0397','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 9',INSTR('서울특별시 용산구 동자동 9', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 9',' ',1,2)-INSTR('서울특별시 용산구 동자동 9',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 태국음식집',1012,'서울특별시 용산구 후암동 102-56','02-6020-0398','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 후암동 102-56',INSTR('서울특별시 용산구 후암동 102-56', ' ',1,1)+1, INSTR('서울특별시 용산구 후암동 102-56',' ',1,2)-INSTR('서울특별시 용산구 후암동 102-56',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 태국음식집',1012,'서울특별시 용산구 동자동 2-5','02-6020-0399','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 2-5',INSTR('서울특별시 용산구 동자동 2-5', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 2-5',' ',1,2)-INSTR('서울특별시 용산구 동자동 2-5',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 패스트푸드',1013,'서울특별시 용산구 동자동 한강대로104길 50','02-6020-0400','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 한강대로104길 50',INSTR('서울특별시 용산구 동자동 한강대로104길 50', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 한강대로104길 50',' ',1,2)-INSTR('서울특별시 용산구 동자동 한강대로104길 50',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 패스트푸드',1013,'서울특별시 용산구 동자동 11','02-6020-0401','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 11',INSTR('서울특별시 용산구 동자동 11', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 11',' ',1,2)-INSTR('서울특별시 용산구 동자동 11',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 패스트푸드',1013,'서울특별시 용산구 동자동 9-14 후암로57길 13','02-6020-0402','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 9-14 후암로57길 13',INSTR('서울특별시 용산구 동자동 9-14 후암로57길 13', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 9-14 후암로57길 13',' ',1,2)-INSTR('서울특별시 용산구 동자동 9-14 후암로57길 13',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'A 도시락',1014,'서울특별시 용산구 동자동 10-4','02-6020-0403','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 10-4',INSTR('서울특별시 용산구 동자동 10-4', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 10-4',' ',1,2)-INSTR('서울특별시 용산구 동자동 10-4',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'B 도시락',1014,'서울특별시 용산구 동자동 후암로57길 3-14','02-6020-0404','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 동자동 후암로57길 3-14',INSTR('서울특별시 용산구 동자동 후암로57길 3-14', ' ',1,1)+1, INSTR('서울특별시 용산구 동자동 후암로57길 3-14',' ',1,2)-INSTR('서울특별시 용산구 동자동 후암로57길 3-14',' ',1,1)-1)= middlearea.city));
INSERT INTO RESTAURANT(restno,rname,cname,addr,tel,rotime,rctime,mcode) VALUES((SELECT NVL(MAX(RESTNO)+1,1) FROM RESTAURANT),'C 도시락',1014,'서울특별시 용산구 두텁바위로38길 29-17','02-6020-0405','10:00','21:00', (SELECT CODE FROM MIDDLEAREA 
WHERE SUBSTR('서울특별시 용산구 두텁바위로38길 29-17',INSTR('서울특별시 용산구 두텁바위로38길 29-17', ' ',1,1)+1, INSTR('서울특별시 용산구 두텁바위로38길 29-17',' ',1,2)-INSTR('서울특별시 용산구 두텁바위로38길 29-17',' ',1,1)-1)= middlearea.city));


commit;