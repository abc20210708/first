


-----------------------1. ��(���̺��: customer) -----------------------

--DROP TABLE customer;

SELECT * FROM customer;

SELECT * FROM customer WHERE customer_id = '950107';

CREATE TABLE customer (
    customer_id VARCHAR2(50) CONSTRAINT customer_id_pk PRIMARY KEY,
    customer_pw VARCHAR2(500) NOT NULL,
    customer_name VARCHAR2(10) NOT NULL,
    customer_gender VARCHAR2(10) NOT NULL,
    customer_phone VARCHAR2(20) NOT NULL,
    customer_post_code NUMBER(5) NOT NULL, --�����ȣ
    customer_road_addr VARCHAR2(100) NOT NULL, --���θ��ּ�
    customer_lot_num_addr VARCHAR2(100) NOT NULL, --�����ּ�
    customer_extra_addr VARCHAR2(100), --���ּ�
    customer_birth DATE
);


-----------------------1-1 �� DUMMY DATA INPUT  -----------------------
INSERT INTO customer VALUES
('water@naver.com','1111','������','����','010-8899-1010','32311',
'���������� ���� �л�� 100','���������� ���� �л굿 1420','����������û','1980-11-11');

INSERT INTO customer VALUES
('tablo@gmail.com','2222','�̼���','����','010-2525-2002','05540',
'����Ư���� ���ı� �ø��ȷ� 424','����Ư���� ���ı� ���̵� 88','�ø��Ȱ���','1990-07-22');

INSERT INTO customer VALUES
('crystal@hanmail.net','3333','������','����','010-5557-3309','03062',
'���� ���α� ��û�� 30','���� ���α� �Ұݵ� 165-10','��������̼���','1994-10-24');

INSERT INTO customer VALUES
('yeseul@naver.com','4444','�ѿ���','����','010-0900-4457','05051',
'���� ���ı� ��ǵ�','���� ���ı� ��ǵ�','����ȣ��','1981-09-18');




-----------------------2. ������(���̺��: admin) -----------------------
--DROP TABLE admin;

SELECT * FROM admin;

CREATE TABLE admin (
    admin_id VARCHAR2(50) CONSTRAINT admin_id_pk PRIMARY KEY,
    admin_pw VARCHAR2(500) NOT NULL,
    admin_name VARCHAR2(10) NOT NULL
);

-----------------------2-1 ������ DUMMY DATA INPUT  -----------------------

INSERT INTO admin VALUES
('mithra@naver.com','1111','����');

INSERT INTO admin VALUES
('justhis@gmail.com','2222','���');

INSERT INTO admin VALUES
('giriboy@naver.com','3333','ȫ�ÿ�');


-----------------------3. ī�װ�(���̺��: category) -----------------------

--DROP TABLE category;
--DROP SEQUENCE seq_cate_code;

CREATE SEQUENCE seq_cate_code;

SELECT * FROM category;

CREATE TABLE category (
    cate_code NUMBER(10) CONSTRAINT cate_code_pk PRIMARY KEY,
    cate_name VARCHAR2(20) NOT NULL,
    cate_code_ref VARCHAR2(20) --���� ī�װ�
);


-----------------------3-1 ī�װ� DUMMY DATA INPUT  -----------------------

INSERT INTO 
    category(cate_code,cate_name)
    VALUES(seq_cate_code.nextval,'tableware');
    
INSERT INTO category VALUES(seq_cate_code.nextval,'��������', 'tableware');
INSERT INTO category VALUES(seq_cate_code.nextval,'��', 'tableware');
INSERT INTO category VALUES(seq_cate_code.nextval,'����', 'tableware');

-----------------------4. ��ǰ(���̺��: product) -----------------------

--DROP TABLE product;
--DROP SEQUENCE seq_product_code;

SELECT * FROM product;

CREATE SEQUENCE seq_product_code;

CREATE TABLE product (
    product_code NUMBER(10) CONSTRAINT product_code_pk PRIMARY KEY,
    cate_code NUMBER(2),
    product_name VARCHAR2(30) NOT NULL,
    product_price NUMBER(10) NOT NULL, 
    product_yn NUMBER(1) NOT NULL, --�Ǹſ��� (0,1)
    product_amount NUMBER(10), --�Ǹż���
    product_thumb VARCHAR2(500), --��ǰ�����
    product_img1 VARCHAR2(500),
    product_img2 VARCHAR2(500),
    product_img3 VARCHAR2(500),
    product_img4 VARCHAR2(500),
    product_img5 VARCHAR2(500),
    product_size VARCHAR2(200),
    product_color VARCHAR2(200),
    product_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_cate_code FOREIGN KEY (cate_code)
    REFERENCES category(cate_code)
);


alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

COMMIT;

-----------------------4-1 ��ǰ DUMMY DATA INPUT  -----------------------

INSERT INTO product (product_code, product_name, product_price, product_yn, product_amount, cate_code)
VALUES(seq_product_code.netxtval,'���� �ֹ��ǰ ���� ����',13000, 1, 100,4);

INSERT INTO product (product_code, product_name, product_price, product_yn, product_amount, cate_code)
VALUES(seq_product_code.netxtval,'���� ���� ������',8000, 1, 30, 3);


-----------------------5. ��������(���̺��: notice) -----------------------
--DROP TABLE notice;
--DROP SEQUENCE seq_notice;

SELECT * FROM notice;

CREATE SEQUENCE seq_notice;


CREATE TABLE notice (
    notice_code NUMBER(10) CONSTRAINT notice_code_pk PRIMARY KEY,
    notice_title VARCHAR2(50) NOT NULL,
    notice_cont VARCHAR2(500) NOT NULL,
    notice_date DATE DEFAULT SYSDATE,
    admin_id VARCHAR2(30)
);

-- FK ����
ALTER TABLE notice ADD CONSTRAINT FK_1_notice_admin_id
FOREIGN KEY (admin_id) REFERENCES admin(admin_id);


-----------------------5-1 �������� DUMMY DATA INPUT  -----------------------


INSERT  INTO notice (notice_code, notice_title, notice_cont, admin_id)
    VALUES
    (seq_notice.nextval,'�޴��� �����ȳ�',
    '�޴��� ������ ���, �̵���Ż��� ��å�� ���� ���� ����� ������ ������Ұ� �Ұ����մϴ�','mithra@naver.com');
    
INSERT  INTO notice (notice_code, notice_title, notice_cont, admin_id)
    VALUES
    (seq_notice.nextval,'��ȯ��ǰ �ȳ�',
    '��ǰ�� �ǵ������� �Ѽ��Ѱ��, ó���� �Ұ����ϸ�, ��ǰ���ݰ� ��ۺ� �������ּž��ϰ�_ �������ط� ó���˴ϴ�.','justhis@gmail.com');
    
INSERT  INTO notice (notice_code, notice_title, notice_cont, admin_id)
    VALUES
    (seq_notice.nextval,'��ü�ֹ� ���� �� Ŀ���� �ȳ�',
    '��ü �ֹ��ÿ� ���Ͻô� �۾� Ȥ�� �ΰ� �� �μ� ���� �����մϴ�.','giriboy@naver.com');    

-----------------------6. ��ٱ���(���̺��: cart) -----------------------

--DROP TABLE cart;

COMMIT;

CREATE SEQUENCE seq_cart;

SELECT * FROM cart;

SELECT *
        FROM cart
        WHERE
            customer_id = '950107';
        
            
 SELECT COUNT(c.product_code)AS CART_COUNT
        FROM
            customer m , cart c , product p
        WHERE
            p.product_code = c.product_code
        AND
            m.customer_id = c.customer_id
        AND
            m.customer_id = 'api@naver.com'
        AND
            p.product_code = 61;    
            
            


CREATE TABLE cart (
    cart_code NUMBER(10) CONSTRAINT cart_code_pk PRIMARY KEY,
    product_code NUMBER(10) NOT NULL,
    cart_amount NUMBER(10), --��ٱ��� ����
    cart_checked NUMBER(1), 
    cart_total_price NUMBER(10),
    customer_id VARCHAR(30),
    product_size VARCHAR2(200),
    product_color VARCHAR2(200)
);


-- FK ����
ALTER TABLE cart ADD CONSTRAINT FK_1_cart_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

    
--ALTER TABLE [���̺��] MODIFY ([�÷���] NOT NULL);
--ALTER TABLE cart MODIFY (product_code NOT NULL);

-- FK ����
ALTER TABLE cart ADD CONSTRAINT FK_2_cart_product_code
FOREIGN KEY (product_code) REFERENCES product(product_code);


-----------------------6-1 ��ٱ��� DUMMY DATA INPUT  -----------------------

INSERT INTO cart (cart_code, customer_id, product_code, cart_amount)
            VALUES (seq_cart.NEXTVAL, 'hashswan@naver.com', 27, 1);

-----------------------7. �ֹ�(���̺��: product_order) -----------------------

--DROP TABLE product_order;

COMMIT;

DELETE FROM product_order where order_code = 5;

CREATE SEQUENCE seq_product_order;

SELECT * FROM product_order;

CREATE TABLE product_order (
    order_code NUMBER(10) CONSTRAINT order_code_pk PRIMARY KEY,
    customer_id VARCHAR(30),
    customer_name VARCHAR2(10) NOT NULL, --������ �̸�
    customer_phone VARCHAR2(20) NOT NULL, 
    customer_post_code NUMBER(5) NOT NULL, --������ �����ȣ
    customer_road_addr VARCHAR2(100) NOT NULL, --������ ���θ��ּ�
    customer_lot_num_addr VARCHAR2(100) NOT NULL, --������ �����ּ�
    customer_extra_addr VARCHAR2(100) NOT NULL, --������ ���ּ�
    cart_code NUMBER(15),
    order_amount  NUMBER(10),
    product_name VARCHAR2(200),
    product_color VARCHAR2(200),
    product_size VARCHAR2(200),
    order_date DATE DEFAULT SYSDATE,--�ֹ���¥
    order_total_price NUMBER(20)NOT NULL, --�ֹ��ѱݾ�
    order_deli_price NUMBER(10)--��ۺ�
);

 -- order_status NUMBER(1) NOT NULL, --�ֹ� ����
--order_deli_code NUMBER(10) --�����ȣ
--order_request VARCHAR2(100), --��ۿ�û����


-- FK ����
ALTER TABLE product_order ADD CONSTRAINT FK_1_productOrder_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- FK ����
ALTER TABLE product_order ADD CONSTRAINT FK_2_productOrder_cart_code
FOREIGN KEY (cart_code) REFERENCES cart(cart_code);


-----------------------7-1 �ֹ� DUMMY DATA INPUT  -----------------------


-----------------------8. �ɼ�(���̺��: product_option) -----------------------
--DROP TABLE product_option;

CREATE SEQUENCE seq_option;

SELECT * FROM product_option;


CREATE TABLE product_option (
    option_code NUMBER(10) CONSTRAINT option_code_pk PRIMARY KEY,
    product_code NUMBER(10),
    cate_code NUMBER(15),
    product_color VARCHAR2(200),
    product_size VARCHAR2(200)
);

COMMIT;

-- FK ����
ALTER TABLE product_option ADD CONSTRAINT FK_1_product_option_pr_code
FOREIGN KEY (product_code) REFERENCES product(product_code);

-- FK ����
ALTER TABLE product_option ADD CONSTRAINT FK_2_product_option_cate_code
FOREIGN KEY (cate_code) REFERENCES category(cate_code);

-----------------------8-1. �ɼ� DUMMY DATA INPUT -----------------------

INSERT INTO product_option (option_code, product_code, cate_code, product_size)
            VALUES (seq_option.NEXTVAL, 1, 2, 'oneSize');




-----------------------9. ����(���̺��: review) -----------------------
--DROP TABLE review;

CREATE SEQUENCE seq_review_reply;

SELECT * FROM review;

CREATE TABLE review (
    review_code NUMBER(10) CONSTRAINT review_code_pk PRIMARY KEY,
    review_title VARCHAR2(20) NOT NULL,
    review_cont VARCHAR2(200) NOT NULL,
    review_img VARCHAR2(500),
    review_date DATE NOT NULL
);

--ALTER TABLE review MODIFY review_code NUMBER(10);

-- �÷� �߰�
ALTER TABLE review ADD product_code NUMBER(10);

-- FK ����
ALTER TABLE review ADD CONSTRAINT FK_1_review_product_code
FOREIGN KEY (product_code) REFERENCES product(product_code);

-- �÷� �߰�
ALTER TABLE review ADD cate_code VARCHAR2(10);

-- FK ����
ALTER TABLE review ADD CONSTRAINT FK_2_review_cate_code
FOREIGN KEY (cate_code) REFERENCES category(cate_code);


-----------------------9-1 ���� DUMMY DATA INPUT  -----------------------





-----------------------10. ���� ���(���̺��: review_reply) -----------------------
--DROP TABLE review_reply;

CREATE SEQUENCE seq_review_reply;

SELECT * FROM review_reply;

CREATE TABLE review_reply (
    review_reply_code NUMBER(10) CONSTRAINT review_reply_code_pk PRIMARY KEY,
    review_reply_title VARCHAR2(20) NOT NULL,
    review_reply_cont VARCHAR2(200) NOT NULL,
    review_reply_img VARCHAR2(500),
    review_reply_date DATE NOT NULL
);

-- �÷� �߰�
ALTER TABLE review_reply ADD review_code NUMBER(10);

-- FK ����
ALTER TABLE review_reply ADD CONSTRAINT FK_1_reviewReply_review_code
FOREIGN KEY (review_code) REFERENCES review(review_code);

-----------------------10-1 ���� ��� DUMMY DATA INPUT  -----------------------


-----------------------11. ������(���̺��: question) -----------------------
--DROP TABLE question;

CREATE SEQUENCE seq_question;

SELECT * FROM question;

CREATE TABLE question (
    question_code NUMBER(10) CONSTRAINT question_code_pk PRIMARY KEY,
    question_title VARCHAR2(20) NOT NULL,
    question_cont VARCHAR2(200) NOT NULL,
    question_img VARCHAR2(500),
    question_date DATE NOT NULL
);

-- �÷� �߰�
ALTER TABLE question ADD customer_id VARCHAR2(30);

-- FK ����
ALTER TABLE question ADD CONSTRAINT FK_1_question_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- �÷� �߰�
ALTER TABLE question ADD admin_id VARCHAR2(30);

-- FK ����
ALTER TABLE question ADD CONSTRAINT FK_2_question_customer_id
FOREIGN KEY (admin_id) REFERENCES admin(admin_id);


-----------------------11-1 ������ DUMMY DATA INPUT  -----------------------


-----------------------12. �亯(���̺��: answer) -----------------------
--DROP TABLE answer;

CREATE SEQUENCE seq_answer;

SELECT * FROM answer;

CREATE TABLE answer (
    answer_code NUMBER(10) CONSTRAINT answer_code_pk PRIMARY KEY,
    answer_title VARCHAR2(20) NOT NULL,
    answer_cont VARCHAR2(200) NOT NULL,
    answer_img VARCHAR2(500),
    answer_date DATE NOT NULL
);

-- �÷� �߰�
ALTER TABLE answer ADD question_code NUMBER(10);

-- FK ����
ALTER TABLE answer ADD CONSTRAINT FK_1_answer_question_code
FOREIGN KEY (question_code) REFERENCES question(question_code);

-----------------------12-1 �亯 DUMMY DATA INPUT  -----------------------


-----------------------13. ����(���̺��: pay) -----------------------
--DROP TABLE pay;

CREATE SEQUENCE seq_pay;

SELECT * FROM pay;

CREATE TABLE pay (
    pay_code NUMBER(2) CONSTRAINT pay_code_pk PRIMARY KEY,
    pay_price NUMBER(10) NOT NULL, --���� �ݾ�
    payment NUMBER(1) NOT NULL,
    paid NUMBER(1) NOT NULL, --��������
    refund NUMBER(1) --ȯ�ҿ���
);

-- �÷� �߰�
ALTER TABLE pay ADD order_code NUMBER(10);

-- FK ����
ALTER TABLE pay ADD CONSTRAINT FK_1_pay_order_code
FOREIGN KEY (order_code) REFERENCES product_order(order_code);

-----------------------13-1 ���� DUMMY DATA INPUT  -----------------------
