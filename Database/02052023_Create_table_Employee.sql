create table if not exists employee(
id INT generated always as identity not null,
first_Name VARCHAR not null,
last_Name VARCHAR not null,
email VARCHAR not null,
contact_No VARCHAR not null,
deleted bool not null,
primary key (id)
)