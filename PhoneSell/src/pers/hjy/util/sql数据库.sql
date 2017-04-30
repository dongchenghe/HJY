prompt PL/SQL Developer import file
prompt Created on 2017��4��19�� by HDC
set feedback off
set define off
prompt Creating CART...
create table CART
(
  cart_id NUMBER not null,
  user_id NUMBER not null,
  good_id NUMBER,
  count   NUMBER
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CART
  add constraint P_CART_ID primary key (CART_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating GOODS...
create table GOODS
(
  goods_id    NUMBER not null,
  name        VARCHAR2(60) not null,
  price       NUMBER not null,
  detaile     VARCHAR2(150),
  count_name  VARCHAR2(6) not null,
  img_src     VARCHAR2(100),
  is_ground   VARCHAR2(100) default 0,
  ground_date DATE,
  remark      VARCHAR2(100) not null
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column GOODS.goods_id
  is '��Ʒid';
comment on column GOODS.name
  is '��Ʒ����';
comment on column GOODS.price
  is '�۸�';
comment on column GOODS.detaile
  is '��ϸ����';
comment on column GOODS.count_name
  is '������';
comment on column GOODS.img_src
  is 'ͼƬ��ַ';
comment on column GOODS.is_ground
  is '�Ƿ��¼ܣ�0����Ч��1����Ч��Ĭ��0';
comment on column GOODS.ground_date
  is '�ϼ�ʱ��';
comment on column GOODS.remark
  is '��ע';
alter table GOODS
  add constraint P_GOOD_ID primary key (GOODS_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ORDERS...
create table ORDERS
(
  order_id     NUMBER not null,
  user_id      NUMBER not null,
  order_tatal  NUMBER,
  create_date  DATE not null,
  addr_id      NUMBER not null,
  pay_way      VARCHAR2(1),
  pay_date     DATE,
  t_date       DATE,
  true_user_id NUMBER,
  send_date    DATE,
  send_user_id NUMBER,
  over_date    DATE,
  order_state  VARCHAR2(1) default 0 not null,
  remark       VARCHAR2(100)
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column ORDERS.order_id
  is '����ID';
comment on column ORDERS.user_id
  is '�û�ID';
comment on column ORDERS.order_tatal
  is '�����ܽ��';
comment on column ORDERS.create_date
  is '�µ�ʱ��';
comment on column ORDERS.addr_id
  is '������ϢID';
comment on column ORDERS.pay_way
  is '����֧����0�����ֽ�֧����1��';
comment on column ORDERS.pay_date
  is '����ʱ��';
comment on column ORDERS.t_date
  is '����ȷ��ʱ��';
comment on column ORDERS.true_user_id
  is 'ȷ��Ա��ID';
comment on column ORDERS.send_date
  is '����ʱ��';
comment on column ORDERS.send_user_id
  is '����Ա��ID';
comment on column ORDERS.over_date
  is '�ջ�ʱ��';
comment on column ORDERS.order_state
  is '����״̬(0:���µ�;1:�Ѹ���;2:��ȷ��;3:�ѽ���;4:���ջ�;5:��ȡ��;6����ȡ��)';
comment on column ORDERS.remark
  is '��ע';
alter table ORDERS
  add constraint P_ORDERS_ID primary key (ORDER_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating ORDER_DETAIL...
create table ORDER_DETAIL
(
  order_detail_id NUMBER not null,
  order_id        NUMBER,
  good_id         NUMBER,
  price           NUMBER,
  count           NUMBER,
  remark          VARCHAR2(100)
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column ORDER_DETAIL.order_detail_id
  is '����ID';
comment on column ORDER_DETAIL.order_id
  is '����ID';
comment on column ORDER_DETAIL.good_id
  is '��ƷID';
comment on column ORDER_DETAIL.price
  is '�۸�';
comment on column ORDER_DETAIL.count
  is '��Ʒ����';
comment on column ORDER_DETAIL.remark
  is '��ע';
alter table ORDER_DETAIL
  add constraint P_ODER_DETAIL_ID primary key (ORDER_DETAIL_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating STAFF_USER...
create table STAFF_USER
(
  user_id  NUMBER not null,
  name     VARCHAR2(30) not null,
  password VARCHAR2(20) not null,
  tell     VARCHAR2(20),
  addr     VARCHAR2(100),
  remark   VARCHAR2(100)
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column STAFF_USER.user_id
  is '����ID';
comment on column STAFF_USER.name
  is 'Ա����';
comment on column STAFF_USER.password
  is '����';
comment on column STAFF_USER.tell
  is 'Ա���绰';
comment on column STAFF_USER.addr
  is 'Ա����ַ
';
comment on column STAFF_USER.remark
  is '��ע
';
alter table STAFF_USER
  add constraint P_STAFF_USER primary key (USER_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255;

prompt Creating T_USER...
create table T_USER
(
  user_id      NUMBER not null,
  user_name    VARCHAR2(30) not null,
  user_pwd     VARCHAR2(20) not null,
  sex          VARCHAR2(1),
  tell         VARCHAR2(20),
  phone_nubmer VARCHAR2(20),
  create_date  DATE,
  "IS_ VALID"  VARCHAR2(1),
  addr_id      NUMBER,
  remark       VARCHAR2(100)
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column T_USER.user_id
  is '����ID';
comment on column T_USER.user_name
  is '�û��ǳ�';
comment on column T_USER.user_pwd
  is '����';
comment on column T_USER.sex
  is '�Ա�';
comment on column T_USER.tell
  is '�û��绰';
comment on column T_USER.phone_nubmer
  is '�û��ֻ�����';
comment on column T_USER.create_date
  is '����ʱ��';
comment on column T_USER."IS_ VALID"
  is '�Ƿ���Ч';
comment on column T_USER.addr_id
  is '������ϢID';
comment on column T_USER.remark
  is '��ע';
alter table T_USER
  add constraint P_USER_ID primary key (USER_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USER_ADDR...
create table USER_ADDR
(
  addr_id  NUMBER not null,
  user_id  NUMBER not null,
  receiver VARCHAR2(20) not null,
  tell     VARCHAR2(20) not null,
  addr     VARCHAR2(100) not null,
  remark   VARCHAR2(100) not null
)
tablespace USER_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column USER_ADDR.addr_id
  is '����ID';
comment on column USER_ADDR.user_id
  is '�û�ID';
comment on column USER_ADDR.receiver
  is '�ռ�������';
comment on column USER_ADDR.tell
  is '���͵绰';
comment on column USER_ADDR.addr
  is '���͵�ַ';
comment on column USER_ADDR.remark
  is '��ע';
alter table USER_ADDR
  add constraint P_ADDR_ID primary key (ADDR_ID)
  using index 
  tablespace USER_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Loading CART...
prompt Table is empty
prompt Loading GOODS...
prompt Table is empty
prompt Loading ORDERS...
prompt Table is empty
prompt Loading ORDER_DETAIL...
prompt Table is empty
prompt Loading STAFF_USER...
prompt Table is empty
prompt Loading T_USER...
insert into T_USER (user_id, user_name, user_pwd, sex, tell, phone_nubmer, create_date, "IS_ VALID", addr_id, remark)
values (1000, 'admin', 'admin', '1', null, '15576074148', null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading USER_ADDR...
insert into USER_ADDR (addr_id, user_id, receiver, tell, addr, remark)
values (1000, 111, 'sdfsd', 'dsfad', 'fad', 'dfad');
commit;
prompt 1 records loaded
set feedback on
set define on
prompt Done.
