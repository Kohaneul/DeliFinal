--delivery
CREATE TABLE member(
    mno NUMBER(4)
        CONSTRAINT MEMBER_MNO_PK PRIMARY KEY,
    name VARCHAR2(20 CHAR)
        CONSTRAINT MEMBER_NAME_NN NOT NULL,
    id VARCHAR2(10 CHAR)
        CONSTRAINT MEMBER_ID_NN NOT NULL
        CONSTRAINT MEMBER_ID_UK UNIQUE,
    kakaoid VARCHAR2(50 CHAR)
        CONSTRAINT MEMBER_KAKAOID_UK UNIQUE,
    pw VARCHAR2(15 CHAR)
        CONSTRAINT MEMBER_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MEMBER_MAIL_NN NOT NULL
        CONSTRAINT MEMBER_MAIL_UK UNIQUE,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MEMBER_TEL_NN NOT NULL
        CONSTRAINT MEMBER_TEL_UK UNIQUE,
    addr VARCHAR2(60 CHAR)
        CONSTRAINT MEMBER_ADDR_NN NOT NULL,
    jdate DATE DEFAULT sysdate
        CONSTRAINT MEMBER_JDATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMBER_ISSHOW_NN NOT NULL
        CONSTRAINT MEMBER_ISSHOW_CK CHECK(isshow IN('Y','N')),
    esti NUMBER(3, 2) DEFAULT 2.5
        CONSTRAINT MEMBER_ESTI_NN NOT NULL,
    receive VARCHAR2(20 CHAR)
);
ALTER TABLE 
    member
ADD(
    dti_addr VARCHAR2(4000)
);
INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '이용현', 'YHLEE', 'YHLEE12', '12345', 'YH@githrd.com', '010-0000-0000', '서울시 영등포구 신풍로 77'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '둘리', 'dool', 'dool12', '12345', 'dool@githrd.com', '010-1111-1111', '서울시 종로구 사직동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '희동이', 'hui', 'hui12', '12345', 'hui@githrd.com', '010-2222-2222', '서울시 종로구 무악동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '홍길동', 'HONG', 'HONG', '12345', 'HONG@githrd.com', '010-3333-3333', '서울시 중구 소공동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '마이콜', 'call', 'call12', '12345', 'call@githrd.com', '010-4444-4444', '서울시 용산구 후암동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '제니', 'jennie', 'jennie12', '12345', 'jennie@githrd.com', '010-5555-5555', '서울시 중구 다산동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '안은비', 'aeb320', '320aeb', '12345', 'dksdmsql320@gmail.com', '010-3232-3232', '서울시 영등포구 신길동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '박찬슬', 'pcs', 'pcs', '12345', 'pcs@githrd.com', '010-8784-8874', '서울시 영등포구 신풍로 80'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '이형준', 'lhj', 'lhj', '12345', 'lhj@githrd.com', '010-8111-5484', '서울시 영등포구 신길로 89'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '고하늘', 'khn', 'khn', '12345', 'khn@githrd.com', '010-8420-1548', '서울시 영등포구 신풍로 46-1'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '김수미', 'ksm', 'ksm', '12345', 'ksm@githrd.com', '010-4520-1548', '서울시 영등포구 신풍로 74'
);

commit;



CREATE TABLE CHAT(
    cno NUMBER(5)
        CONSTRAINT CHAT_CNO_PK PRIMARY KEY,
    cmno NUMBER(4)
        CONSTRAINT CHAT_CMNO_NN NOT NULL
        CONSTRAINT CHAT_CMNO_FK REFERENCES member(mno),
    cbody VARCHAR2 (100 CHAR)
        CONSTRAINT CHAT_CBODY_NN NOT NULL,
    cdate DATE DEFAULT sysdate
        CONSTRAINT CHAT_CDATE_NN NOT NULL
);
ALTER TABLE chat
ADD(
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT CHAT_ISSHOW_NN NOT NULL
        CONSTRAINT CHAT_ISSHOW_CK CHECK(isshow IN('Y','N'))
);

CREATE TABLE IMGFILE(
    ano NUMBER(6)
        CONSTRAINT IMGFILE_ANO_PK PRIMARY KEY,
    amno NUMBER(4)
        CONSTRAINT IMGFILE_amno_FK REFERENCES member(mno),
    oriname VARCHAR2(4000)
        CONSTRAINT IMGFILE_ORINAME_NN NOT NULL,
    dir VARCHAR2(100 CHAR)
        CONSTRAINT IMGFILE_URL_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT IMGFILE_ISSHOW_NN NOT NULL
        CONSTRAINT IMGFILE_ISSHOW_CK CHECK(isshow IN('Y','N')),
    sdate DATE DEFAULT sysdate
        CONSTRAINT IMGFILE_sdate_NN NOT NULL,
    savename VARCHAR2(4000)
        CONSTRAINT IMGFILE_SAVENAME_NN NOT NULL
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1001,
    'img_avatar2.png', '/resources/upload', 'img_avatar2.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1002,
    'img_avatar2.png', '/resources/upload', 'img_avatar1.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1003,
    'img_avatar2.png', '/resources/upload', 'img_avatar4.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1004,
    'img_avatar2.png', '/resources/upload', 'img_avatar1.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1005,
    'img_avatar2.png', '/resources/upload', 'img_avatar5.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1006,
    'img_avatar2.png', '/resources/upload', 'img_avatar2.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1007,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1008,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);


INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 109,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);


INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1010,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);


INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1011,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);

commit;

CREATE TABLE largearea(
    city VARCHAR2(10 CHAR)
        CONSTRAINT LARGEAREA_LCITY_NN NOT NULL,
    code NUMBER(8)
        CONSTRAINT LARGEAREA_CODE_PK PRIMARY KEY
);

CREATE TABLE middlearea(
    city VARCHAR2(10 CHAR)
        CONSTRAINT MIDDLEAREA_CITY_NN NOT NULL,
    lcode NUMBER(8)
        CONSTRAINT MIDDLEAREA_LCODE_NN NOT NULL
        CONSTRAINT MIDDLEAREA_LCODE_FK REFERENCES largearea(code),
    code NUMBER(8)
       CONSTRAINT MIDDLEAREA_CODE_PK PRIMARY KEY
);

CREATE TABLE smallarea(
    city VARCHAR2(16 CHAR)
        CONSTRAINT SMALLAREA_CITY_NN NOT NULL,
    lcode NUMBER(8)
        CONSTRAINT SMALLAREA_LCODE_NN NOT NULL
        CONSTRAINT SMALLAREA_LCODE_FK REFERENCES largearea(code),
    mcode NUMBER(8)
        CONSTRAINT SMALLAREA_MCODE_NN NOT NULL
        CONSTRAINT SMALLAREA_MCODE_FK REFERENCES middlearea(code),
    code NUMBER(8)
        CONSTRAINT SMALLAREA_CODE_PK PRIMARY KEY
);

INSERT INTO
    largearea
VALUES(
    '서울특별시', 1
);

INSERT INTO
    largearea
VALUES(
    '경기도', 10
);

INSERT INTO
    largearea
VALUES(
    '강원도', 20 
);

INSERT INTO
    largearea
VALUES(
    '충청북도', 30
);


INSERT INTO
    largearea
VALUES(
    '충청남도', 40
);

INSERT INTO
    largearea
VALUES(
    '경상남도', 50
);

INSERT INTO
    largearea
VALUES(
    '경상북도', 60
);

INSERT INTO
    largearea
VALUES(
    '전라북도', 70
);

INSERT INTO
    largearea
VALUES(
    '전라남도', 80
);

INSERT INTO
    largearea
VALUES(
    '제주도', 90
);

INSERT INTO
    middlearea
VALUES(
    '종로구', 1, 1 
);
INSERT INTO
    middlearea
VALUES(
    '중구', 1, 2
);
INSERT INTO
    middlearea
VALUES(
    '용산구', 1, 3
);
INSERT INTO
    middlearea
VALUES(
    '성동구', 1, 4
);
INSERT INTO
    middlearea
VALUES(
    '광진구', 1, 5
);
INSERT INTO
    middlearea
VALUES(
    '동대문구', 1, 6
);
INSERT INTO
    middlearea
VALUES(
    '중랑구', 1, 7
);
INSERT INTO
    middlearea
VALUES(
    '성북구', 1, 8
);
INSERT INTO
    middlearea
VALUES(
    '강북구', 1, 9
);
INSERT INTO
    middlearea
VALUES(
    '도봉구', 1, 10 
);
INSERT INTO
    middlearea
VALUES(
    '노원구', 1, 11 
);
INSERT INTO
    middlearea
VALUES(
    '은평구', 1, 12
);
INSERT INTO
    middlearea
VALUES(
    '서대문구', 1, 13
);
INSERT INTO
    middlearea
VALUES(
    '마포구', 1, 14
);
INSERT INTO
    middlearea
VALUES(
    '양천구', 1, 15
);
INSERT INTO
    middlearea
VALUES(
    '강서구', 1, 16
);
INSERT INTO
    middlearea
VALUES(
    '구로구', 1, 17
);
INSERT INTO
    middlearea
VALUES(
    '금천구', 1, 18
);
INSERT INTO
    middlearea
VALUES(
    '영등포구', 1, 19
);
INSERT INTO
    middlearea
VALUES(
    '동작구', 1, 20
);
INSERT INTO
    middlearea
VALUES(
    '관악구', 1, 21
);
INSERT INTO
    middlearea
VALUES(
    '서초구', 1, 22
);
INSERT INTO
    middlearea
VALUES(
    '강남구', 1, 23
);
INSERT INTO
    middlearea
VALUES(
    '강동구', 1, 24
);
INSERT INTO
    middlearea
VALUES(
    '송파구', 1, 25
);

INSERT INTO
    middlearea
VALUES(
    '오산시', 10, 100
);

INSERT INTO
    middlearea
VALUES(
    '처인구', 10, 101
);

INSERT INTO
    middlearea
VALUES(
    '춘천시', 20, 400
);

INSERT INTO
    middlearea
VALUES(
    '충주시', 30, 700
);

INSERT INTO
    middlearea
VALUES(
    '서북구', 40, 1000
);

INSERT INTO
    smallarea
VALUES(
    '청운효자동', 1, 1, 1
);
INSERT INTO
    smallarea
VALUES(
    '사직동', 1, 1, 2
);
INSERT INTO
    smallarea
VALUES(
    '삼청동', 1, 1, 3
);
INSERT INTO
    smallarea
VALUES(
    '부암동', 1, 1, 4
);
INSERT INTO
    smallarea
VALUES(
    '평창동', 1, 1, 5
);
INSERT INTO
    smallarea
VALUES(
    '무악동', 1, 1, 6
);
INSERT INTO
    smallarea
VALUES(
    '교남동', 1, 1, 7
);
INSERT INTO
    smallarea
VALUES(
    '가회동', 1, 1, 8
);
INSERT INTO
    smallarea
VALUES(
    '종로 1, 2, 3, 4 가동', 1, 1, 9
);
INSERT INTO
    smallarea
VALUES(
    '종로 5, 6 가동', 1, 1, 10
);
INSERT INTO
    smallarea
VALUES(
    '이화동', 1, 1, 11
);
INSERT INTO
    smallarea
VALUES(
    '혜화동', 1, 1, 12
);
INSERT INTO
    smallarea
VALUES(
    '창신제1동', 1, 1, 13
);
INSERT INTO
    smallarea
VALUES(
    '창신제2동', 1, 1, 14
);
INSERT INTO
    smallarea
VALUES(
    '창신제3동', 1, 1, 15
);
INSERT INTO
    smallarea
VALUES(
    '숭인제1동', 1, 1, 16
);
INSERT INTO
    smallarea
VALUES(
    '숭인제2동', 1, 1, 17
);



INSERT INTO
    smallarea
VALUES(
    '소공동', 1, 2, 20
);
INSERT INTO
    smallarea
VALUES(
    '회현동', 1, 2, 21
);
INSERT INTO
    smallarea
VALUES(
    '명동', 1, 2, 22
);
INSERT INTO
    smallarea
VALUES(
    '필동', 1, 2, 23
);
INSERT INTO
    smallarea
VALUES(
    '장충동', 1, 2, 24
);
INSERT INTO
    smallarea
VALUES(
    '광희동', 1, 2, 25
);
INSERT INTO
    smallarea
VALUES(
    '을지동', 1, 2, 26
);
INSERT INTO
    smallarea
VALUES(
    '신당동', 1, 2, 27
);
INSERT INTO
    smallarea
VALUES(
    '다산동', 1, 2, 28
);
INSERT INTO
    smallarea
VALUES(
    '약수동', 1, 2, 29
);
INSERT INTO
    smallarea
VALUES(
    '청구동', 1, 2, 30
);
INSERT INTO
    smallarea
VALUES(
    '신당제5동', 1, 2, 31
);
INSERT INTO
    smallarea
VALUES(
    '동화동', 1, 2, 32
);
INSERT INTO
    smallarea
VALUES(
    '황학동', 1, 2, 33
);
INSERT INTO
    smallarea
VALUES(
    '중림동', 1, 2, 34
);



INSERT INTO
    smallarea
VALUES(
    '후암동', 1, 3, 40
);
INSERT INTO
    smallarea
VALUES(
    '용산2가동', 1, 3, 41
);
INSERT INTO
    smallarea
VALUES(
    '남영동', 1, 3, 42
);
INSERT INTO
    smallarea
VALUES(
    '청파동', 1, 3, 43
);
INSERT INTO
    smallarea
VALUES(
    '원효로제1동', 1, 3, 44
);
INSERT INTO
    smallarea
VALUES(
    '원효로제2동', 1, 3, 45
);
INSERT INTO
    smallarea
VALUES(
    '효창동', 1, 3, 46
);
INSERT INTO
    smallarea
VALUES(
    '용문동', 1, 3, 47
);
INSERT INTO
    smallarea
VALUES(
    '한강로동', 1, 3, 48
);
INSERT INTO
    smallarea
VALUES(
    '이촌제1동', 1, 3, 49
);
INSERT INTO
    smallarea
VALUES(
    '이촌제2동', 1, 3, 50
);
INSERT INTO
    smallarea
VALUES(
    '이태원제1동', 1, 3, 51
);
INSERT INTO
    smallarea
VALUES(
    '이태원제2동', 1, 3, 52
);
INSERT INTO
    smallarea
VALUES(
    '한남동', 1, 3, 53
);
INSERT INTO
    smallarea
VALUES(
    '서빙고동', 1, 3, 54
);
INSERT INTO
    smallarea
VALUES(
    '보광동', 1, 3, 55
);

INSERT INTO
    smallarea
VALUES(
    '중앙동', 10, 100, 500
);

INSERT INTO
    smallarea
VALUES(
    '중앙동', 10, 101, 1000
);

commit;
CREATE TABLE menucategory (
    foodtype VARCHAR2(10 CHAR)
        CONSTRAINT MENU_TYPE_PK PRIMARY KEY,
    code NUMBER(4)
        CONSTRAINT MENU_CODE_NN NOT NULL
        CONSTRAINT MENU_CODE_UK UNIQUE
);

INSERT INTO
    menucategory
VALUES(
    '돈까스·회·일식', 1001
);
INSERT INTO
    menucategory
VALUES(
    '중식', 1002
);
INSERT INTO
    menucategory
VALUES(
    '치킨', 1003
);
INSERT INTO
    menucategory
VALUES(
    '백반·죽·국수', 1004
);
INSERT INTO
    menucategory
VALUES(
    '카페·디저트', 1005
);
INSERT INTO
    menucategory
VALUES(
    '분식', 1006
);
INSERT INTO
    menucategory
VALUES(
    '찜·탕·찌개', 1007
);
INSERT INTO
    menucategory
VALUES(
    '피자', 1008
);
INSERT INTO
    menucategory
VALUES(
    '양식', 1009
);
INSERT INTO
    menucategory
VALUES(
    '고기·구이', 1010
);
INSERT INTO
    menucategory
VALUES(
    '족발·보쌈', 1011
);
INSERT INTO
    menucategory
VALUES(
    '아시안', 1012
);INSERT INTO
    menucategory
VALUES(
    '페스트푸드', 1013
);
INSERT INTO
    menucategory
VALUES(
    '도시락', 1014
);

commit;

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

CREATE TABLE menuimg(
    mino NUMBER(4)
        CONSTRAINT MI_NO_PK PRIMARY KEY,
    miname VARCHAR2(20CHAR)
        CONSTRAINT MI_INAME_NN NOT NULL,
    sname VARCHAR2(20 CHAR)
        CONSTRAINT MI_SNAME_NN NOT NULL,
    dir VARCHAR2(60 CHAR)
        CONSTRAINT MI_DIR_NN NOT NULL
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg01', 'mimg01_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg02', 'mimg02_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg03', 'mimg03_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg04', 'mimg04_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg05', 'mimg05_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg06', 'mimg06_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg07', 'mimg07_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg08', 'mimg08_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg09', 'mimg09_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg10', 'mimg10_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg11', 'mimg11_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg12', 'mimg12_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg13', 'mimg13_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg14', 'mimg14_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg15', 'mimg15_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg16', 'mimg16_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg17', 'mimg17_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg18', 'mimg18_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg19', 'mimg19_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg20', 'mimg20_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg21', 'mimg21_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg22', 'mimg22_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg23', 'mimg23_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg24', 'mimg24_1', 'deli\src\main\webapp\resources\img\mimg'
);

commit;

CREATE TABLE menu(
    mno NUMBER(4)
        CONSTRAINT MN_MNO_PK PRIMARY KEY,
    rno NUMBER(6)
        CONSTRAINT MN_RNO_FK REFERENCES restaurant(restno)
        CONSTRAINT MN_RNO_NN NOT NULL,
    mname VARCHAR2(20CHAR)
        CONSTRAINT MN_MNAME_NN NOT NULL,
    mprice NUMBER(6)
        CONSTRAINT MN_PR_NN NOT NULL,
    mintro VARCHAR2(60 CHAR)
        CONSTRAINT MN_INTRO_NN NOT NULL,
    mimg NUMBER(4)
        CONSTRAINT MN_IMG_FK REFERENCES menuimg(mino)
        CONSTRAINT MN_IMG_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MN_SHOW_CK CHECK (isshow IN('Y','N'))
        CONSTRAINT MN_SHOW_NN NOT NULL
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    1, '짜장면', '둘이 먹다가 하나가 죽어도 모르는 짜장면!', 1001, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    1, '짬뽕', '둘이 먹다가 하나가 죽어도 모르는 짬뽕!', 1002, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    2, '짜장면', '둘이 먹다가 하나가 죽어도 모르는 짜장면!', 1001, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    2, '짬뽕', '둘이 먹다가 하나가 죽어도 모르는 짬뽕!', 1002, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    3, '짜장면', '둘이 먹다가 하나가 죽어도 모르는 짜장면!', 1001, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    3, '짬뽕', '둘이 먹다가 하나가 죽어도 모르는 짬뽕!', 1002, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    4, '짜장면', '둘이 먹다가 하나가 죽어도 모르는 짜장면!', 1001, 6000
);

INSERT INTO
    menu(mno, rno, mname, mintro, mimg, mprice)
VALUES(
    (SELECT NVL(MAX(mno) +1, 1) FROM menu),
    4, '짬뽕', '둘이 먹다가 하나가 죽어도 모르는 짬뽕!', 1002, 6000
);

commit;

CREATE TABLE board(
    bno number(4)
        CONSTRAINT BOARD_BNO_PK PRIMARY KEY,
    bmno number(4)
        CONSTRAINT BOARD_BMNO_NN NOT NULL
        CONSTRAINT BOARD_BMNO_FK REFERENCES member(mno),
    title VARCHAR2(40 CHAR)
        CONSTRAINT BOARD_TITLE_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT BOARD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT BOARD_WDATE_NN NOT NULL,
    click NUMBER(3) DEFAULT 0
        CONSTRAINT BOARD_CLICK_NN NOT NULL,
    larea NUMBER(8)
        CONSTRAINT BOARD_BAREA_NN NOT NULL
        CONSTRAINT BOARD_BAREA_FK REFERENCES largearea(code),
    marea NUMBER(8)
        CONSTRAINT BOARD_MAREA_NN NOT NULL
        CONSTRAINT BOARD_MAREA_FK REFERENCES middlearea(code),
    sarea NUMBER(8)
        CONSTRAINT BOARD_SAREA_NN NOT NULL
        CONSTRAINT BOARD_SAREA_FK REFERENCES smallarea(code),
    end NUMBER(3)
        CONSTRAINT BOARD_END_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT BOARD_ISSHOW_NN NOT NULL
        CONSTRAINT BOARD_ISSHOW_CK CHECK(isshow IN('Y','N')),
    category VARCHAR2(10CHAR)
        CONSTRAINT BOARD_CATEGORY_NN NOT NULL
        CONSTRAINT BOARD_CATEGORY_FK REFERENCES menucategory(foodtype),
    rest NUMBER(6)
        CONSTRAINT BOARD_REST_FK REFERENCES restaurant(restno)
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1001, '족발먹을사람', '족발먹을사람 구해요', 1, 1, 2, 8, '족발·보쌈', 1
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1003, '치킨먹자', '오늘밤 치킨먹자', 1, 2, 20, 4, '치킨', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1005, '오늘밤엔피맥해요', '배달료 비싼데 같이 피자 먹을사람 구해요', 1, 2, 30, 2, '피자', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1002, '떡볶이순대튀김', '오늘같은 날엔 떡볶이와 순대와 튀김 아니겠어요 저희 같이 공동구매해서 배달료 아끼고 맛있게 먹어요', 1, 3, 40, 2, '분식', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1004, '갈비인가 통닭인가 수원 왕갈비 통닭', '영화보는데 너무 맛있어보여서 급히 생각나서 글 올려봐요 같이 시키실분 계신가요', 1, 2, 27, 1, '치킨', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1006, '테스트입니다.', '무엇을 먹어야할지 생각하는 테스트입니다.', 1, 2, 27, 1, '치킨', 2
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1001, '먹자.', '밥먹자.', 1, 1, 2, 2, '치킨', 2
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1003, '먹세먹세 젊어서 먹세.', '다먹자.', 1, 1, 3, 2, '치킨', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1004, '배고파요', '파스타 시키실분 계신가요', 10, 101, 1000, 3, '양식', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1006, '피자먹자피자피자', '피자피자피피자피자', 10, 101, 1000, 3, '피자', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1002, '치킨이요', '치킨먹고싶어요', 10, 101, 1000, 3, '치킨', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1003, '삼겹살먹자', '삼겹살 고고', 10, 100, 1000, 3, '고기·구이', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1004, '스테이크', '빕스or아웃백', 10, 100, 1000, 3, '양식', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1004, '맛있는거 먹고싶지 않아요?.', '지금 딱히 생각나는 음식은 없지만 8시간 뒤 치킨이 먹고싶을거 같아요.', 1, 1, 2, 8, '치킨', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1005, '테스트용', '테스트 해보자 얼른.', 1, 1, 2, 6, '치킨', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1006, 'ㅋㅋㅋㅋㅋㅋㅋㅋ', '좀더 빨리 해라', 1, 1, 2, 2, '도시락', 1
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1002, '이번엔 고기다', '고기먹자', 1, 1, 2, 1, '고기·구이', 3
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1001, '배고프다', '삼겹살 콜?', 1, 1, 2, 0, '고기·구이', 4
);

INSERT INTO
    board(bno, bmno, title, body, larea, marea, sarea, end, category, rest)
VALUES(
    (SELECT NVL(MAX(bno) + 1, 1) FROM board), 1001, '빨리요', '중국음식 먹고싶어요.', 1, 1, 2, 12, '중식', 2
);

commit;

CREATE TABLE regimem (
    abno NUMBER(4)
        CONSTRAINT REGIMEM_ABNO_NN NOT NULL
        CONSTRAINT REGIMEM_ABNO_FK REFERENCES board(bno),
    aid VARCHAR2(10 CHAR)
        CONSTRAINT REGIMEM_AID_NN NOT NULL
        CONSTRAINT REGIMEM_AID_FK REFERENCES member(id),
    wdate DATE DEFAULT sysdate
        CONSTRAINT REGIMEM_wdate_NN NOT NULL,
    ddate DATE DEFAULT sysdate
        CONSTRAINT REGIMEM_DDATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REGIMEM_ISSHOW_NN NOT NULL
        CONSTRAINT REGIMEM_ISSHOW_CK CHECK(isshow IN('Y','N')),
    estishow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REGIMEM_ESTI_NN NOT NULL
        CONSTRAINT REGIMEM_ESTI_CK CHECK(estishow IN('Y','N'))
);

ALTER TABLE regimem DROP COLUMN estishow;

INSERT INTO
    regimem(abno, aid)
VALUES(
    2, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    3, 'call'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    4, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    5, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    6, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    7, 'YHLEE'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    8, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    9, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    10, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    11, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    12, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    13, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    14, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    15, 'call'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    16, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    17, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    18, 'YHLEE'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    19, 'YHLEE'
);

commit;

CREATE TABLE ordertask(
    ono VARCHAR2(40CHAR)
        CONSTRAINT OD_ONO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT OD_MNO_FK REFERENCES member(mno)
        CONSTRAINT OD_MNO_NN NOT NULL
);

alter table ordertask add(
    isshow CHAR(1) DEFAULT 'Y'
    CONSTRAINT ODT_SHOW_CK CHECK (isshow IN('Y', 'N'))
    CONSTRAINT ODT_SHOW_NN NOT NULL
);

CREATE TABLE orderlist(
    olno NUMBER(6)
        CONSTRAINT OL_OLNO_PK PRIMARY KEY,
    ono VARCHAR2(40CHAR)
        CONSTRAINT OL_ONO_FK REFERENCES ordertask(ono)
        CONSTRAINT OL_ONO_NN NOT NULL,
    rno NUMBER(4)
        CONSTRAINT OL_RNO_FK REFERENCES restaurant(restno)
        CONSTRAINT OL_MNO_NN NOT NULL,
    odate DATE DEFAULT sysdate
        CONSTRAINT OL_DATE_NN NOT NULL,
    oprice NUMBER(6)
        CONSTRAINT OL_PR_NN NOT NULL,
    paym VARCHAR2(10CHAR)
        CONSTRAINT OL_PM_NN NOT NULL,
    requests VARCHAR2(100CHAR)
);

alter table orderlist add(
    isshow CHAR(1) DEFAULT 'Y'
    CONSTRAINT ODL_SHOW_CK CHECK (isshow IN('Y', 'N'))
    CONSTRAINT ODL_SHOW_NN NOT NULL
);

CREATE TABLE ordermenu(
    omno NUMBER(6)
        CONSTRAINT OM_OMNO_PK PRIMARY KEY,
    olno NUMBER(6)
        CONSTRAINT OM_OLNO_FK REFERENCES orderlist(olno)
        CONSTRAINT OM_OLNO_NN NOT NULL,
    omenu VARCHAR2(20 CHAR)
        CONSTRAINT OM_MENU_NN NOT NULL,
    omprice NUMBER(6)
        CONSTRAINT OM_OMPR_NN NOT NULL,
    quantity NUMBER(4)
        CONSTRAINT OM_QT_NN NOT NULL,
    ono VARCHAR2(40CHAR)
        CONSTRAINT OM_ONO_NN NOT NULL
        CONSTRAINT OM_ONO_FK REFERENCES ordertask(ono)
);

alter table ordermenu add(
    isshow CHAR(1) DEFAULT 'Y'
    CONSTRAINT ODM_SHOW_CK CHECK (isshow IN('Y', 'N'))
    CONSTRAINT ODM_SHOW_NN NOT NULL
);

CREATE TABLE friend(
    fno NUMBER(4)
        CONSTRAINT FRIEND_FNO_PK PRIMARY KEY,
    myno NUMBER(4)
        CONSTRAINT FRIEND_MYNO_NN NOT NULL
        CONSTRAINT FRIEND_MYNO_FK REFERENCES member(mno),
    frino NUMBER(4)
        CONSTRAINT FRIEND_FNO_NN NOT NULL
        CONSTRAINT FRIEND_FNO_FK REFERENCES member(mno),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT FRIEND_ISSHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT FRIEND_ISSHOW_NN NOT NULL,
    fdate DATE  DEFAULT sysdate
        CONSTRAINT FRIEND_FDATE_NN NOT NULL,
    ddate DATE,
    agree CHAR(1) DEFAULT 'N'
        CONSTRAINT FRIEND_AGREE_NN NOT NULL,
    adate DATE
);

INSERT INTO
    friend(fno, myno, frino)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1006
);
INSERT INTO
    friend(fno, myno, frino)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1004
);

INSERT INTO
    friend(fno, myno, frino, agree, adate)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1003, 'Y', sysdate
);
INSERT INTO
    friend(fno, myno, frino, agree, adate)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'hui'), 1001, 'Y', sysdate
);

commit;

CREATE TABLE estimate(
    ebno NUMBER(4)
        CONSTRAINT ESTI_BNO_FK REFERENCES board(bno)
        CONSTRAINT ESTI_BNO_NN NOT NULL,
    eida VARCHAR2(10 CHAR)
        CONSTRAINT ESTI_IDA_NN NOT NULL
        CONSTRAINT ESTI_IDA_FK REFERENCES member(id),
    eidb VARCHAR2(10 CHAR)
        CONSTRAINT ESTI_IDB_NN NOT NULL
        CONSTRAINT ESTI_IDB_FK REFERENCES member(id),
    epoint NUMBER(3,2) DEFAULT 0
        CONSTRAINT ESTI_PTS_NN NOT NULL
);

CREATE TABLE message (
    msno NUMBER(4)
        CONSTRAINT MESSAGE_MSNO_PK PRIMARY KEY,
    writerno NUMBER(4)
        CONSTRAINT MESSAGE_WTNO_NN NOT NULL
        CONSTRAINT MESSAGE_WTNO_FK REFERENCES member(mno),
    myno NUMBER(4)
        CONSTRAINT MESSAGE_MYNO_NN NOT NULL
        CONSTRAINT MESSAGE_MYNO_FK REFERENCES member(mno),
    mstitle VARCHAR2(30 CHAR)
        CONSTRAINT MESSAGE_MSTITLE_NN NOT NULL,
    msbody VARCHAR2(4000)
        CONSTRAINT MESSAGE_MSBODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT MESSAGE_WDATE_NN NOT NULL,
    mscheck CHAR(1) DEFAULT 'N'
        CONSTRAINT MESSAGE_CHECK_NN NOT NULL,
    rdate DATE,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MESSAGE_ISSHOW_NOT NULL
        CONSTRAINT MESSAGE_ISSHOW_CK CHECK(isshow IN('Y', 'N'))
);

CREATE TABLE RCOORDI(
    RESNO NUMBER  CONSTRAINT RNO_RCOORDI_PK PRIMARY KEY,
    RESNAME VARCHAR2(20 CHAR) CONSTRAINT RNAME_RCOORDI_NN NOT NULL ENABLE, 
    RESLAT NUMBER CONSTRAINT RLAT_RCOORDI_NN NOT NULL ENABLE, 
    RESLON NUMBER CONSTRAINT RLON_RCOORDI_NN NOT NULL ENABLE, 
    MYLAT NUMBER CONSTRAINT MYLAT_RCOORDI_NN NOT NULL ENABLE, 
    MYLON NUMBER CONSTRAINT MYLON_RCOORDI_NN NOT NULL ENABLE, 
    RESDIST NUMBER CONSTRAINT RDIST_RCOORDI_NN NOT NULL ENABLE, 
    CATEGORY VARCHAR2(20 CHAR),
    CATE_NO NUMBER CONSTRAINT CATENO_RCOORDI_NN NOT NULL ENABLE
);

Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (15,'신길반점',126.9173055106,37.497956618109,37.50064696263,37.50064696263,6803715.75,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (28,'백채김치찌개 신길삼거리점 ',37.514208152723,126.91944117679,37.50064696263,37.50064696263,1507.88,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (33,'레드다이닝룸',37.508924518548,126.92115764286,37.50064696263,37.50064696263,931.65,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (54,'도토리브라더스',37.572945557662,126.96931618526,37.575384699999816,37.575384699999816,726.33,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (59,'미락치킨',37.577634278611,126.97193460778,37.575384699999816,37.575384699999816,938.46,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (64,'스타벅스',37.572871456187,126.96946542422,37.575384699999816,37.575384699999816,741.61,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (69,'도미노피자',37.579879531191,126.96858272691,37.575384699999816,37.575384699999816,787.92,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (74,'가장맛있는족발',37.576977750828,126.97278377755,37.575384699999816,37.575384699999816,995.24,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (76,'효자왕족발',37.578758447147,126.97126037939,37.575384699999816,37.575384699999816,924.61,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (82,'한솥도시락',37.564386945962,126.96358641227,37.575384699999816,37.575384699999816,1234.44,'도시락',10014);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (87,'통일반점',37.576216674416,126.95695986716,37.576780899999754,37.576780899999754,264.93,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (92,'인왕산국수',37.576108710153,126.95753981654,37.576780899999754,37.576780899999754,317.42,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (97,'할리스커피',37.574313376628,126.96112271028,37.576780899999754,37.576780899999754,681.87,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (102,'배부장찌개',37.574712167623,126.95806631282,37.574236220301,37.574236220301,358.83,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (107,'아웃백',37.574236220301,126.95839060509,37.574236220301,37.574236220301,383.48,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (116,'소공돈가스',37.563647737909,126.98092354569,37.56390500000024,37.56390500000024,270.06,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (121,'을지로치킨',37.563056459372,126.98151327089,37.56390500000024,37.56390500000024,334.12,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (131,'중구분식',37.562396904488,126.98123974963,37.56390500000024,37.56390500000024,340.56,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (136,'피자마루',37.563263925815,126.97991625488,37.56390500000024,37.56390500000024,193.38,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (146,'소공족발',37.56373162612,126.98111460146,37.56390500000024,37.56390500000024,286.03,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (154,'후암반점',37.552546036178,126.97756992531,37.550392700000224,37.550392700000224,536.6,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (159,'후암치킨',37.546591846765,126.97717589591,37.550392700000224,37.550392700000224,614.07,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (164,'로뎀트리',37.552185111546,126.97750751092,37.550392700000224,37.550392700000224,514.86,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (169,'강남동태탕',37.551769730511,126.98093215281,37.550392700000224,37.550392700000224,791.57,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (177,'청년고기',37.550865947425,126.98000979522,37.550392700000224,37.550392700000224,697.3,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (182,'가족발',37.551095798903,126.97967019789,37.550392700000224,37.550392700000224,669.95,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (192,'다산반점',37.559537472175,127.01218786517,37.55489750000009,37.55489750000009,1153.47,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (197,'왕십리분식',37.564149304826,127.02552512008,37.55489750000009,37.55489750000009,2435.16,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (204,'퇴계족발',37.56479059375,127.01250682202,37.564435673653,37.564435673653,39.54,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (2,'맥도날드',37.365083899999995,126.8729302640381,37.3572746,37.3572746,5171.21,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (3,'버거킹',37.390778890178744,126.85481998876955,37.3616703,37.3616703,7802.89,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (9,'서호장',37.569456476739,126.98940045112,37.3616703,37.3616703,23594.1,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (14,'신길동짬뽕',37.515284839122,126.91654290097,37.50064696263,37.50064696263,1648.62,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (20,'최고식당',37.506897786575,126.90791503185,37.50064696263,37.50064696263,1237.28,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (26,'열정분식소',37.505624859127,126.91221196021,37.50064696263,37.50064696263,849.62,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (31,'파파존스 대방점',37.498628789787,126.91690139854,37.50064696263,37.50064696263,322.02,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (36,'원조부안집',37.514153499193,126.91966321506,37.50064696263,37.50064696263,1501.84,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (57,'금용문',37.57228258645,126.97403176342,37.575384699999816,37.575384699999816,1142.66,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (62,'스태픽스',37.577373176049,126.96769295893,37.575384699999816,37.575384699999816,574.94,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (66,'만나분식',37.577218725513,126.96906075358,37.575384699999816,37.575384699999816,682.44,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (72,'곱창타운',37.576584900069,126.97165766666,37.575384699999816,37.575384699999816,890.17,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (78,'써브웨이',37.572004259911,126.97258845021,37.575384699999816,37.575384699999816,1032.98,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (79,'브라운백',37.572034841329,126.97449736788,37.575384699999816,37.575384699999816,1190.18,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (85,'인왕돈까스',37.576684735739,126.95669422486,37.576780899999754,37.576780899999754,234.23,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (91,'엄마백반',37.5748404666,126.9579898951,37.576780899999754,37.576780899999754,409.6,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (100,'엽기떡볶이',37.574793051979,126.95839060509,37.574236220301,37.574236220301,388.45,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (105,'미스터피자',37.57550617849,126.95801166112,37.574236220301,37.574236220301,377.49,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (109,'무악고기',37.574506351617,126.95894555302,37.574236220301,37.574236220301,433.43,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (124,'본죽',37.56373162612,126.98111460146,37.56390500000024,37.56390500000024,286.03,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (134,'배부장김치찌개',37.563791832774,126.97928265099,37.56390500000024,37.56390500000024,124.55,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (142,'을지고깃집',37.564615998958,126.98206477432,37.56390500000024,37.56390500000024,377.49,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (152,'윤씨돈까스',37.549284917579,126.97511479519,37.550392700000224,37.550392700000224,291.15,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (167,'친구분식',37.552185111546,126.97750751092,37.550392700000224,37.550392700000224,514.86,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (175,'남산왕돈까스',37.551523940065,126.98113736041,37.550392700000224,37.550392700000224,804.6,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (184,'포베이',37.551214720127,126.97961307357,37.550392700000224,37.550392700000224,666.64,'아시안',10012);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (6,'a중국집',37.4809094,126.9520957,37.3614587278,37.3614587278,13426.23,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (7,'b중국집',37.4797029,126.9527655,37.3572746,37.3572746,13752.6,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (8,'안래홍',37.571660786519,126.98265199609,37.3572746,37.3572746,24275.9,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (10,'털보네즉석우동',37.503848417366,126.90265388424,37.50064696263,37.50064696263,1529.72,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (16,'푸라닭신길점',37.50604984014,126.9056347385,37.50064696263,37.50064696263,1364.17,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (18,'BBQ 신길뉴타운점 ',37.498619183606,126.91443186976,37.50064696263,37.50064696263,502.26,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (21,'곰집칼국수',37.510857444012,126.91712445032,37.50064696263,37.50064696263,1154.79,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (23,'레이그루브',37.514886085651,126.91724777522,37.50064696263,37.50064696263,1595.87,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (29,'박가부대 신길점',37.506263169782,126.91120319035,37.50064696263,37.50064696263,963.38,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (34,'샐러드베이',37.499714780653,126.91901497984,37.50064696263,37.50064696263,112.8,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (56,'차이797',37.573086957124,126.97448488201,37.575384699999816,37.575384699999816,1157.82,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (60,'효도치킨',37.574577634041,126.971049716,37.575384699999816,37.575384699999816,831.41,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (65,'라면점빵',37.572871456187,126.96946542422,37.575384699999816,37.575384699999816,741.61,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (70,'파파존스',37.572864439313,126.96063393025,37.575384699999816,37.575384699999816,294.73,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (75,'장군보쌈',37.575685966577,126.97123092158,37.575384699999816,37.575384699999816,843.18,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (80,'본도시락',37.573898277022,126.9731314753,37.575384699999816,37.575384699999816,1023.44,'도시락',10014);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (83,'A돈까스',37.57482247638,126.95861006978,37.576780899999754,37.576780899999754,457.91,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (88,'비비큐',37.57714233243,126.96109747642,37.576780899999754,37.576780899999754,623.3,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (93,'산채밥상',37.578014025955,126.96020177462,37.576780899999754,37.576780899999754,560.11,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (98,'맛나분식',37.575985658016,126.96195887897,37.576780899999754,37.576780899999754,703.5,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (103,'백채김치찌개',37.575668102432,126.95810523062,37.574236220301,37.574236220301,392.11,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (108,'빕스',37.576127619426,126.95795293708,37.574236220301,37.574236220301,403.97,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (112,'롯데리아',37.574732098237,126.96161448099,37.574236220301,37.574236220301,669.86,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (117,'미미락',37.563703323467,126.9810996235,37.56390500000024,37.56390500000024,284.94,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (122,'북창국수',37.562944690324,126.98078708113,37.56390500000024,37.56390500000024,277.85,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (137,'피자나라치킨공주',37.563588093431,126.97962701953,37.56390500000024,37.56390500000024,158.24,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (155,'해당반점',37.548457983754,126.98055588094,37.550392700000224,37.550392700000224,773.96,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (160,'후암백반',37.546466738792,126.97663180093,37.550392700000224,37.550392700000224,590.42,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (165,'탐앤탐스',37.547848249817,126.98179863248,37.550392700000224,37.550392700000224,898.71,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (173,'남산피자',37.551745401268,126.97776142011,37.550392700000224,37.550392700000224,519.37,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (178,'후암촌',37.550971468456,126.98031140827,37.550392700000224,37.550392700000224,724.76,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (185,'베트남식당',37.551316854815,126.97950026685,37.550392700000224,37.550392700000224,658.46,'아시안',10012);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (198,'신당동떡볶이',37.562361843504,127.01169469497,37.55489750000009,37.55489750000009,1290.47,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (205,'태국음식점',37.565229971037,127.01239763824,37.564435673653,37.564435673653,89.14,'아시안',10012);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (12,'내사랑돈까스',37.49610268017,126.90854923973,37.50064696263,37.50064696263,1091.71,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (13,'소용반점',37.512550950668,126.91847378341,37.50064696263,37.50064696263,1326.81,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (19,'옛집',37.498954567791,126.91215875775,37.50064696263,37.50064696263,676.04,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (25,'배떡 신길점 ',37.503854064424,126.92078695899,37.50064696263,37.50064696263,373.71,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (27,'우리할매떡볶이 신풍역점',37.500284525655,126.91401170956,37.50064696263,37.50064696263,487.53,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (32,'피자스쿨 신길점',37.514355641236,126.91905941497,37.50064696263,37.50064696263,1524.8,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (53,'칸다소바',37.581872386597,126.97148833982,37.575384699999816,37.575384699999816,1126.44,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (58,'취천루',37.578287825647,126.97108388688,37.575384699999816,37.575384699999816,890.13,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (63,'나무사이로',37.574621431771,126.97094854142,37.575384699999816,37.575384699999816,822.03,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (67,'바르다김선생',37.573898277022,126.9731314753,37.575384699999816,37.575384699999816,1023.44,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (73,'대하식당',37.578910361517,126.97042329206,37.575384699999816,37.575384699999816,865.23,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (77,'KFC',37.571566330244,126.97596644607,37.575384699999816,37.575384699999816,1329.47,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (81,'도시락카페',37.58071910565,126.96996578023,37.575384699999816,37.575384699999816,941.36,'도시락',10014);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (86,'홍콩반점',37.573504919063,126.96038713261,37.576780899999754,37.576780899999754,667.56,'중식',1002);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (90,'굽네치킨',37.5748404666,126.95776821101,37.576780899999754,37.576780899999754,393.13,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (96,'투썸플레이스',37.573941527995,126.96080122954,37.576780899999754,37.576780899999754,674.38,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (101,'고등어찜',37.574615768961,126.95815930714,37.574236220301,37.574236220301,365.54,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (106,'강정구의피자생각',37.577346042328,126.96148368079,37.574236220301,37.574236220301,741.59,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (115,'김밥천국',37.575784280459,126.95664844244,37.574236220301,37.574236220301,287.24,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (120,'BBQ',37.563938366363,126.98059590751,37.56390500000024,37.56390500000024,239.69,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (127,'커피그루나루',37.563757087548,126.97881046226,37.56390500000024,37.56390500000024,83.93,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (130,'마녀김밥',37.564218258924,126.97970187727,37.56390500000024,37.56390500000024,164.59,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (141,'부안집',37.563503090146,126.97970288942,37.56390500000024,37.56390500000024,167.04,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (143,'소공촌',37.565510846996,126.98102353215,37.56390500000024,37.56390500000024,329.85,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (148,'노브랜드버거',37.563802428977,126.98041487205,37.56390500000024,37.56390500000024,224,'페스트푸드',10013);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (153,'겐로쿠우동',37.547332735692,126.97763481369,37.550392700000224,37.550392700000224,593.23,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (158,'푸라닭',37.547475580132,126.9799319531,37.550392700000224,37.550392700000224,761.05,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (162,'할매국수',37.54657896865,126.9773370046,37.550392700000224,37.550392700000224,625.42,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (181,'자연보쌈',37.551581023868,126.97946793064,37.550392700000224,37.550392700000224,660.89,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (191,'황학일식',37.566872021939,127.02338431986,37.55489750000009,37.55489750000009,2418.05,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (196,'할리스',37.564898708668,127.02627952372,37.55489750000009,37.55489750000009,2531.06,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (200,'놀부부대찌개',37.564331873278,127.01159826823,37.564435673653,37.564435673653,83.32,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (11,'노가네우동',37.512048912989,126.91584761434,37.50064696263,37.50064696263,1308.5,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (17,'교촌치킨 신길점',37.502951097212,126.92120255317,37.50064696263,37.50064696263,296.1,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (22,'스타벅스 신길점',37.504619896842,126.91019450841,37.50064696263,37.50064696263,933.68,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (24,'커피나무 보라매역',37.499182314383,126.92010141989,37.50064696263,37.50064696263,170.75,'카페·디저트',1005);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (30,'도미노피자 대방점',37.505604954695,126.92230322175,37.50064696263,37.50064696263,603.49,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (35,'파스타입니다',37.506277278614,126.92203422001,37.50064696263,37.50064696263,664.17,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (55,'시카노이에',37.573203751188,126.96845237993,37.575384699999816,37.575384699999816,644.99,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (61,'치킨인더키친',37.577936280521,126.97220269291,37.575384699999816,37.575384699999816,970.53,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (68,'피자스쿨',37.577758566859,126.97185766293,37.575384699999816,37.575384699999816,935.73,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (71,'토속촌',37.581786310481,126.9714858729,37.575384699999816,37.575384699999816,1120.17,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (84,'무악돈까스',37.5748404666,126.95776821101,37.576780899999754,37.576780899999754,393.13,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (89,'네네치킨',37.574236220301,126.95839060509,37.576780899999754,37.576780899999754,476.56,'치킨',1003);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (99,'아빠분식',37.574793051979,126.95807215173,37.576780899999754,37.576780899999754,418.54,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (104,'피자헛',37.575668102432,126.95810523062,37.574236220301,37.574236220301,392.11,'피자',1008);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (110,'벌집삼겹살',37.57476316692,126.9593421214,37.574236220301,37.574236220301,470.99,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (118,'소공일식',37.563802428977,126.98041487205,37.56390500000024,37.56390500000024,224,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (123,'원할머니국수',37.56359907165,126.97997414384,37.56390500000024,37.56390500000024,187.97,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (133,'이바돔감자탕',37.563938366363,126.98059590751,37.56390500000024,37.56390500000024,239.69,'찜·탕·찌개',1007);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (140,'종로경양식',37.563154942244,126.9800153111,37.56390500000024,37.56390500000024,206.12,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (145,'원할머니보쌈',37.563647737909,126.98092354569,37.56390500000024,37.56390500000024,270.06,'족발·보쌈',10011);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (151,'용산일식',37.548851800856,126.98201560131,37.550392700000224,37.550392700000224,888.81,'돈까스·회·일식',1001);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (161,'아빠백반',37.547482236136,126.97794335438,37.550392700000224,37.550392700000224,606.68,'백반·죽·국수',1004);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (166,'청년다방',37.553465473275,126.97811296986,37.550392700000224,37.550392700000224,628.98,'분식',1006);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (174,'남산양식',37.551121566407,126.98145909504,37.550392700000224,37.550392700000224,827.05,'양식',1009);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (179,'용산고깃집',37.550088106107,126.97999918225,37.550392700000224,37.550392700000224,695.21,'고기·구이',10010);
Insert into DELIVERY.RCOORDI (RESNO,RESNAME,RESLAT,RESLON,MYLAT,MYLON,RESDIST,CATEGORY,CATE_NO) values (183,'타이포',37.551095798903,126.97967019789,37.550392700000224,37.550392700000224,669.95,'아시안',10012);

commit;

CREATE TABLE  PICKUPPLACE(
    CUSNAME VARCHAR2(10 CHAR) CONSTRAINT CUSNAME_PICKUPPLACE_PK PRIMARY KEY,
    CUSID VARCHAR2(15 CHAR) CONSTRAINT ID_pickupPlace_NN NOT NULL ENABLE, 
    PICKUPLAT NUMBER CONSTRAINT LAT_pickupPlace_NN NOT NULL ENABLE, 
    PICKUPLON NUMBER CONSTRAINT LON_pickupPlace_NN NOT NULL ENABLE, 
    CUS_LAT NUMBER CONSTRAINT cLAT_pickupPlace_NN NOT NULL ENABLE, 
    CUS_LON NUMBER CONSTRAINT cLON_pickupPlace_NN NOT NULL ENABLE, 
    DISTANCE NUMBER CONSTRAINT DIST_pickupPlace_NN NOT NULL ENABLE
);

Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('보라매역','YHLEE',37.499855465771,126.92060923706,37.50064696263,126.91951962334,130.32);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('사직단','dool',37.575791319905,126.96870586958,37.575384699999816,126.96167029999923,621.64);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('경복궁역','dool',37.57557082171,126.97330778814,37.575384699999816,126.96167029999923,1025.74);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('무악재역','hui',37.582561834301,126.95017035418,37.576780899999754,126.95403900000007,727.58);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('광화문우체국','HONG',37.570013917406,126.9780542555,37.56390500000024,126.97787669999931,679.43);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('숙대입구역','call',37.545499859161,126.97216591319,37.550392700000224,126.97212219999993,544.05);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('약수역','jennie',37.554124490755,127.01025330126,37.55489750000009,127.00048369999965,865.45);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('신풍역','aeb320',37.50016518673,126.90903453451,37.498628104654,126.90804280599,192);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('신길5동우체국','aeb320',37.498477701477,126.90806625532,37.498628104654,126.90804280599,500);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('신길역','YHLEE',37.517688232974,126.91427854285,37.50064696263,126.91951962334,1950.39);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('정부청사','dool',36.4383354,126.9018892,37.575384699999816,126.96167029999923,126539.4);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('무악공원','hui',37.576084140052,126.95911825248,37.576780899999754,126.95403900000007,454.25);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('세종문화회관','HONG',37.572009887822,26.97630706472,37.56390500000024,126.97787669999931,8314117.95);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('삼광초등학교','call',37.546646838565,126.9766344795,37.550392700000224,126.97212219999993,575.94);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('버티고개역','jennie',37.547943570723,127.00697726349,37.55489750000009,127.00048369999965,962.03);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('대방역','YHLEE',37.513379538688,126.92652335463,37.50064696263,126.91951962334,1544.64);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('서대문역','hui',37.574379813301,126.95782423784,37.576780899999754,126.95403900000007,427.25);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('서울시청','HONG',37.566205021936,126.97770627907,37.56390500000024,126.97787669999931,256.18);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('후암초등학교','call',37.551405239218,126.98159679014,37.550392700000224,126.97212219999993,842.76);
Insert into DELIVERY.PICKUPPLACE (CUSNAME,CUSID,PICKUPLAT,PICKUPLON,CUS_LAT,CUS_LON,DISTANCE) values ('장원중학교','jennie',37.55365335367,127.00627186623,37.55489750000009,127.00048369999965,528.64);

commit;

-- 댓글
CREATE TABLE reboard(
	rbno NUMBER(6)
		CONSTRAINT RBRD_NO_PK PRIMARY KEY,
	upno NUMBER(6),
    brdno NUMBER(4)
        CONSTRAINT RBRD_BRDNO_NN NOT NULL
        CONSTRAINT RBRD_BRDNO_FK REFERENCES board(bno),
	rbmno NUMBER(4)
		CONSTRAINT RBRD_MNO_FK REFERENCES member(mno)
		CONSTRAINT RBRD_MNO_NN NOT NULL,
    body VARCHAR2(200 CHAR)
        CONSTRAINT RBRD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT RBRD_DATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RBRD_SHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT RBRD_SHOW_NN NOT NULL
    );

-- faq
CREATE TABLE FAQ
(NO NUMBER CONSTRAINT NO_FAQ_PK PRIMARY KEY,
ID VARCHAR2(20 char) CONSTRAINT ID_FAQ_NN NOT NULL,
PW VARCHAR2(20 char) CONSTRAINT PW_FAQ_NN NOT NULL,
TITLE VARCHAR2(50 CHAR) CONSTRAINT TITLE_FAQ_NN NOT NULL,
CONTENT VARCHAR2(1000 CHAR) CONSTRAINT CONTENT_FAQ_NN NOT NULL,
WDATE DATE DEFAULT SYSDATE);

CREATE SEQUENCE FAQ_SEQ
START WITH 1
NOMAXVALUE
NOCYCLE;


Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','배달 장소 선택 방법','배달 장소 선택 방법에 대해서 안내드립니다.<br> 메뉴>내위치 메뉴에서 정확한 위치정보를 입력 후 하단 카테고리를 선택바랍니다. <br>감사합니다.',to_date('22/07/18','RR/MM/DD'));
Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','회원가입 하는 방법','회원가입 방법에 대해서 안내드립니다. <br>먼저 회원가입 페이지 접속>회원가입을 해주시면 됩니다.<br> 필히 현재 사는 주거지에 대한 정확한 정보를 기입 바랍니다.<br> 감사합니다.',to_date('22/07/17','RR/MM/DD'));
Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','접속 오류시 방법','안녕하세요 접속오류시 방법에 대해서 설명드립니다.<br> 당사 cs팀에 연락(02-000-0000) 후 원격서비스를 신청하십시오. <br> 감사합니다. ',to_date('22/07/18','RR/MM/DD'));

--pickup
create table pickup (
    name varchar2(10 char) constraint name_pickup_pk primary key,
    address varchar2(30 char)constraint address_pickup_nn not null constraint address_pickup_uk unique,
    pickuplat number constraint lat_pickup_nn not null,
    pickuplon number constraint lon_pickup_nn not null
);


Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('경복궁역','서울 종로구 사직로 지하 130',37.57557082171,126.97330778814);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('광화문우체국','서울 종로구 종로 6',37.570013917406,126.9780542555);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('대방역','서울 영등포구 여의대방로 300',37.513379538688,126.92652335463);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('무악공원','서울 종로구 통일로18길 34',37.576084140052,126.95911825248);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('무악재역','서울 서대문구 통일로 지하 361',37.582561834301,126.95017035418);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('버티고개역','서울 중구 다산로 지하 38',37.547943570723,127.00697726349);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('보라매역','서울 동작구 상도로 지하 2',37.499855465771,126.92060923706);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('사직단','서울 종로구 사직로 89',37.575791319905,126.96870586958);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('삼광초등학교','서울 용산구 두텁바위로1나길 19',37.546646838565,126.9766344795);

Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서대문역','서울특별시 서대문구 통일로 지하 126',37.56577,126.96665);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서울시청','서울 중구 세종대로 110',37.566205021936,126.97770627907);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('세종문화회관','서울 종로구 세종대로 175',37.572009887822,26.97630706472);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('숙대입구역','서울 용산구 한강대로 지하 306',37.545499859161,126.97216591319);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길5동우체국','서울 영등포구 신길로 65',37.498477701477,126.90806625532);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길역','서울 영등포구 영등포로 327',37.517688232974,126.91427854285);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신풍역','서울 영등포구 신풍로 지하 27',37.50016518673,126.90903453451);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('약수역','서울 중구 다산로 지하 122',37.554124490755,127.01025330126);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('장원중학교','서울 중구 동호로15길 93-34',37.55365335367,127.00627186623);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('정부청사','서울 종로구 세종대로 209',36.4383354,126.9018892);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('후암초등학교','서울 용산구 두텁바위로 140',37.551405239218,126.98159679014);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길3동주민센터','서울특별시 영등포구 신길로41라길 13-8',37.507263,126.9077281);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('우신초등학교','서울특별시 영등포구 신길로 190',37.5092628,126.9117832);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('해군중앙교회','서울특별시 영등포구 신길동 1795-1',37.5047635,126.9163939);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('소공동 주민센터','서울특별시 중구 남대문로1길 31-5',37.5623964,126.9770253);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서울시립미술관','서울특별시 중구 덕수궁길 61',37.5640625,126.9738125);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('을지로입구역','서울특별시 중구 을지로동 42',37.566065,126.982679);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('명동역','서울특별시 중구 충무로2가',37.5609892,126.9861868);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('후암동우체국','서울특별시 용산구 후암동 22',37.5510955,126.9773096);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('쉐라톤 조선 서울역','서울특별시 용산구 한강대로 366',37.5509795,126.9727511);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('용산고등학교','서울특별시 용산구 두텁바위로 60',37.5509795,126.9727511);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('독립문역','서울특별시 종로구 통일로 지하 247',37.574453,126.957918);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('약수동 주민센터','서울특별시 중구 다산로 92',37.552549,127.0089535);

-- admin
CREATE TABLE ADMIN
(ID VARCHAR2(15 CHAR) CONSTRAINT ID_ADMIN_PK PRIMARY KEY,
PW VARCHAR2(15 char) CONSTRAINT PW_ADMIN_NN NOT NULL);

INSERT INTO ADMIN VALUES('ADMIN1','1111');
INSERT INTO ADMIN VALUES('ADMIN2','2222');
INSERT INTO ADMIN VALUES('ADMIN3','3333');
INSERT INTO ADMIN VALUES('ADMIN4','4444');
INSERT INTO ADMIN VALUES('ADMIN5','5555');


-- estitable
CREATE TABLE estitable(
    etbno NUMBER(4)
        CONSTRAINT ETB_BNO_FK REFERENCES board(bno)
        CONSTRAINT ETB_BNO_NN NOT NULL,
    etida VARCHAR2(10 CHAR)
        CONSTRAINT ETB_IDA_NN NOT NULL
        CONSTRAINT ETB_IDA_FK REFERENCES member(id),
    etidb VARCHAR2(10 CHAR)
        CONSTRAINT ETB_IDB_NN NOT NULL
        CONSTRAINT ETB_IDB_FK REFERENCES member(id),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT ETB_SHOW_NN NOT NULL
        CONSTRAINT ETB_SHOW_CK CHECK(isshow IN('Y','N'))
);



commit;



