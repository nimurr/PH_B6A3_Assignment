
create table users (
    user_id INT primary key,
    name VARCHAR(100) not NULL,
    email VARCHAR(150) not NULL unique,
    phone VARCHAR(20),
    role VARCHAR(20) not NULL
        check (role in ('Admin', 'Customer'))
);

insert into users (user_id, name, email, phone, role) values
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');

create table vehicles (
    vehicle_id INT primary key,
    name VARCHAR(100) not NULL,
    type VARCHAR(20) not NULL
        check (type in ('car', 'bike', 'truck')),
    model INT not NULL,
    registration_number VARCHAR(50) not NULL unique,
    rental_price NUMERIC(10,2) not NULL,
    status VARCHAR(20) not NULL
        check (status in ('available', 'rented', 'maintenance'))
);

insert into vehicles 
(vehicle_id, name, type, model, registration_number, rental_price, status) values
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');

create table bookings (
    booking_id INT primary key,
    user_id INT not NULL,
    vehicle_id INT not NULL,
    start_date DATE not NULL,
    end_date DATE not NULL,
    status VARCHAR(20) not NULL
        check (status in ('pending', 'confirmed', 'completed', 'cancelled')),
    total_cost NUMERIC(10,2) not NULL,

  constraint fk_user
        foreign key (user_id) references users(user_id)
        on delete cascade,

    constraint fk_vehicle
        foreign key (vehicle_id) references vehicles(vehicle_id)
        on delete cascade
);

insert into bookings 
(booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost) values
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


select 
    b.booking_id,
    u.name as customer_name,
    v.name as vehicle_name,
    b.start_date,
    b.end_date,
    b.status
from bookings b
inner join users u on b.user_id = u.user_id
inner join vehicles v on b.vehicle_id = v.vehicle_id;



select *
from vehicles v
where not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
);



select *
from vehicles
where type = 'car'
  and status = 'available';



select 
    v.name as vehicle_name,
    count(b.booking_id) as total_bookings
from bookings b
inner join vehicles v on b.vehicle_id = v.vehicle_id
group by v.name
having count(b.booking_id) > 2;

