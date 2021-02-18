create table if not exists work(
  work_id int(11) auto_increment,
  name varchar(100),
  copy int(10),
  img_url varchar(500),
  desginer_id int(11) not null,
  constraint pk_work primary key (work_id)
);

alter table work add constraint fk_desginer_work foreign key (desginer_id) references desginer(desginer_id);

alter table work auto_increment=900;
desc work;
