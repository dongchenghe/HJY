prompt PL/SQL Developer import file
prompt Created on 2017年4月19日 by HDC
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
  is '商品id';
comment on column GOODS.name
  is '商品名称';
comment on column GOODS.price
  is '价格';
comment on column GOODS.detaile
  is '详细介绍';
comment on column GOODS.count_name
  is '计量名';
comment on column GOODS.img_src
  is '图片地址';
comment on column GOODS.is_ground
  is '是否下架（0：有效，1：无效）默认0';
comment on column GOODS.ground_date
  is '上架时间';
comment on column GOODS.remark
  is '备注';
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
  is '订单ID';
comment on column ORDERS.user_id
  is '用户ID';
comment on column ORDERS.order_tatal
  is '订单总金额';
comment on column ORDERS.create_date
  is '下单时间';
comment on column ORDERS.addr_id
  is '配送信息ID';
comment on column ORDERS.pay_way
  is '网上支付（0），现金支付（1）';
comment on column ORDERS.pay_date
  is '付款时间';
comment on column ORDERS.t_date
  is '卖家确认时间';
comment on column ORDERS.true_user_id
  is '确认员工ID';
comment on column ORDERS.send_date
  is '发货时间';
comment on column ORDERS.send_user_id
  is '发货员工ID';
comment on column ORDERS.over_date
  is '收货时间';
comment on column ORDERS.order_state
  is '订单状态(0:已下单;1:已付款;2:已确认;3:已交接;4:已收货;5:已取消;6卖家取消)';
comment on column ORDERS.remark
  is '备注';
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
  is '主键ID';
comment on column ORDER_DETAIL.order_id
  is '订单ID';
comment on column ORDER_DETAIL.good_id
  is '商品ID';
comment on column ORDER_DETAIL.price
  is '价格';
comment on column ORDER_DETAIL.count
  is '商品数量';
comment on column ORDER_DETAIL.remark
  is '备注';
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
  is '主键ID';
comment on column STAFF_USER.name
  is '员工名';
comment on column STAFF_USER.password
  is '密码';
comment on column STAFF_USER.tell
  is '员工电话';
comment on column STAFF_USER.addr
  is '员工地址
';
comment on column STAFF_USER.remark
  is '备注
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
  is '主键ID';
comment on column T_USER.user_name
  is '用户昵称';
comment on column T_USER.user_pwd
  is '密码';
comment on column T_USER.sex
  is '性别';
comment on column T_USER.tell
  is '用户电话';
comment on column T_USER.phone_nubmer
  is '用户手机号码';
comment on column T_USER.create_date
  is '创建时间';
comment on column T_USER."IS_ VALID"
  is '是否有效';
comment on column T_USER.addr_id
  is '配送信息ID';
comment on column T_USER.remark
  is '备注';
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
  is '主键ID';
comment on column USER_ADDR.user_id
  is '用户ID';
comment on column USER_ADDR.receiver
  is '收件人姓名';
comment on column USER_ADDR.tell
  is '配送电话';
comment on column USER_ADDR.addr
  is '配送地址';
comment on column USER_ADDR.remark
  is '备注';
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
