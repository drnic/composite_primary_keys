CREATE TABLE topics (
  id integer NOT NULL,  
  name varchar(50) default NULL,  
  feed_size integer default NULL, 
  PRIMARY KEY (id)
);

CREATE TABLE topic_sources (
  topic_id integer NOT NULL,
  platform varchar(50) NOT NULL,
  keywords varchar(50) default NULL,
  PRIMARY KEY (topic_id,platform)
);

CREATE TABLE reference_types (
  reference_type_id integer NOT NULL generated by default as identity (start with 100, increment by 1, no cache),  
  type_label varchar(50) default NULL,  
  abbreviation varchar(50) default NULL, 
  description varchar(50) default NULL, 
  PRIMARY KEY (reference_type_id)
);

CREATE TABLE reference_codes (
  reference_type_id integer,
  reference_code integer NOT NULL,
  code_label varchar(50) default NULL,
  abbreviation varchar(50) default NULL,
  description varchar(50) default NULL,
  PRIMARY KEY  (reference_type_id,reference_code)
);

CREATE TABLE products (
  id integer NOT NULL,
  name varchar(50) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE tariffs (
  tariff_id integer NOT NULL,
  start_date date NOT NULL,
  amount integer default NULL,
  PRIMARY KEY  (tariff_id,start_date)
);

CREATE TABLE product_tariffs (
  product_id integer NOT NULL,
  tariff_id integer NOT NULL,
  tariff_start_date date NOT NULL,
  PRIMARY KEY  (product_id,tariff_id,tariff_start_date)
);

CREATE TABLE suburbs (
  city_id integer NOT NULL,
  suburb_id integer NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY  (city_id,suburb_id)
);

CREATE TABLE streets (
  id integer NOT NULL ,
  city_id integer NOT NULL,
  suburb_id integer NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE users (
  id integer NOT NULL ,
  name varchar(50) NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE articles (
  id integer NOT NULL ,
  name varchar(50) NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE readings (
  id integer NOT NULL ,
  user_id integer NOT NULL,
  article_id integer NOT NULL,
  rating integer NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE groups (
  id integer NOT NULL ,
  name varchar(50) NOT NULL,
  PRIMARY KEY  (id)
);               

CREATE TABLE memberships (
  user_id integer NOT NULL,
  group_id integer NOT NULL,
  PRIMARY KEY  (user_id,group_id)
);

CREATE TABLE membership_statuses (
  id integer NOT NULL ,
  user_id integer NOT NULL,
  group_id integer NOT NULL,
  status varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

create table restaurants (
	franchise_id integer not null,
	store_id integer not null,
	name varchar(100),
	primary key (franchise_id, store_id)
);

create table restaurants_suburbs (
	franchise_id integer not null,
	store_id integer not null,
	city_id integer not null,
	suburb_id integer not null
);

create table products_restaurants (
  product_id integer not null,
  franchise_id integer not null,
  store_id integer not null
);
