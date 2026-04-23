create table users (
    user_id int primary key,
    name varchar(50),
    phone varchar(15)
);
create table bunks (
    bunk_id int primary key,
    name varchar(100),
    location varchar(100)
);
create table bookings (
    booking_id int primary key,
    user_id int,
    bunk_id int,
    fuel_type varchar(20),
    quantity float,
    total_price float,
    booking_time datetime,
    slot_time datetime,
    payment_method varchar(20),
    payment_status varchar(20),
    qr_code varchar(50),
    foreign key (user_id) references users(user_id),
    foreign key (bunk_id) references bunks(bunk_id)
);
create table emergency_requests (
    request_id int primary key,
    user_id int,
    location varchar(100),
    fuel_quantity float,
    status varchar(20),
    foreign key (user_id) references users(user_id)
);
insert into users values
(1, 'pavan', '9014100276'),
(2, 'varsha', '9182724186');
insert into bunks values
(1, 'hp petrol bunk', 'hyderabad'),
(2, 'indian oil bunk', 'warangal');
insert into bookings values
(101, 1, 1, 'petrol', 5, 500, '2024-04-01 10:00:00', '2024-04-01 10:30:00', 'online', 'paid', 'qr101'),
(102, 2, 2, 'diesel', 10, 900, '2024-04-02 11:00:00', '2024-04-02 11:30:00', 'cod', 'pending', 'qr102');
insert into emergency_requests values
(1, 1, 'near highway', 3, 'pending');
select b.booking_id, u.name, b.fuel_type, b.quantity, b.slot_time
from bookings b
join users u on b.user_id = u.user_id
where b.bunk_id = 1;
select bunk_id, sum(total_price) as total_revenue
from bookings
group by bunk_id;
select * from bookings where user_id = 1;
select * from bookings order by slot_time;
select u.name, e.location, e.fuel_quantity
from emergency_requests e
join users u on e.user_id = u.user_id
where e.status = 'pending';
select u.name, b.fuel_type, b.quantity, b.total_price, b.payment_status
from bookings b
join users u on b.user_id = u.user_id
where b.qr_code = 'qr101';