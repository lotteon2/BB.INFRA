insert into category (category_name)
values ('꽃다발'),
       ('꽃바구니'),
       ('꽃상자'),
       ('화분'),
       ('화환');

insert into tag (tag_name)
values ('연인 선물'),
       ('친구 선물'),
       ('공기 정화'),
       ('개업 축하'),
       ('승진 취임'),
       ('결혼식'),
       ('장례식');

insert into flower (language_of_flower, flower_name)
values ('장미 꽃말', '흰 장미'),
       ('장미 꽃말', '빨간 장미'),
       ('장미 꽃말', '파란 장미'),
       ('장미 꽃말', '수국'),
       ('장미 꽃말', '해바라기'),
       ('장미 꽃말', '튤립');

insert into develop.sales_resume (sales_resume_id, created_at, is_deleted, updated_at, is_notified, phone_number, product_id, user_id, user_name)
values  (1, '2023-12-05 11:54:16.265385', false, '2023-12-05 11:54:16.265385', null, '+8201093690376', '656e89e3ae667e3844a02030', 1, 'user name'),
        (2, '2023-12-05 12:05:32.303253', false, '2023-12-05 12:05:32.303253', null, '+8201093690376', '656e89e3ae667e3844a02030', 1, 'user name'),
        (3, '2023-12-05 12:06:31.201547', false, '2023-12-05 12:06:31.201547', null, '+8201028767248', '656e89e3ae667e3844a02030', 1, 'user name'),
        (4, '2023-12-05 12:06:36.927121', false, '2023-12-05 12:06:36.927121', null, '+8201054482069', '656e89e3ae667e3844a02030', 1, 'user name');