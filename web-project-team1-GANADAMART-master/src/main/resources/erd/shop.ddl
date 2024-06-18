DROP TABLE cs CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE ship CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product_option CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

CREATE TABLE userinfo(
		u_id                          		VARCHAR2(100)		 NULL ,
		u_pass                        		VARCHAR2(100)		 NULL ,
		u_name                        		VARCHAR2(100)		 NULL ,
		u_addr                        		VARCHAR2(100)		 NULL ,
		u_phone                       		VARCHAR2(100)		 NULL ,
		u_email                       		VARCHAR2(100)		 NULL ,
		u_dob                         		VARCHAR2(100)		 NULL 
);


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(100)		 NULL ,
		p_count                       		NUMBER(10)		 NULL ,
		p_price                       		NUMBER(10)		 NULL ,
		p_img                         		VARCHAR2(2000)		 NULL ,
		p_category                    		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;

CREATE TABLE product_option(
		po_no                         		NUMBER(10)		 NULL ,
		po_size                       		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_option_po_no_SEQ;

CREATE SEQUENCE product_option_po_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		c_no                          		NUMBER(10)		 NULL ,
		c_qty                         		NUMBER(10)		 NULL ,
		po_no                         		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE cart_c_no_SEQ;

CREATE SEQUENCE cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		o_addr                        		VARCHAR2(100)		 NULL ,
		o_name                        		VARCHAR2(100)		 NULL ,
		o_phone                       		VARCHAR2(100)		 NULL ,
		o_payment                     		VARCHAR2(100)		 NULL ,
		o_img                         		VARCHAR2(2000)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		u_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 DEFAULT 1		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		po_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE board(
		b_no                          		NUMBER(10)		 NULL ,
		b_title                       		VARCHAR2(100)		 NULL ,
		b_content                     		VARCHAR2(3000)		 NULL ,
		b_readcount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		b_date                        		DATE		 DEFAULT sysdate		 NULL ,
		b_groupno                     		NUMBER(10)		 NULL ,
		b_step                        		NUMBER(10)		 DEFAULT 1		 NULL ,
		b_depth                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		u_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE board_b_no_SEQ;

CREATE SEQUENCE board_b_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE ship(
		s_no                          		NUMBER(10)		 NULL ,
		s_name                        		VARCHAR2(100)		 NULL ,
		s_phone                       		VARCHAR2(100)		 NULL ,
		s_addr                        		VARCHAR2(100)		 NULL ,
		u_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE ship_s_no_SEQ;

CREATE SEQUENCE ship_s_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_content                     		VARCHAR2(3000)		 NULL ,
		r_date                        		DATE		 NULL ,
		u_id                          		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL,
		r_rating							NUMBER(10)		NULL
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE cs(
		cs_no                         		NUMBER(10)		 NULL ,
		cs_title                      		VARCHAR2(100)		 NULL ,
		cs_content                    		VARCHAR2(3000)		 NULL ,
		cs_readcount                   		NUMBER(10)		 DEFAULT 0		 NULL ,
		cs_date                        		DATE		 DEFAULT sysdate		 NULL ,
		cs_groupno                    		NUMBER(10)		 NULL ,
		cs_step                       		NUMBER(10)		 DEFAULT 1		 NULL ,
		cs_depth                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		u_id                          		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE cs_cs_no_SEQ;

CREATE SEQUENCE cs_cs_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE userinfo ADD CONSTRAINT IDX_userinfo_PK PRIMARY KEY (u_id);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE product_option ADD CONSTRAINT IDX_product_option_PK PRIMARY KEY (po_no);
ALTER TABLE product_option ADD CONSTRAINT IDX_product_option_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (po_no) REFERENCES product_option (po_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (po_no) REFERENCES product_option (po_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (o_no) REFERENCES orders (o_no) on delete cascade;

ALTER TABLE board ADD CONSTRAINT IDX_board_PK PRIMARY KEY (b_no);
ALTER TABLE board ADD CONSTRAINT IDX_board_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;

ALTER TABLE ship ADD CONSTRAINT IDX_ship_PK PRIMARY KEY (s_no);
ALTER TABLE ship ADD CONSTRAINT IDX_ship_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

ALTER TABLE cs ADD CONSTRAINT IDX_cs_PK PRIMARY KEY (cs_no);
ALTER TABLE cs ADD CONSTRAINT IDX_cs_FK0 FOREIGN KEY (u_id) REFERENCES userinfo (u_id) on delete cascade;
