drop table if exists candidacies;
drop table if exists elections;
drop table if exists constituencies;
drop table if exists parties;
drop table if exists general_elections;
drop table if exists years;

create table years (
	id serial not null,
	year int not null,
	primary key (id)
);
create table parties (
	id serial not null,
	name varchar(255) not null,
	primary key (id)
);
create table constituencies (
	id serial not null,
	name varchar(255) not null,
	primary key (id)
);
create table general_elections (
	id serial not null,
	name varchar(255) not null,
	voting_start_on date not null,
	voting_end_on date not null,
	year_id int not null,
	primary key (id),
	constraint fk_year foreign key (year_id) references years(id)
);
create table elections (
	id serial not null,
	turnout float(1),
	is_uncontested boolean default false,
	general_election_id int not null,
	constituency_id int not null,
	primary key (id),
	constraint fk_general_election foreign key (general_election_id) references general_elections(id),
	constraint fk_constituency foreign key (constituency_id) references constituencies(id)
);
create table candidacies (
	id serial not null,
	candidate_name varchar(255) not null,
	votes int,
	election_id int not null,
	party_id int not null,
	primary key (id),
	constraint fk_election foreign key (election_id) references elections(id),
	constraint fk_party foreign key (party_id) references parties(id)
);