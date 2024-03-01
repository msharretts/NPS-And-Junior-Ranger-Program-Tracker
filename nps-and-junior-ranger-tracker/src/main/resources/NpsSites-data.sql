START TRANSACTION;

DROP TABLE IF EXISTS site_state, site, designation, designation_site, designation_state, memorial, park, monument, state CASCADE;

CREATE TABLE state (
	state_abbreviation char(2) NOT NULL,
	state_name varchar(50) NOT NULL,
	CONSTRAINT PK_state PRIMARY KEY(state_abbreviation),
	CONSTRAINT UQ_state_name UNIQUE(state_name)
);

CREATE TABLE designation (
	designation_id serial,
	designation_name varchar(50) NOT NULL
);


CREATE TABLE site (
	site_id serial,
	site_name varchar(100) NOT NULL,
	date_established date NOT NULL,
	area_km2 numeric(6,1) NOT NULL,
	has_camping boolean NOT NULL,
	has_junior_ranger boolean,
	visitors_annually int,
	CONSTRAINT PK_site PRIMARY KEY (site_id),
	CONSTRAINT UQ_site_name UNIQUE (site_name),
);

CREATE TABLE monument (
	monument_id int NOT NULL REFERENCES site(site_id),
	monument_name varchar(50) NOT NULL,
	CONSTRAINT PK_monument PRIMARY KEY(monument_id),
	CONSTRAINT UQ_monument_name UNIQUE(monument_name)
);

CREATE TABLE memorial (
	memorial_id int NOT NULL REFERENCES site(site_id),
	memorial_name varchar(50) NOT NULL,
	CONSTRAINT PK_memorial PRIMARY KEY(memorial_id),
	CONSTRAINT UQ_memorial_name UNIQUE(memorial_name)
);

CREATE TABLE designation_state (
	designation_id int NOT NULL,
	state_abbreviation char(2) NOT NULL,
	CONSTRAINT PK_designation_state PRIMARY KEY(designation_id, state_abbreviation)
);

CREATE TABLE site_state (
	site_id int NOT NULL,
	state_abbreviation char(2) NOT NULL,
	CONSTRAINT PK_site_state PRIMARY KEY(site_id, state_abbreviation)
);

CREATE TABLE designation_site (
	site_id int NOT NULL REFERENCES site(site_id),
	designation_id int NOT NULL,
	CONSTRAINT PK_designation_site PRIMARY KEY(site_id, designation_id)
);

-- insert data

-- data collected February 10, 2021
-- state name, abbrev, capital, population (2019 estimate), area (sq km, 2018 data) - https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States
-- state sales tax (base) - https://en.wikipedia.org/wiki/Sales_taxes_in_the_United_States
-- state nickname (first official nickname only, NULL if no official nickname) - https://en.wikipedia.org/wiki/List_of_U.S._state_and_territory_nicknames
-- census region - https://en.wikipedia.org/wiki/List_of_regions_of_the_United_States#Census_Bureau-designated_regions_and_divisions
INSERT INTO state (state_abbreviation, state_name) VALUES ('AL', 'Alabama');
INSERT INTO state (state_abbreviation, state_name) VALUES ('AK', 'Alaska');
INSERT INTO state (state_abbreviation, state_name) VALUES ('AS', 'American Samoa');
INSERT INTO state (state_abbreviation, state_name) VALUES ('AZ', 'Arizona');
INSERT INTO state (state_abbreviation, state_name) VALUES ('AR', 'Arkansas');
INSERT INTO state (state_abbreviation, state_name) VALUES ('CA', 'California');
INSERT INTO state (state_abbreviation, state_name) VALUES ('CO', 'Colorado');
INSERT INTO state (state_abbreviation, state_name) VALUES ('CT', 'Connecticut');
INSERT INTO state (state_abbreviation, state_name) VALUES ('DE', 'Delaware');
INSERT INTO state (state_abbreviation, state_name) VALUES ('DC', 'District of Columbia');
INSERT INTO state (state_abbreviation, state_name) VALUES ('FL', 'Florida');
INSERT INTO state (state_abbreviation, state_name) VALUES ('GA', 'Georgia');
INSERT INTO state (state_abbreviation, state_name) VALUES ('GU', 'Guam');
INSERT INTO state (state_abbreviation, state_name) VALUES ('HI', 'Hawaii');
INSERT INTO state (state_abbreviation, state_name) VALUES ('ID', 'Idaho');
INSERT INTO state (state_abbreviation, state_name) VALUES ('IL', 'Illinois');
INSERT INTO state (state_abbreviation, state_name) VALUES ('IN', 'Indiana');
INSERT INTO state (state_abbreviation, state_name) VALUES ('IA', 'Iowa');
INSERT INTO state (state_abbreviation, state_name) VALUES ('KS', 'Kansas');
INSERT INTO state (state_abbreviation, state_name) VALUES ('KY', 'Kentucky');
INSERT INTO state (state_abbreviation, state_name) VALUES ('LA', 'Louisiana');
INSERT INTO state (state_abbreviation, state_name) VALUES ('ME', 'Maine');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MD', 'Maryland');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MA', 'Massachusetts');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MI', 'Michigan');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MN', 'Minnesota');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MS', 'Mississippi');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MO', 'Missouri');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MT', 'Montana');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NE', 'Nebraska');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NV', 'Nevada');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NH', 'New Hampshire');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NJ', 'New Jersey');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NM', 'New Mexico');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NY', 'New York');
INSERT INTO state (state_abbreviation, state_name) VALUES ('NC', 'North Carolina');
INSERT INTO state (state_abbreviation, state_name) VALUES ('ND', 'North Dakota');
INSERT INTO state (state_abbreviation, state_name) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO state (state_abbreviation, state_name) VALUES ('OH', 'Ohio');
INSERT INTO state (state_abbreviation, state_name) VALUES ('OK', 'Oklahoma');
INSERT INTO state (state_abbreviation, state_name) VALUES ('OR', 'Oregon');
INSERT INTO state (state_abbreviation, state_name) VALUES ('PA', 'Pennsylvania');
INSERT INTO state (state_abbreviation, state_name) VALUES ('PR', 'Puerto Rico');
INSERT INTO state (state_abbreviation, state_name) VALUES ('RI', 'Rhode Island');
INSERT INTO state (state_abbreviation, state_name) VALUES ('SC', 'South Carolina');
INSERT INTO state (state_abbreviation, state_name) VALUES ('SD', 'South Dakota');
INSERT INTO state (state_abbreviation, state_name) VALUES ('TN', 'Tennessee');
INSERT INTO state (state_abbreviation, state_name) VALUES ('TX', 'Texas');
INSERT INTO state (state_abbreviation, state_name) VALUES ('VI', 'U.S. Virgin Islands');
INSERT INTO state (state_abbreviation, state_name) VALUES ('UT', 'Utah');
INSERT INTO state (state_abbreviation, state_name) VALUES ('VT', 'Vermont');
INSERT INTO state (state_abbreviation, state_name) VALUES ('VA', 'Virginia');
INSERT INTO state (state_abbreviation, state_name) VALUES ('WA', 'Washington');
INSERT INTO state (state_abbreviation, state_name) VALUES ('WV', 'West Virginia');
INSERT INTO state (state_abbreviation, state_name) VALUES ('WI', 'Wisconsin');
INSERT INTO state (state_abbreviation, state_name) VALUES ('WY', 'Wyoming');


INSERT INTO designation (designation_name) VALUES ('Battlefield');
INSERT INTO designation (designation_name) VALUES ('Battlefield Park');
INSERT INTO designation (designation_name) VALUES ('Battlefield Site');
INSERT INTO designation (designation_name) VALUES ('Historical Park');
INSERT INTO designation (designation_name) VALUES ('Historic Site');
INSERT INTO designation (designation_name) VALUES ('Lakeshore');
INSERT INTO designation (designation_name) VALUES ('Memorial');
INSERT INTO designation (designation_name) VALUES ('Military Park');
INSERT INTO designation (designation_name) VALUES ('Monument');
INSERT INTO designation (designation_name) VALUES ('Other');
INSERT INTO designation (designation_name) VALUES ('Park');
INSERT INTO designation (designation_name) VALUES ('Parkway');
INSERT INTO designation (designation_name) VALUES ('Preserve');
INSERT INTO designation (designation_name) VALUES ('Recreation Area');
INSERT INTO designation (designation_name) VALUES ('Reserve');
INSERT INTO designation (designation_name) VALUES ('River');												   
INSERT INTO designation (designation_name) VALUES ('Scenic Trail');
INSERT INTO designation (designation_name) VALUES ('Seashore');
INSERT INTO designation (designation_name) VALUES ('Wild and Scenic River');





-- National Battlefield
INSERT INTO site (site_name, site_type, date_established) VALUES ('Antietam National Battlefield', 'Battlefield', '1890-08-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Big Hole National Battlefield', 'Battlefield', '1910-06-23');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cowpens National Battlefield', 'Battlefield', '1929-03-04');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Donelson National Battlefield', 'Battlefield', '1933-08-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Necessity National Battlefield', 'Battlefield', '1931-03-04');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Monocacy National Battlefield', 'Battlefield', '1934-06-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Moores Creek National Battlefield', 'Battlefield', '1926-06-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Petersburg National Battlefield', 'Battlefield', '1926-07-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Stones River National Battlefield', 'Battlefield', '1927-03-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Tupelo National Battlefield', 'Battlefield', '1933-08-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Wilson''s Creek National Battlefield', 'Battlefield', '1960-04-22');


-- Battlefield Site
INSERT INTO site (site_name, site_type, date_established) VALUES ('Brices Cross Roads National Battlefield Site', 'Battlefield Site', '1929-02-21');


-- Battlefield Park
INSERT INTO site (site_name, site_type, date_established) VALUES ('Kennesaw Mountain National Battlefield Park', 'Battlefield Park', '1917-02-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Manassas National Battlefield Park', 'Battlefield Park', '1936-11-14');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Richmond National Battlefield Park', 'Battlefield Park', '1936-03-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('River Raisin National Battlefield Park', 'Battlefield Park', '2010-10-22');


-- Military Park
INSERT INTO site (site_name, site_type, date_established) VALUES ('Chickamauga and Chattanooga National Military Park', 'Military Park', '1890-08-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fredericksburg and Spotsylvania County Battlefields Memorial National Military Park', 'Military Park', '1927-02-14');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Gettysburg National Military Park', 'Military Park', '1895-02-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Guilford Courthouse National Military Park', 'Military Park', '1917-03-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Horseshoe Bend National Military Park', 'Military Park', '1956-07-25');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Kings Mountain National Military Park', 'Military Park', '1933-08-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Pea Ridge National Military Park', 'Military Park', '1956-07-20');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Shiloh National Military Park', 'Military Park', '1894-12-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Vicksburg National Military Park', 'Military Park', '1899-02-21');


INSERT INTO site (site_name, site_type, date_established) VALUES ('Allegheny Portage Railroad National Historic Site', 'Historic Site', '1964-08-31');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Amache National Historic Site', 'Historic Site', '2022-03-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Andersonville National Historic Site', 'Historic Site', '1970-10-16');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Andrew Johnson National Historic Site', 'Historic Site', '1963-12-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Bent''s Old Fort National Historic Site', 'Historic Site', '1960-06-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Boston African American National Historic Site', 'Historic Site', '1980-10-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Carl Sandburg Home National Historic Site', 'Historic Site', '1968-10-17');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Carter G. Woodson Home National Historic Site', 'Historic Site', '2006-02-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Charles Pinckney National Historic Site', 'Historic Site', '1988-09-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Christiansted National Historic Site', 'Historic Site', '1961-01-16'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('Clara Barton National Historic Site', 'Historic Site', '1974-10-26'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('Edgar Allan Poe National Historic Site', 'Historic Site', '1978-11-10'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('Eisenhower National Historic Site', 'Historic Site', '1967-11-27'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('Eleanor Roosevelt National Historic Site', 'Historic Site', '1977-05-26'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('Eugene O''Neill National Historic Site', 'Historic Site', '1976-10-12'); 
INSERT INTO site (site_name, site_type, date_established) VALUES ('First Ladies National Historic Site', 'Historic Site', '2000-10-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ford''s Theatre National Historic Site', 'Historic Site', '1970-06-23');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Bowie National Historic Site', 'Historic Site', '1964-08-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Davis National Historic Site', 'Historic Site', '1961-09-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Laramie National Historic Site', 'Historic Site', '1960-04-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Larned National Historic Site', 'Historic Site', '1964-08-31');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Point National Historic Site', 'Historic Site', '1970-10-16');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Raleigh National Historic Site', 'Historic Site', '1941-04-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Scott National Historic Site', 'Historic Site', '1978-10-19');							
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Smith National Historic Site', 'Historic Site', '1961-09-13');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Union Trading Post National Historic Site', 'Historic Site', '1966-06-20');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Vancouver National Historic Site', 'Historic Site', '1961-06-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Frederick Douglass National Historic Site', 'Historic Site', '1988-02-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Frederick Law Olmsted National Historic Site', 'Historic Site', '1979-05-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Friendship Hill National Historic Site', 'Historic Site', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Grant–Kohrs Ranch National Historic Site', 'Historic Site', '1972-08-25');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Hampton National Historic Site', 'Historic Site', '1948-06-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Harry S. Truman National Historic Site', 'Historic Site', '1983-05-23');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Herbert Hoover National Historic Site', 'Historic Site', '1965-08-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Home of Franklin D. Roosevelt National Historic Site', 'Historic Site', '1944-01-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Honouliuli National Historic Site', 'Historic Site', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Hopewell Furnace National Historic Site', 'Historic Site', '1985-09-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Hubbell Trading Post National Historic Site', 'Historic Site', '1965-08-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('James A. Garfield National Historic Site', 'Historic Site', '1980-12-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('John Fitzgerald Kennedy National Historic Site', 'Historic Site', '1967-05-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('John Muir National Historic Site', 'Historic Site', '1964-08-31');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Knife River Indian Villages National Historic Site', 'Historic Site', '1974-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lincoln Home National Historic Site', 'Historic Site', '1971-08-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Little Rock Central High School National Historic Site', 'Historic Site', '1999-11-06');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Longfellow House — Washington''s Headquarters National Historic Site', 'Historic Site', '2010-12-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Maggie L. Walker National Historic Site', 'Historic Site', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Manzanar National Historic Site', 'Historic Site', '1992-03-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Martin Van Buren National Historic Site', 'Historic Site', '1974-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Mary McLeod Bethune Council House National Historic Site', 'Historic Site', '1991-12-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Minidoka National Historic Site', 'Historic Site', '2008-05-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Minuteman Missile National Historic Site', 'Historic Site', '1999-11-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('New Philadelphia National Historic Site', 'Historic Site', '2022-12-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Nicodemus National Historic Site', 'Historic Site', '1996-11-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ninety Six National Historic Site', 'Historic Site', '1976-08-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Pennsylvania Avenue National Historic Site', 'Historic Site', '1965-09-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('President William Jefferson Clinton Birthplace Home National Historic Site', 'Historic Site', '2010-12-14');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Puʻukoholā Heiau National Historic Site', 'Historic Site', '1972-08-17');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Sagamore Hill National Historic Site', 'Historic Site', '1963-07-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saint Croix Island International Historic Site', 'Historic Site', '1984-09-25');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saint Paul''s Church National Historic Site', 'Historic Site', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Salem Maritime National Historic Site', 'Historic Site', '1938-03-17');
INSERT INTO site (site_name, site_type, date_established) VALUES ('San Juan National Historic Site', 'Historic Site', '1949-02-14');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Sand Creek Massacre National Historic Site', 'Historic Site', '2007-04-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saugus Iron Works National Historic Site', 'Historic Site', '1968-04-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Springfield Armory National Historic Site', 'Historic Site', '1974-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Steamtown National Historic Site', 'Historic Site', '1986-10-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Theodore Roosevelt Birthplace National Historic Site', 'Historic Site', '1970-06-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Theodore Roosevelt Inaugural National Historic Site', 'Historic Site', '1966-11-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Thomas Stone National Historic Site', 'Historic Site', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Tuskegee Airmen National Historic Site', 'Historic Site', '1998-11-06');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Tuskegee Institute National Historic Site', 'Historic Site', '1974-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ulysses S. Grant National Historic Site', 'Historic Site', '1989-10-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Vanderbilt Mansion National Historic Site', 'Historic Site', '1940-12-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Washita Battlefield National Historic Site', 'Historic Site', '1996-11-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Whitman Mission National Historic Site', 'Historic Site', '1963-01-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('William Howard Taft National Historic Site', 'Historic Site', '1969-12-02');


-- Historical Parks
INSERT INTO site (site_name, site_type, date_established) VALUES ('Abraham Lincoln Birthplace National Historical Park', 'Historical Park', '2009-03-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Adams National Historical Park', 'Historical Park', '1998-11-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Appomattox Court House National Historical Park', 'Historical Park', '1954-04-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Blackstone River Valley National Historical Park', 'Historical Park', '2014-12-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Boston National Historical Park', 'Historical Park', '1974-10-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Brown v. Board of Education National Historical Park', 'Historical Park', '2022-05-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cane River Creole National Historical Park', 'Historical Park', '1994-11-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cedar Creek and Belle Grove National Historical Park', 'Historical Park', '2002-12-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Chaco Culture National Historical Park', 'Historical Park', '1980-12-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Chesapeake and Ohio Canal National Historical Park', 'Historical Park', '1971-01-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Colonial National Historical Park', 'Historical Park', '1936-06-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cumberland Gap National Historical Park', 'Historical Park', '1940-06-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Dayton Aviation Heritage National Historical Park', 'Historical Park', '1992-10-16');
INSERT INTO site (site_name, site_type, date_established) VALUES ('First State National Historical Park', 'Historical Park', '2014-12-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Sumter and Fort Moultrie National Historical Park', 'Historical Park', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('George Rogers Clark National Historical Park', 'Historical Park', '1966-07-23');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Golden Spike National Historical Park', 'Historical Park', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Harpers Ferry National Historical Park', 'Historical Park', '1963-05-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Harriet Tubman National Historical Park', 'Historical Park', '2017-01-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Harriet Tubman Underground Railroad National Historical Park', 'Historical Park', '2014-12-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Homestead National Historical Park', 'Historical Park', '2021-01-13');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Hopewell Culture National Historical Park', 'Historical Park', '1992-05-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Independence National Historical Park', 'Historical Park', '1948-06-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Jean Lafitte National Historical Park and Preserve', 'Historical Park', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Jimmy Carter National Historical Park', 'Historical Park', '2021-01-13');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Kalaupapa National Historical Park', 'Historical Park', '1980-12-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Kaloko-Honokōhau National Historical Park', 'Historical Park', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Keweenaw National Historical Park', 'Historical Park', '1992-10-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Klondike Gold Rush National Historical Park', 'Historical Park', '1976-06-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lewis and Clark National Historical Park', 'Historical Park', '2004-10-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lowell National Historical Park', 'Historical Park', '1978-06-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lyndon B. Johnson National Historical Park', 'Historical Park', '1980-12-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Manhattan Project National Historical Park', 'Historical Park', '2015-11-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Marsh-Billings-Rockefeller National Historical Park', 'Historical Park', '1998-10-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Martin Luther King Jr. National Historical Park', 'Historical Park', '2018-01-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Minute Man National Historical Park', 'Historical Park', '1959-09-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Morristown National Historical Park', 'Historical Park', '1933-07-04');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Natchez National Historical Park', 'Historical Park', '1988-10-07');
INSERT INTO site (site_name, site_type, date_established) VALUES ('New Bedford Whaling National Historical Park', 'Historical Park', '1996-11-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('New Orleans Jazz National Historical Park', 'Historical Park', '1994-10-31');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Nez Perce National Historical Park', 'Historical Park', '1965-05-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ocmulgee Mounds National Historical Park', 'Historical Park', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Palo Alto Battlefield National Historical Park', 'Historical Park', '2009-03-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Paterson Great Falls National Historical Park', 'Historical Park', '2011-11-07');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Pecos National Historical Park', 'Historical Park', '1990-06-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Pullman National Historical Park', 'Historical Park', '2022-12-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Puʻuhonua o Hōnaunau National Historical Park', 'Historical Park', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Reconstruction Era National Historical Park', 'Historical Park', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Rosie the Riveter/World War II Home Front National Historical Park', 'Historical Park', '2000-10-24');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saint-Gaudens National Historical Park', 'Historical Park', '2019-03-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ste. Genevieve National Historical Park', 'Historical Park', '2020-10-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Salt River Bay National Historical Park and Ecological Preserve', 'Historical Park', '1992-02-24');
INSERT INTO site (site_name, site_type, date_established) VALUES ('San Antonio Missions National Historical Park', 'Historical Park', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('San Francisco Maritime National Historical Park', 'Historical Park', '1988-06-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('San Juan Island National Historical Park', 'Historical Park', '1966-09-09');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saratoga National Historical Park', 'Historical Park', '1938-06-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Sitka National Historical Park', 'Historical Park', '1972-10-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Thomas Edison National Historical Park', 'Historical Park', '2009-03-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Tumacácori National Historical Park', 'Historical Park', '1990-08-06');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Valley Forge National Historical Park', 'Historical Park', '1976-07-04');
INSERT INTO site (site_name, site_type, date_established) VALUES ('War in the Pacific National Historical Park', 'Historical Park', '1978-08-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Weir Farm National Historical Park', 'Historical Park', '2021-01-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Women''s Rights National Historical Park', 'Historical Park', '1980-12-28');





-- Memorials
INSERT INTO site (site_name, date_established) VALUES ('Arkansas Post National Memorial', '1960-07-06');
INSERT INTO site (site_name, date_established) VALUES ('Arlington House, The Robert E. Lee National Memorial', '1955-06-25');
INSERT INTO site (site_name, date_established) VALUES ('Chamizal National Memorial', '1974-02-04');
INSERT INTO site (site_name, date_established) VALUES ('Coronado National Memorial', '1952-11-05');
INSERT INTO site (site_name, date_established) VALUES ('De Soto National Memorial', '1948-03-11');
INSERT INTO site (site_name, date_established) VALUES ('Dwight D. Eisenhower Memorial', '2020-09-17');
INSERT INTO site (site_name, date_established) VALUES ('Federal Hall National Memorial', '1955-08-11');
INSERT INTO site (site_name, date_established) VALUES ('Flight 93 National Memorial', '2011-09-10');
INSERT INTO site (site_name, date_established) VALUES ('Fort Caroline National Memorial', '1953-01-16');
INSERT INTO site (site_name, date_established) VALUES ('Franklin Delano Roosevelt Memorial', '1997-05-02');
INSERT INTO site (site_name, date_established) VALUES ('General Grant National Memorial', '1959-05-01');
INSERT INTO site (site_name, date_established) VALUES ('Hamilton Grange National Memorial', '1988-11-19');
INSERT INTO site (site_name, date_established) VALUES ('Johnstown Flood National Memorial', '1964-08-31');
INSERT INTO site (site_name, date_established) VALUES ('Korean War Veterans Memorial', '1995-07-27');
INSERT INTO site (site_name, date_established) VALUES ('Lincoln Boyhood National Memorial', '1962-02-19');
INSERT INTO site (site_name, date_established) VALUES ('Lincoln Memorial', '1922-05-30');
INSERT INTO site (site_name, date_established) VALUES ('Lyndon Baines Johnson Memorial Grove on the Potomac', '1974-09-27');
INSERT INTO site (site_name, date_established) VALUES ('Martin Luther King Jr. Memorial', '2011-08-28');
INSERT INTO site (site_name, date_established) VALUES ('Mount Rushmore National Memorial', '1939-07-01');
INSERT INTO site (site_name, date_established) VALUES ('Pearl Harbor National Memorial', '2019-03-12');
INSERT INTO site (site_name, date_established) VALUES ('Perry''s Victory and International Peace Memorial', '1972-10-26');
INSERT INTO site (site_name, date_established) VALUES ('Port Chicago Naval Magazine National Memorial', '1992-10-28');
INSERT INTO site (site_name, date_established) VALUES ('Roger Williams National Memorial', '1965-10-22');
INSERT INTO site (site_name, date_established) VALUES ('Thaddeus Kosciuszko National Memorial', '1972-10-21');
INSERT INTO site (site_name, date_established) VALUES ('Theodore Roosevelt Island', '1967-10-27');
INSERT INTO site (site_name, date_established) VALUES ('Thomas Jefferson Memorial', '1943-04-13');
INSERT INTO site (site_name, date_established) VALUES ('Vietnam Veterans Memorial', '1982-11-13');
INSERT INTO site (site_name, date_established) VALUES ('Washington Monument', '1885-02-21');
INSERT INTO site (site_name, date_established) VALUES ('World War I Memorial', '2014-12-19');
INSERT INTO site (site_name, date_established) VALUES ('World War II Memorial', '2004-05-29');
INSERT INTO site (site_name, date_established) VALUES ('Wright Brothers National Memorial', '1953-12-04');


-- Monuments
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('African Burial Ground National Monument', '2006-02-27', '0.001', 'False', '45035');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Agate Fossil Beds National Monument', '1997-06-14', '12.4', 'False', '16238');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Alibates Flint Quarries National Monument', '1965-08-21', '5.5', 'False', '7415');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Aniakchak National Monument', '1978-12-01', '555.1', 'False', '100');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Aztec Ruins National Monument', '1923-01-24', '1.3', 'False', '54933');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Bandelier National Monument', '1916-02-11', '136.3', 'False', '198441');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Belmont-Paul Women''s Equality National Monument', '2016-04-12', '0.001', 'False', '9081');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Birmingham Civil Rights National Monument', '2017-01-12', '0.004', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Booker T. Washington National Monument', '1956-04-02', '1.0', 'False', '22732');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Buck Island Reef National Monument', '1961-12-28', '77.0', 'False', '31411');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Cabrillo National Monument', '1913-10-14', '0.6', 'False', '842104');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Camp Nelson National Monument', '2018-10-26', '1.5', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Canyon de Chelly National Monument', '1931-04-01', '339.3', 'False', '439306');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Cape Krusenstern National Monument', '1978-12-01', '2626.8', 'False', '15087');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Capulin Volcano National Monument', '1916-08-09', '3.2', 'False', '67411');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Casa Grande Ruins National Monument', '1918-08-03', '1.9', 'False', '62995');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Castillo de San Marcos National Monument', '1924-10-15', '0.1', 'False', '748058');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Castle Clinton National Monument', '1946-08-12', '0.004', 'False', '4533564');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Castle Mountains National Monument', '2016-02-12', '85.1', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Cedar Breaks National Monument', '1933-08-22', '24.9', 'False', '644515');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('César E. Chávez National Monument', '2012-10-08', '0.5', 'False', '12769');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Charles Young Buffalo Soldiers National Monument', '2013-03-25', '0.2', 'False', '31448');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Chiricahua National Monument', '1924-04-18', '48.7', 'False', '60577');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Colorado National Monument', '1911-05-24', '83.1', 'False', '375467');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Craters of the Moon National Monument', '1924-05-02', '1388.1', 'False', '263506');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Devils Postpile National Monument', '1911-07-06', '3.2', 'False', '139724');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Devils Tower National Monument', '1906-09-24', '5.5', 'False', '468216');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Dinosaur National Monument', '1915-10-4', '851.0', 'False', '304468');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Effigy Mounds National Monument', '1949-10-25', '10.2', 'False', '55576');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('El Malpais National Monument', '1987-12-31', '462.7', 'False', '154368');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('El Morro National Monument', '1906-12-8', '5.2', 'False', '65453');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Emmett Till and Mamie Till-Mobley National Monument', '2023-07-25', '0.0', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Florissant Fossil Beds National Monument', '1969-08-20', '25.5', 'False', '79,568');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Frederica National Monument', '1936-05-26', '1.2', 'False', '183,591');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Matanzas National Monument', '1924-10-15', '1.2', 'False', '608,103');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort McHenry National Monument and Historic Shrine Monument', '1925-03-03', '0.2', 'False', '486,113');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Monroe National Monument', '2011-11-01', '1.5', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Pulaski National Monument', '1924-10-15', '22.8', 'False', '419,930');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Stanwix National Monument', '1935-08-21', '0.1', 'False', '90,507');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fort Union National Monument', '1956-04-05', '2.9', 'False', '10,860');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Fossil Butte National Monument', '1972-10-23', '33.2', 'False', '21,349');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Freedom Riders National Monument', '2017-01-12', '0.02', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('George Washington Birthplace National Monument', '1930-01-23', '2.6', 'False', '111,058');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('George Washington Carver National Monument', '1943-07-14', '0.8', 'False', '44,411');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Gila Cliff Dwellings National Monument', '1907-11-16', '2.2', 'False', '79,108');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Governors Island National Monument', '2001-01-19', '0.1', 'False', '589,798');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Grand Portage National Monument', '1960-01-27', '2.9', 'False', '94,137');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Hagerman Fossil Beds National Monument', '1988-11-18', '17.6', 'False', '26,477');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Hohokam Pima National Monument', '1972-10-21', '6.8', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Hovenweep National Monument', '1923-03-02', '3.2', 'False', '40,574');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Jewel Cave National Monument', '1908-02-07', '5.2', 'False', '142,356');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('John Day Fossil Beds National Monument', '1974-10-26', '56.9', 'False', '204,621');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Katahdin Woods and Waters National Monument', '2016-08-24', '354.4', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Lava Beds National Monument', '1925-11-21', '189.0', 'False', '127,771');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Little Bighorn Battlefield National Monument', '1940-07-01', '3.1', 'False', '272,591');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Medgar and Myrlie Evers Home National Monument', '2020-12-10', '0.0', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Mill Springs Battlefield National Monument', '2020-09-22', '5.9', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Montezuma Castle National Monument', '1906-12-08', '4.1', 'False', '390,151');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Muir Woods National Monument', '1908-01-09', '2.2', 'False', '957,932');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Natural Bridges National Monument', '1908-04-16', '30.9', 'False', '103,118');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Navajo National Monument', '1909-03-20', '1.5', 'False', '61,195');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Oregon Caves National Monument', '1909-07-12', '18.4', 'False', '67,417');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Organ Pipe Cactus National Monument', '1937-04-13', '1,338.3', 'False', '260,375');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Petroglyph National Monument', '1990-06-27', '29.2', 'False', '268,613');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Pipe Spring National Monument', '1923-05-31', '0.2', 'False', '25,179');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Pipestone National Monument', '1937-08-25', '1.1', 'False', '73,267');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Poverty Point National Monument', '1988-10-31', '3.7', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Rainbow Bridge National Monument', '1910-05-30', '0.6', 'False', '110,904');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Russell Cave National Monument', '1961-05-11', '1.3', 'False', '21,620');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Salinas Pueblo Missions National Monument', '1909-11-01', '4.3', 'False', '34,629');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Scotts B('Statue of Liberty National Monument', '1924-10-15', '0.2', 'False', '4,335,431');luff National Monument', '1919-12-12', '12.2', 'False', '142,028');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Statue of Liberty National Monument', '1924-10-15', '0.2', 'False', '4,335,431');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Stonewall National Monument', '2016-06-24', '0.0', 'False', '511,220');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Sunset Crater Volcano National Monument', '1930-05-30', '12.3', 'False', '104,583');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Timpanogos Cave National Monument', '1922-10-14', '1.0', 'False', '121,311');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Tonto National Monument', '1907-10-21', '4.5', 'False', '39,822');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Tule Lake National Monument', '2008-12-05', '5.629', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Tule Springs Fossil Beds National Monument', '2014-12-19', '91.7', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Tuzigoot National Monument', '1939-07-25', '3.3', 'False', '98,090');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Virgin Islands Coral Reef National Monument', '2001-01-17', '51.4', 'False', '');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Waco Mammoth National Monument', '2015-07-10', '0.4', 'False', '106,932');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Walnut Canyon National Monument', '1915-11-30', '14.3', 'False', '167,736');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Wupatki National Monument', '1924-12-09', '143.3', 'False', '205,122');
INSERT INTO site (site_name, date_established, area_km2, has_camping, visitors_annually) VALUES ('Yucca House National Monument', '1919-12-19', '0.1', 'False', '');


-- Parks
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Acadia National Park', '1919-02-26', 198.6, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('National Park of American Samoa', '1988-10-31', 33.4, false);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Arches National Park', '1971-11-12', 310.3, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Badlands National Park', '1978-11-10', 982.4, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Big Bend National Park', '1944-06-12', 3242.2, false);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Biscayne National Park', '1980-06-28', 700, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Black Canyon of the Gunnison National Park', '1999-10-21', 124.6, false);		
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Bryce Canyon National Park', '1928-02-25', 145, true);		
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Canyonlands National Park', '1964-09-12', 1366.2, true);		
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Capitol Reef National Park', '1971-12-18', 979, true);		
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Carlsbad Caverns National Park', '1930-05-14', 189.3, true);		
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Channel Islands National Park', '1980-03-05', 1009.9, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Congaree National Park', '2003-11-10', 107.1, false);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Crater Lake National Park', '1902-05-22', 741.5, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Cuyahoga Valley National Park', '2000-10-11', 131.8, false);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Death Valley National Park', '1994-10-31', 13793.3, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Denali National Park', '1917-02-26', 19185.8, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Dry Tortugas National Park', '1992-10-26', 261.8, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Everglades National Park', '1934-05-30', 6106.5, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Gates of the Arctic National Park', '1980-12-02', 30448.1, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Gateway Arch National Park', '2018-02-22', 0.8, false);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Glacier National Park', '1910-05-11', 4100, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Glacier Bay National Park', '1980-12-02', 13044.6, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Grand Canyon National Park', '1919-02-26', 4862.9, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Grand Teton National Park', '1929-02-26', 1254.7, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Great Basin National Park', '1986-10-27', 312.3, false);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Great Sand Dunes National Park', '2004-09-24', 434.4, true);	
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Great Smoky Mountains National Park', '1934-06-15', 2114.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Guadalupe Mountains National Park', '1972-09-30', 349.5, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Haleakalā National Park', '1961-07-01', 134.6, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Hawaiʻi Volcanoes National Park', '1916-08-01', 1317.7, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Hot Springs National Park', '1921-03-04', 22.5, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Indiana Dunes National Park', '2019-02-15', 62.1, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Isle Royale National Park', '1940-04-03', 2314, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Joshua Tree National Park', '1994-10-31', 3217.9, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Katmai National Park', '1980-12-02', 14870.3, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Kenai Fjords National Park', '1980-12-02', 2710, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Kings Canyon National Park', '1940-03-04', 1869.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Kobuk Valley National Park', '1980-12-02', 7084.9, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Lake Clark National Park', '1980-12-02', 10602, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Lassen Volcanic National Park', '1916-08-09', 431.4, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Mammoth Cave National Park', '1941-07-01', 218.6, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Mesa Verde National Park', '1906-06-29', 212.4, false);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Mount Rainier National Park', '1899-03-02', 956.6, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('New River Gorge National and Preserve Park', '2020-12-27', 28.4, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('North Cascades National Park', '1968-10-02', 2042.8, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Olympic National Park', '1938-06-29', 3733.8, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Petrified Forest National Park', '1962-12-09', 895.9, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Pinnacles National Park', '2013-01-10', 108, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Redwood National Park', '1968-10-02', 562.5, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Rocky Mountain National Park', '1915-01-26', 1075.7, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Saguaro National Park', '1994-10-14', 375.8, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Sequoia National Park', '1890-09-25', 1635.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Shenandoah National Park', '1935-12-26', 806.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Theodore Roosevelt National Park', '1978-11-10', 285.1, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Virgin Islands National Park', '1956-08-02', 60.9, false);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Voyageurs National Park', '1975-04-08', 883.1, false);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('White Sands National Park', '2019-12-20', 592.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Wind Cave National Park', '1903-01-09', 137.5, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Wrangell-St. Elias National Park', '1980-12-02', 33682.6, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Yellowstone National Park', '1872-03-01', 8983.2, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Yosemite National Park', '1890-10-01', 3082.7, true);
INSERT INTO site (site_name, date_established, area_km2, has_camping) VALUES ('Zion National Park', '1919-11-19', 595.9, true);


-- National Parkways
INSERT INTO site (site_name, site_type, date_established) VALUES ('Blue Ridge Parkway', 'Parkway', '1936-06-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('George Washington Memorial Parkway', 'Parkway', '1930-05-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('John D. Rockefeller Jr. Memorial Parkway', 'Parkway', '1972-08-25');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Natchez Trace Parkway', 'Parkway', '1938-05-08');


-- Preserves
INSERT INTO site (site_name, site_type, date_established) VALUES ('Aniakchak National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Bering Land Bridge National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Big Cypress National Preserve', 'Preserve', '1974-10-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Big Thicket National Preserve', 'Preserve', '1974-10-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Craters of the Moon National Preserve', 'Preserve', '2002-08-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Denali National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Gates of the Arctic National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Glacier Bay National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Great Sand Dunes National Preserve', 'Preserve', '2004-09-24');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Katmai National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lake Clark National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Little River Canyon National Preserve', 'Preserve', '1992-10-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Mojave National Preserve', 'Preserve', '1994-10-31');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Noatak National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Tallgrass Prairie National Preserve', 'Preserve', '1996-11-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Timucuan Ecological and Historic Preserve', 'Preserve', '1988-02-16');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Valles Caldera National Preserve', 'Preserve', '2014-02-19');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Wrangell-St. Elias National Preserve', 'Preserve', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Yukon-Charley Rivers National Preserve', 'Preserve', '1980-12-02');


-- Reserves
INSERT INTO site (site_name, site_type, date_established) VALUES ('City of Rocks National Rese rve', 'Reserve', '1988-11-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ebey''s Landing National Historical Reserve', 'Reserve', '1978-11-10');

-- Recreation Areas
INSERT INTO site (site_name, site_type, date_established) VALUES ('Amistad National Recreation Area', 'Recreation Area', '1990-11-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Bighorn Canyon National Recreation Area', 'Recreation Area', '1966-10-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Boston Harbor Islands National Recreation Area', 'Recreation Area', '1996-11-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Chattahoochee River National Recreation Area', 'Recreation Area', '1978-08-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Chickasaw National Recreation Area', 'Recreation Area', '1976-03-17');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Curecanti National Recreation Area', 'Recreation Area', '1965-02-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Delaware Water Gap National Recreation Area', 'Recreation Area', '1965-09-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Gateway National Recreation Area', 'Recreation Area', '1972-10-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Gauley River National Recreation Area', 'Recreation Area', '1988-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Glen Canyon National Recreation Area', 'Recreation Area', '1972-10-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Golden Gate National Recreation Area', 'Recreation Area', '1972-10-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lake Chelan National Recreation Area', 'Recreation Area', '1968-10-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lake Mead National Recreation Area', 'Recreation Area', '1964-10-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lake Meredith National Recreation Area', 'Recreation Area', '1990-11-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Lake Roosevelt National Recreation Area', 'Recreation Area', '1997-01-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ross Lake National Recreation Area', 'Recreation Area', '1968-10-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Santa Monica Mountains National Recreation Area', 'Recreation Area', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Whiskeytown–Shasta–Trinity National Recreation Area', 'Recreation Area', '1972-10-21');


-- National Rivers
INSERT INTO site (site_name, site_type, date_established) VALUES ('Big South Fork National River and Recreation Area', 'River', '1974-03-07');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Buffalo National River', 'River', '1992-04-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Mississippi National River and Recreation Areas', 'River', '1988-11-18');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ozark National Scenic Riverways', 'River', '1964-08-27');


-- Wild and Scenic Rivers
INSERT INTO site (site_name, site_type, date_established) VALUES ('Alagnak Wild River', 'Wild and Scenic River', '1980-12-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Bluestone National Scenic River', 'Wild and Scenic River', '1988-10-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Great Egg Harbor Scenic and Recreational River', 'Wild and Scenic River', '1992-10-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Missouri National Recreational River', 'Wild and Scenic River', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Niobrara National Scenic River', 'Wild and Scenic River', '1991-05-24');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Obed Wild and Scenic River', 'Wild and Scenic River', '1976-10-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Rio Grande Wild and Scenic River', 'Wild and Scenic River', '1978-11-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Saint Croix National Scenic Riverway', 'Wild and Scenic River', '1968-10-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Upper Delaware Scenic and Recreational River', 'Wild and Scenic River', '1978-11-10');


-- Lakeshores
INSERT INTO site (site_name, site_type, date_established) VALUES ('Apostle Islands National Lakeshore', 'Lakeshore', '1970-09-26');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Pictured Rocks National Lakeshore', 'Lakeshore', '1966-10-15');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Sleeping Bear Dunes National Lakeshore', 'Lakeshore', '1970-10-21');


-- Seashores
INSERT INTO site (site_name, site_type, date_established) VALUES ('Assateague Island National Seashore', 'Seashore', '1965-09-21');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Canaveral National Seashore', 'Seashore', '1975-01-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cape Cod National Seashore', 'Seashore', '1966-06-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cape Hatteras National Seashore', 'Seashore', '1953-01-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cape Lookout National Seashore', 'Seashore', '1966-03-10');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Cumberland Island National Seashore', 'Seashore', '1972-10-23');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fire Island National Seashore', 'Seashore', '1964-09-11');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Gulf Islands National Seashore', 'Seashore', '1971-01-08');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Padre Island National Seashore', 'Seashore', '1968-04-06');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Point Reyes National Seashore', 'Seashore', '1972-10-20');


-- Scenic Trails
INSERT INTO site (site_name, site_type, date_established) VALUES ('Appalachian National Scenic Trail', 'Scenic Trail', '1968-10-02');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Ice Age National Scenic Trail', 'Scenic Trail', '1980-10-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Natchez Trace National Scenic Trail', 'Scenic Trail', '1983-03-28');
INSERT INTO site (site_name, site_type, date_established) VALUES ('New England National Scenic Trail', 'Scenic Trail', '2009-03-30');
INSERT INTO site (site_name, site_type, date_established) VALUES ('North Country National Scenic Trail', 'Scenic Trail', '1980-03-05');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Potomac Heritage National Scenic Trail', 'Scenic Trail', '1983-03-28');


--Other designations
INSERT INTO site (site_name, site_type, date_established) VALUES ('Catoctin Mountain Park', 'Other', '1954-07-12');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Constitution Gardens', 'Other', '1986-09-17');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Washington Park', 'Other', '1930-05-29');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Greenbelt Park', 'Other', '1950-08-03');
INSERT INTO site (site_name, site_type, date_established) VALUES ('National Capital Parks - East', 'Other', '1970-07-16');
INSERT INTO site (site_name, site_type, date_established) VALUES ('National Mall and Memorial Parks', 'Other', '1965-01-01');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Piscataway Park', 'Other', '1961-10-04');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Prince William Forest Park', 'Other', '1948-06-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Rock Creek Park', 'Other', '1980-09-27');
INSERT INTO site (site_name, site_type, date_established) VALUES ('The White House and President''s Park', 'Other', '1961-09-22');
INSERT INTO site (site_name, site_type, date_established) VALUES ('Wolf Trap National Park for the Performing Arts', 'Other', '2002-08-21');






-- data collected February 10, 2021
-- park name, area (sq km, 2019 data) - https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States
-- has_camping - https://www.nps.gov/subjects/camping/campground.htm

































































-- INSERT INTO monument (monument_id, monument_name, area, has_camping) VALUES ((select site_id from site where site_name =




-- park states - https://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Acadia National Park'), 'ME');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'National Park of American Samoa'), 'AS');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Arches National Park'), 'UT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Badlands National Park'), 'SD');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Big Bend National Park'), 'TX');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Biscayne National Park'), 'FL');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Black Canyon of the Gunnison National Park'), 'CO');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Bryce Canyon National Park'), 'UT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Canyonlands National Park'), 'UT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Capitol Reef National Park'), 'UT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Carlsbad Caverns National Park'), 'NM');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Channel Islands National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Congaree National Park'), 'SC');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Crater Lake National Park'), 'OR');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Cuyahoga Valley National Park'), 'OH');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Death Valley National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Death Valley National Park'), 'NV');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Denali National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Dry Tortugas National Park'), 'FL');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Everglades National Park'), 'FL');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Gates of the Arctic National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Gateway Arch National Park'), 'MO');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Glacier National Park'), 'MT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Glacier Bay National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Grand Canyon National Park'), 'AZ');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Grand Teton National Park'), 'WY');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Great Basin National Park'), 'NV');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Great Sand Dunes National Park'), 'CO');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Great Smoky Mountains National Park'), 'NC');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Great Smoky Mountains National Park'), 'TN');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Guadalupe Mountains National Park'), 'TX');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name =  'Haleakalā National Park'), 'HI');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name =  'Hawaiʻi Volcanoes National Park'), 'HI');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Hot Springs National Park'), 'AR');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Indiana Dunes National Park'), 'IN');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Isle Royale National Park'), 'MI');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Joshua Tree National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Katmai National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Kenai Fjords National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Kings Canyon National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Kobuk Valley National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Lake Clark National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Lassen Volcanic National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Mammoth Cave National Park'), 'KY');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Mesa Verde National Park'), 'CO');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Mount Rainier National Park'), 'WA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'New River Gorge National Park and Preserve'), 'WV');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'North Cascades National Park'), 'WA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Olympic National Park'), 'WA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Petrified Forest National Park'), 'AZ');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Pinnacles National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Redwood National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Rocky Mountain National Park'), 'CO');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Saguaro National Park'), 'AZ');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Sequoia National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Shenandoah National Park'), 'VA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Theodore Roosevelt National Park'), 'ND');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Virgin Islands National Park'), 'VI');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Voyageurs National Park'), 'MN');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'White Sands National Park'), 'NM');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Wind Cave National Park'), 'SD');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Wrangell-St. Elias National Park'), 'AK');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Yellowstone National Park'), 'WY');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Yellowstone National Park'), 'MT');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Yellowstone National Park'), 'ID');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Yosemite National Park'), 'CA');
INSERT INTO site_state (site_id, state_abbreviation) VALUES ((SELECT site_id FROM site WHERE site_name = 'Zion National Park'), 'UT');


-- foreign keys

ALTER TABLE site_state ADD CONSTRAINT FK_site_state_site FOREIGN KEY(site_id) REFERENCES site(site_id);

ALTER TABLE site_state ADD CONSTRAINT FK_site_state_state FOREIGN KEY(state_abbreviation) REFERENCES state(state_abbreviation);

COMMIT;


-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Chimney Rock National Historic Site', 'Historic Site', '2012-09-21');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Fallen Timbers Battlefield and Fort Miamis National Historic Site', 'Historic Site', '1999-12-09');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Gloria Dei (Old Swedes'') Church National Historic Site', 'Historic Site', '1942-11-17');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Grey Towers National Historic Site', 'Historic Site', '2004-12-08');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Jamestown National Historic Site', 'Historic Site', '1940-12-18');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Lower East Side Tenement National Historic Site', 'Historic Site', '1998-11-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Thomas Cole National Historic Site', 'Historic Site', '1999-12-09');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Touro Synagogue National Historic Site', 'Historic Site', '1946-03-05');


-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Admiralty Island National Monument', 'Monument', '1978-12-01');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Agua Fria National Monument', 'Monument', '2000-01-11');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Aleutian Islands World War II National Monument', 'Monument', '2008-12-05');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Avi Kwa Ame National Monument', 'Monument', '2023-03-21');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Baaj Nwaavjo I''tah Kukveni – Ancestral Footprints of the Grand Canyon National Monument', 'Monument', '2023-08-08');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Basin and Range National Monument', 'Monument', '2015-07-10');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Bears Ears National Monument', 'Monument', '2016-12-28');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Berryessa Snow Mountain National Monument', 'Monument', '2015-07-10');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Browns Canyon National Monument', 'Monument', '2015-02-19');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('California Coastal National Monument', 'Monument', '2000-01-11');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Camp Hale — Continental Divide National Monument', 'Monument', '2022-10-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Canyons of the Ancients National Monument', 'Monument', '2000-06-09');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Carrizo Plain National Monument', 'Monument', '2001-01-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Cascade–Siskiyou National Monument', 'Monument', '2000-06-09');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Castner Range National Monument', 'Monument', '2023-03-21');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Chimney Rock National Monument', 'Monument', '2012-09-21');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Fort Ord National Monument', 'Monument', '2012-04-20');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Giant Sequoia National Monument', 'Monument', '2000-04-15');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Gold Butte National Monument', 'Monument', '2016-12-28');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Grand Canyon–Parashant National Monument', 'Monument', '2000-01-11');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Grand Staircase–Escalante National Monument', 'Monument', '1996-09-18');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Hanford Reach National Monument', 'Monument', '2000-06-08');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Harriet Tubman Underground Railroad National Monument', 'Monument', '2013-03-25');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Ironwood Forest National Monument', 'Monument', '2000-06-09');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Jurassic National Monument', 'Monument', '2019-03-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Kasha-Katuwe Tent Rocks National Monument', 'Monument', '2001-01-17');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Marianas Trench Marine National Monument', 'Monument', '2009-01-06');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Military Working Dog Teams National Monument', 'Monument', '2013-10-28');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Misty Fjords National Monument', 'Monument', '1978-12-01');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Mojave Trails National Monument', 'Monument', '2016-02-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Mount St. Helens Volcanic National Monument', 'Monument', '1982-08-27');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Newberry Volcanic National Monument', 'Monument', '1990-11-05');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Northeast Canyons and Seamounts Marine National Monument', 'Monument', '2016-09-15');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Organ Mountains–Desert Peaks National Monument', 'Monument', '2014-05-21');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Pacific Remote Islands Marine National Monument', 'Monument', '2009-01-06');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Papahānaumokuākea Marine National Monument', 'Monument', '2006-06-15');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Pompeys Pillar National Monument', 'Monument', '2001-01-17');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Prehistoric Trackways National Monument', 'Monument', '2009-03-30');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('President Lincoln and Soldiers’ Home National Monument', 'Monument', '2000-07-07');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Río Grande del Norte National Monument', 'Monument', '2013-03-25');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Rose Atoll Marine National Monument', 'Monument', '2009-01-06');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Saint Francis Dam Disaster National Monument', 'Monument', '2019-03-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('San Gabriel Mountains National Monument', 'Monument', '2014-10-10');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('San Juan Islands National Monument', 'Monument', '2013-03-25');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Sand to Snow', 'Monument', '2016-02-12');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Santa Rosa and San Jacinto Mountains National Monument', 'Monument', '2000-10-24');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Sonoran Desert National Monument', 'Monument', '2001-01-17');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Upper Missouri River Breaks National Monument', 'Monument', '2001-01-17');
-- INSERT INTO site (site_name, site_type, date_established) VALUES ('Vermilion Cliffs National Monument', 'Monument', '2000-11-09');



