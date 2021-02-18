create database if not exists photostock2;
use photostock2;

create table if not exists user(
  user_id int(11) primary key auto_increment,
  user_type varchar(100),
  first_name varchar(200),
  surname varchar(100),
  email varchar(200) unique,
  password varchar(500),
  re_type_password varchar(500),
  picture_url varchar(1000) default "images/web_icon/ps_small.png"
  
);

alter table user auto_increment=100;
desc user;
--insert into user(user_type, first_name, surname, email, password, re_type_password, picture_url) values ('company');
-- alter table user modify picture_url varchar(1000) default "images/web_icon/ps_small.png";


create table if not exists user_active (
  active_id int(11) primary key auto_increment,
  active bool default false,
  enter_datetime varchar(1000),
  exit_datetime varchar(1000),
  stay_amount_time varchar(500),
  user_id int(11) not null
);
alter table user_active add constraint fk_user_active foreign key (user_id) references user(user_id);
alter table user_active auto_increment=200;
desc user_active;

create table if not exists simple_user(
  simple_user_id int(11)  auto_increment,
  dob varchar(100),
  gender varchar(100),
  country varchar(100),
  city varchar(100),
  state varchar(200),
  permanent_addr varchar(500),
  current_addr varchar(500),
  zip varchar(100),
  user_id int(11) not null,
  constraint pk_simple_user primary key(simple_user_id)
);
alter table simple_user add constraint fk_user_simple_user foreign key (user_id) references user(user_id);
alter table simple_user auto_increment=300;
desc simple_user;

-- alter table simple_user add dob varchar(100) after simple_user_id;
-- alter table simple_user add gender varchar(100) after dob;

-- alter table simple_user add permanent_address varchar(500) after state;
-- alter table simple_user add current_address varchar(500) after permanent_address;

-- alter table simple_user  modify zip varchar(100) after current_address;
-- insert zip as first column
-- alter table simple_user  modify   zip varchar(100) first;

-- drop column
-- alter table simple_user  drop current_address, drop permanent_address;

-- rename mysql table column
-- alter table simple_user change permanent_address permanent_addr varchar(500);
-- alter table simple_user change current_address current_addr varchar(500);

-- rename oracle table column
-- alter table simple_user rename permanent_address permanent_addr varchar(500);


create table if not exists company_user(
  company_user_id int(11) auto_increment,
  company_name varchar(200),
  country varchar(100),
  city varchar(100),
  company_address varchar(500),
  company_type varchar(100),
  business_license_no varchar(200),
  business_descr varchar(1000),
  website_url varchar(1000),
  user_id int(11) not null,
  constraint pk_company_user primary key (company_user_id)
);
alter table company_user add constraint fk_user_company_user foreign key (user_id) references user(user_id);
alter table company_user auto_increment=400;
desc company_user;

create table if not exists company_contact_person(
  person_id int(11) auto_increment,
  person_name varchar(200),
  person_email varchar(100),
  person_designation varchar(100),
  person_mobile varchar(100),
  company_user_id int(11) not null,
  constraint pk_company_contact_person primary key (person_id)
);
alter table company_contact_person add constraint fk_company_user_contact_person foreign key (company_user_id) references company_user(company_user_id);
alter table company_contact_person auto_increment=500;
desc company_contact_person;


create table if not exists contact (
  contact_id int(11) auto_increment,
  fullname varchar(200),
  email varchar(200),
  msg varchar(5000),
  msg_datetime varchar(200),
  active bool default 1,
  user_id int(11) not null,
  constraint pk_contact primary key (contact_id)
);
alter table contact add constraint fk_user_contact foreign key (user_id) references user(user_id);
alter table contact auto_increment=600;
desc contact;
-- alter table contact add active bool default 1 after msg;
-- alter table contact add msg_date varchar(200) after msg;
-- alter table contact change  msg_date  msg_datetime varchar(200) after msg;




-- for image and desginer
create table if not exists desginer(
  desginer_id int(11) auto_increment,
  first_name varchar(200),
  surname varchar(100),
  type varchar(100),
  msg varchar(2000) default "Hi",
  phone varchar(255) default "017-xxxxxxxxx",
  linkedin varchar(255) default "https://linkedin.com/in/xxx",
  facebook varchar(255) default "https://facebook.com/xxx",
  email varchar(255) default "xxx@gmail.com",
  picture_url varchar(255) default "images/web_icon/img_avatar2.png",
  constraint pk_desginer primary key (desginer_id)
);
alter table desginer auto_increment=1000;
desc desginer;
INSERT INTO `desginer` (`desginer_id`, `first_name`, `surname`, `type`, `msg`) VALUES (NULL, 'micale', 'jack', '3d','Hi, I am micale jack.'), (NULL, 'john', 'doe', 'animation','Hello, I am john doe.');
-- alter table desginer  modify  msg varchar(2000) default "Hi";

create table if not exists category(
  category_id int(11) auto_increment,
  name varchar(100),
  constraint pk_category primary key (category_id)
);
alter table category auto_increment=1100;
desc category; 
INSERT INTO `category` (`name`) VALUES ('backgrounds'), ('fashion'), ('nature'), ('science'), ('education'), ('feelings'), ('health'), ('people'), ('religion'), ('places'), ('animals'), ('industry'), ('computer'), ('food'), ('sports'), ('transportation'), ('travel'), ('buildings'), ('business'), ('music'); 




create table if not exists image(
  image_id int(11) auto_increment,
  type varchar(100),
  name varchar(100),
  uploadDate varchar(255),
  total_stock int(10),
  current_stock int(10),
  keyword varchar(5000),
  longDescription text,
  unitPrice decimal(10,2),
  alternatePrice decimal(10,2),
  saveMoney decimal(10,2),
  percentRate int(5),
  header text,
  isTaxed bool default false,
  largeImage varchar(500),
  desginer_id int(11) not null,
  category_id int(11) not null,
  constraint pk_image primary key (image_id)
);
alter table image add constraint fk_desginer_image foreign key (desginer_id) references desginer(desginer_id);
alter table image add constraint fk_category_image foreign key (category_id) references category(category_id);
alter table image auto_increment=1200;
desc image;
-- alter table image  drop mediumImage, drop smallImage, drop footer;
-- alter table image  drop longDescription, drop shortDescription;

-- alter table image change total_stock_item total_stock int(10);
-- alter table image change current_stock_item current_stock int(10);

-- alter table image add longDescription text after keyword;
-- alter table image  modify uploadDate varchar(255);
-- alter table image  modify keyword varchar(5000);

create table if not exists image_rating_review(
  rating_review_id int(11) auto_increment,
  ratings int(2) default 0,
  reviews int(2) default 0,
  point decimal(10,2) default 0,
  oneStar int(2) default 0,
  twoStar int(2) default 0,
  threeStar int(2) default 0,
  fourStar int(2) default 0,
  fiveStar int(2) default 0,
  image_id int(11) not null,
  constraint pk_image_rating_review primary key (rating_review_id)
);
alter table image_rating_review add constraint fk_image_image_rating_review foreign key (image_id) references image(image_id);
alter table image_rating_review auto_increment=1300;
desc image_rating_review;


create table if not exists image_comment(
  comment_id int(11) auto_increment,
  like_count int(11) default 0,
  dislike_count int(11) default 0,
  rating int(2) default 0,
  shortDescription varchar(700)  default "",
  longDescription text,
  commentDate varchar(255)  default "",
  image_id int(11) not null,
  user_id int(11) not null,
  constraint pk_image_comment primary key (comment_id)
);
alter table image_comment add constraint fk_image_image_comment foreign key (image_id) references image(image_id);
alter table image_comment add constraint fk_user_image_comment foreign key (user_id) references user(user_id);
alter table image_comment auto_increment=1400;
desc image_comment;


create table if not exists comment_like(
  like_id int(11) auto_increment,

  comment_id int(11) not null,
  user_id int(11) not null,
  constraint pk_comment_like primary key (like_id)
);
alter table comment_like add constraint fk_image_comment_like foreign key (comment_id) references image_comment(comment_id);
alter table comment_like add constraint fk_user_comment_like foreign key (user_id) references user(user_id);
alter table comment_like auto_increment=1500;
desc comment_like;


create table if not exists comment_dislike(
  dislike_id int(11) auto_increment,

  comment_id int(11) not null,
  user_id int(11) not null,
  constraint pk_comment_dislike primary key (dislike_id)
);
alter table comment_dislike add constraint fk_image_comment_dislike foreign key (comment_id) references image_comment(comment_id);
alter table comment_dislike add constraint fk_user_comment_dislike foreign key (user_id) references user(user_id);
alter table comment_dislike auto_increment=1600;
desc comment_dislike;


-- for wishlist and shopping cart

create table if not exists shopping(
  shopping_id int(11) auto_increment,
  item_count int(5) default 0,
  totalPrice decimal(10, 2) default 0,
  totalSaveMony decimal(10, 2) default 0,

  user_id int(11) not null,
  constraint pk_shopping primary key (shopping_id)
);
alter table shopping auto_increment=2000;
alter table shopping add constraint fk_user_shopping foreign key (user_id) references user(user_id);
desc shopping;


create table if not exists shopping_cart(
  cart_id int(11) auto_increment,
  quantity int(5) default 1,

  shopping_id int(11) not null,
  image_id int(11) not null,
  user_id int(11) not null,
  constraint pk_shopping_cart primary key (cart_id)
);
alter table shopping_cart add constraint fk_shopping_shopping_cart foreign key (shopping_id) references shopping(shopping_id);
alter table shopping_cart add constraint fk_image_shopping_cart foreign key (image_id) references image(image_id);
alter table shopping_cart add constraint fk_user_shopping_cart foreign key (user_id) references user(user_id);
alter table shopping_cart auto_increment=2100;
desc shopping_cart;

create table if not exists wishlist(
  wishlist_id int(11) auto_increment,

  image_id int(11) not null,
  user_id int(11) not null,
  constraint pk_wishlist primary key (wishlist_id)
);
alter table wishlist add constraint fk_image_wishlist foreign key (image_id) references image(image_id);
alter table wishlist add constraint fk_user_wishlist foreign key (user_id) references user(user_id);
alter table wishlist auto_increment=2200;
desc wishlist;



-- for billing, credit card, order and invoice image
create table if not exists billing_addr(
  billing_addr_id int(11) auto_increment,
  full_name varchar(255),
  email varchar(255),
  address varchar(255),
  city varchar(255),
  state varchar(255),
  zip int(11),

  user_id int(11) not null,
  constraint pk_billing_addr primary key (billing_addr_id) 
);
alter table billing_addr add constraint fk_user_billing_addr foreign key (user_id) references user(user_id);
alter table billing_addr auto_increment=3000;
desc billing_addr;


create table if not exists credit_card(
  credit_card_id int(11) auto_increment,
  card_name varchar(255),
  card_number varchar(255),
  exp_month varchar(255),
  exp_year int(11),
  cvv int(11),

  billing_addr_id int(11) not null,
  user_id int(11) not null,
  constraint pk_credit_card primary key (credit_card_id) 
);
alter table credit_card add constraint fk_billing_addr_credit_card foreign key (billing_addr_id) references billing_addr(billing_addr_id);
alter table credit_card add constraint fk_user_credit_card foreign key (user_id) references user(user_id);
alter table credit_card auto_increment=3100;
desc credit_card;

create table if not exists credit_card_trim(
  credit_card_trim_id int(11) auto_increment,
  card_name varchar(255),
  card_number varchar(255),
  exp_month varchar(255),
  cvv int(11),

  user_id int(11) not null,
  constraint pk_credit_card_trim primary key (credit_card_trim_id) 
);
alter table credit_card_trim add constraint fk_user_credit_card_trim foreign key (user_id) references user(user_id);
alter table credit_card_trim auto_increment=3700;
desc credit_card_trim;

create table if not exists payment(
  payment_id int(11) auto_increment,
  amount decimal(10, 2),


  credit_card_id int(11) not null,
  user_id int(11) not null,
  constraint pk_payment primary key (payment_id) 
);
alter table payment add constraint fk_credit_card_payment foreign key (credit_card_id) references credit_card(credit_card_id);
alter table payment add constraint fk_user_payment foreign key (user_id) references user(user_id);
alter table payment auto_increment=3200;
desc payment;



create table if not exists invoice_image(
  invoice_image_id int(11) auto_increment,
  item_count int(5) default 0,
  totalPrice decimal(10, 2) default 0,
  totalSaveMoney decimal(10, 2) default 0,

  credit_card_id int(11) not null,
  user_id int(11) not null,
  constraint pk_invoice_image primary key (invoice_image_id) 
);
alter table invoice_image add constraint fk_credit_card_invoice_image foreign key (credit_card_id) references credit_card(credit_card_id);
alter table invoice_image add constraint fk_user_invoice_image foreign key (user_id) references user(user_id);
alter table invoice_image auto_increment=3300;
desc invoice_image;


create table if not exists invoice_image_history(
  invoice_image_history_id int(11) auto_increment,
  quantity int(5) default 1,

  image_id int(11) not null,
  invoice_image_id int(11) not null,
  constraint pk_invoice_image_history primary key (invoice_image_history_id) 
);
alter table invoice_image_history add constraint fk_image_history foreign key (invoice_image_id) references invoice_image(invoice_image_id);
alter table invoice_image_history add constraint fk_image_invoice_image_history foreign key (image_id) references image(image_id);
alter table invoice_image_history auto_increment=3400;
desc invoice_image_history;



create table if not exists order_item(
  order_id int(11) auto_increment,

  user_id int(11) not null,
  invoice_image_id int(11) not null,
  payment_id int(11) not null,
  constraint pk_order primary key (order_id) 
);
alter table order_item add constraint fk_user_order foreign key (user_id) references user(user_id);
alter table order_item add constraint fk_invoice_image_order foreign key (invoice_image_id) references invoice_image(invoice_image_id);
alter table order_item add constraint fk_payment_order foreign key (payment_id) references payment(payment_id);
alter table order_item auto_increment=3500;
desc order_item;


create table if not exists purchase_item (
  purchase_item_id int(11) auto_increment,

  order_id int(11) not null,
  image_id int(11) not null,
  user_id int(11) not null,
  constraint pk_purchase_item primary key (purchase_item_id) 
);
alter table purchase_item add constraint fk_image_purchase_item foreign key (image_id) references image(image_id);
alter table purchase_item add constraint fk_order_item_purchase_item foreign key (order_id) references order_item(order_id);
alter table purchase_item add constraint fk_user_purchase_item foreign key (user_id) references user(user_id);
alter table purchase_item auto_increment=3600;
desc purchase_item;


create table if not exists notice(
  notice_id int(11) auto_increment,
  large_msg varchar(1000),
  small_msg varchar(255),
  notice_date varchar(255),
  active bool default 1,

  user_id int(11) not null,
  constraint pk_notice primary key (notice_id) 
);
alter table notice add constraint fk_user_notice foreign key (user_id) references user(user_id);
alter table notice auto_increment=4000;
desc notice;

-- alter table notice add active bool default 1 after notice_date;




create table if not exists visited_users_count(
  visited_users_count_id int(11) auto_increment,
  user_id int(11) not null,
  constraint pk_visited_users_count primary key (visited_users_count_id) 
);
alter table visited_users_count add constraint fk_user_visited_users_count foreign key (user_id) references user(user_id);
alter table visited_users_count auto_increment=5000;
desc visited_users_count;


create table if not exists visited_users_chart(
  visited_users_chart_id int(11) auto_increment,
  visited_users_count int(11) default 0,
  date_day varchar(255),
  constraint pk_visited_users_chart primary key (visited_users_chart_id) 
);
alter table visited_users_chart auto_increment=5100;
desc visited_users_chart;




create table if not exists admin(
  admin_id int(11) auto_increment,
  name varchar(100),
  email varchar(255) unique,
  password varchar(500),
  last_login varchar(255) default "",
  isActive bool default false,
  picture_url varchar(255) default "images/web_icon/img_avatar2.png",
  constraint pk_admin primary key (admin_id) 
);

alter table admin auto_increment=6000;
desc admin;
INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `last_login`, `isActive`, `picture_url`) VALUES (NULL, 'admin', 'admin@gmail.com', 'admin@gmail.com', 'not', '0', 'images/web_icon/img_avatar2.png'); 

-- alter table admin modify picture_url varchar(255) default "images/web_icon/img_avatar2.png" after isActive;
-- alter table admin  drop picture_url;
-- alter table admin modify email varchar(255) unique;








