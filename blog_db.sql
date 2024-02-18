--========= USERS =========--
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

insert into users (first_name, last_name, email) values
('Raul', 'Lopez', 'raul@gmail.com'),
('Deybis', 'Cazana', 'deybis@gmail.com'),
('Edgar', 'Garcia', 'edgar@gmail.com');

--========= POSTS =========--
create table posts (
	id serial primary key,
	title varchar(50),
	text text,
	creator_id int references users(id)
);

insert into posts (title, text, creator_id) values
('Viajando por el mundo', 'Ayuda a nuestro corazón, rejuvenece nuestro cerebro, impulsa las hormonas de la felicidad, nos causa bienestar y nos libera del estrés', 1),
('Jugando futbol', 'Fortalece los músculos y aumenta la resistencia física', 2),
('Carnaval cusco 2024', 'El carnaval cusqueño es sin duda alguna una de las fiestas más divertidas en Cusco, donde miles de turistas y gente del Cusco se reúnen en la plaza de armas para festejar y jugar los carnavales', 2),
('Bailando salsa', 'La salsa es un conjunto de ritmos afrocaribeños fusionados con jazz y otros estilos', 3),
('Preparando Lomo saltado', 'Cocinando comida tipica del Perú a base de carne, papas fritas, cebolla y pimiento acompañandolo con arroz', 3);

--========= LIKES =========--
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(1,3),
(1,4),
(2,1),
(2,5),
(3,2);

--========= SELECTS =========--

select * from posts inner join users
on users.id = posts.creator_id

select * from posts inner join likes
on posts.id = likes.post_id inner join users
on users.id = likes.user_id