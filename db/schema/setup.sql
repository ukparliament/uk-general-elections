drop table if exists candidacies;
drop table if exists elections;
drop table if exists constituencies;
drop table if exists parties;
drop table if exists candidate_names;
drop table if exists general_elections;
drop table if exists years;
drop table if exists surnames;
drop table if exists letters;

create table letters (
	id serial not null,
	letter char(1) not null,
	primary key (id)
);
create table surnames (
	id serial not null,
	surname varchar(255) not null,
	letter_id int not null,
	primary key (id),
	constraint fk_letter foreign key (letter_id) references letters(id)
);
create table years (
	id serial not null,
	year int not null,
	primary key (id)
);
create table candidate_names (
	id serial not null,
	name varchar(255) not null,
	surname_id int not null,
	primary key (id),
	constraint fk_surname foreign key (surname_id) references surnames(id)
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
	votes int,
	election_id int not null,
	party_id int not null,
	candidate_name_id int not null,
	primary key (id),
	constraint fk_election foreign key (election_id) references elections(id),
	constraint fk_party foreign key (party_id) references parties(id),
	constraint fk_candidate_name foreign key (candidate_name_id) references candidate_names(id)
);