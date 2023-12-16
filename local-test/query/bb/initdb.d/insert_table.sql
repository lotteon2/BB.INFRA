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

insert into develop.review (review_id, created_at, is_deleted, updated_at, nickname, product_id, profile_image, review_content, review_rating, user_id)
values  (1, '2023-12-16 02:09:48.579193', false, '2023-12-16 02:09:48.579193', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1),
        (2, '2023-12-16 02:09:50.161175', false, '2023-12-16 02:09:50.161175', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1),
        (3, '2023-12-16 02:09:51.343042', false, '2023-12-16 02:09:51.343042', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1),
        (4, '2023-12-16 02:09:52.583376', false, '2023-12-16 02:09:52.583376', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1),
        (5, '2023-12-16 02:09:54.019563', false, '2023-12-16 02:09:54.019563', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1),
        (6, '2023-12-16 02:09:55.412194', false, '2023-12-16 02:09:55.412194', 'lee nick', '656ea75019e5d24c1df77e98', 'profile image url', 'content', 4.5, 1);

insert into develop.review_images (review_images_id, created_at, is_deleted, updated_at, review_image_url, review_id)
values  (1, '2023-12-16 02:09:48.635694', false, '2023-12-16 02:09:48.635694', 'imageurl 1', 1),
        (2, '2023-12-16 02:09:48.640641', false, '2023-12-16 02:09:48.640641', 'image url 2', 1),
        (3, '2023-12-16 02:09:50.170423', false, '2023-12-16 02:09:50.170423', 'imageurl 1', 2),
        (4, '2023-12-16 02:09:50.176269', false, '2023-12-16 02:09:50.176269', 'image url 2', 2),
        (5, '2023-12-16 02:09:51.348454', false, '2023-12-16 02:09:51.348454', 'imageurl 1', 3),
        (6, '2023-12-16 02:09:51.349976', false, '2023-12-16 02:09:51.349976', 'image url 2', 3),
        (7, '2023-12-16 02:09:52.587794', false, '2023-12-16 02:09:52.587794', 'imageurl 1', 4),
        (8, '2023-12-16 02:09:52.592497', false, '2023-12-16 02:09:52.592497', 'image url 2', 4),
        (9, '2023-12-16 02:09:54.023651', false, '2023-12-16 02:09:54.023651', 'imageurl 1', 5),
        (10, '2023-12-16 02:09:54.029264', false, '2023-12-16 02:09:54.029264', 'image url 2', 5),
        (11, '2023-12-16 02:09:55.417983', false, '2023-12-16 02:09:55.417983', 'imageurl 1', 6),
        (12, '2023-12-16 02:09:55.421169', false, '2023-12-16 02:09:55.421169', 'image url 2', 6);