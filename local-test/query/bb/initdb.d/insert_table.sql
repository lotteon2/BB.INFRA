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
values ('사랑', '빨간 장미'),
       ('매력', '하얀 장미'),
       ('첫사랑', '주황 장미'),
       ('행복한 사랑', '분홍 장미'),
       ('기적', '파랑 장미'),
       ('영원한사랑', '보라 장미'),
       ('변하지않는사랑', '노란 장미'),
       ('변하지않는사랑', '리시안셔스'),
       ('진실된마음', '수국'),
       ('기대', '라벤더'),
       ('평화', '국화'),
       ('일편단심', '해바라기'),
       ('감사', '카네이션'),
       ('신비', '거베라'),
       ('영원한우정', '프리지아'),
       ('애정', '튤립'),
       ('매력', '라넌큘러스'),
       ('순수한사랑', '안개꽃'),
       ('변하지않는사랑', '스타티스'),
       ('사랑스러움', '데이지'),
       ('수줍음', '작약'),
       ('행복', '델피늄');

insert into develop.sales_resume (sales_resume_id, created_at, is_deleted, updated_at, is_notified, phone_number, product_id, user_id, user_name)
values  (1, '2023-12-05 11:54:16.265385', false, '2023-12-05 11:54:16.265385', null, '01093690376', '656e89e3ae667e3844a02030', 1, 'user name'),
        (2, '2023-12-05 12:05:32.303253', false, '2023-12-05 12:05:32.303253', null, '01093690376', '656e89e3ae667e3844a02030', 1, 'user name'),
        (3, '2023-12-05 12:06:31.201547', false, '2023-12-05 12:06:31.201547', null, '01028767248', '656e89e3ae667e3844a02030', 1, 'user name'),
        (4, '2023-12-05 12:06:36.927121', false, '2023-12-05 12:06:36.927121', null, '01076659001', '656e89e3ae667e3844a02030', 1, 'user name');

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


insert into card_template (color, image_url)
    VALUE
    ('blue', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/blue/blue1.png'),
    ('blue', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/blue/blue2.png'),
    ('blue', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/blue/blue3.png'),
    ('blue', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/blue/blue4.png'),
    ('blue', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/blue/blue5.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix1.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix2.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix3.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix4.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix5.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix6.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix7.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix8.png'),
    ('mix', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/mix/mix9.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink1.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink2.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink3.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink4.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink5.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink6.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink7.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink8.png'),
    ('pink', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/pink/pink9.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple1.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple2.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple3.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple4.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple5.png'),
    ('purple', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/purple/purple6.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white1.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white2.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white3.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white4.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white5.png'),
    ('white', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/white/white6.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow1.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow2.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow3.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow4.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow5.png'),
    ('yellow', 'https://blooming-blooms.s3.ap-northeast-1.amazonaws.com/images/giftcards/yellow/yellow6.png');
