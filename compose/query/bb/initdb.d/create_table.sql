create table if not exists flower
(
    flower_id          bigint auto_increment
        primary key,
    created_at         datetime(6)  null,
    is_deleted         bit          null,
    updated_at         datetime(6)  null,
    flower_name        varchar(255) null,
    language_of_flower varchar(255) null
);

create table if not exists category
(
    category_id   bigint auto_increment
        primary key,
    created_at    datetime(6)  null,
    is_deleted    bit          null,
    updated_at    datetime(6)  null,
    category_name varchar(255) null
);

create table if not exists review
(
    review_id      bigint auto_increment
        primary key,
    created_at     datetime(6)  null,
    is_deleted     bit          null,
    updated_at     datetime(6)  null,
    nickname       varchar(255) null,
    product_id     varchar(255) null,
    profile_image  varchar(255) null,
    review_content varchar(255) null,
    review_rating  double       null,
    user_id        bigint       null
);

create table if not exists review_images
(
    review_images_id bigint auto_increment
        primary key,
    created_at       datetime(6)  null,
    is_deleted       bit          null,
    updated_at       datetime(6)  null,
    review_image_url varchar(255) null,
    review_id        bigint       null,
    constraint FKn6ocagcwsaswdoh2ntvrkk5en
        foreign key (review_id) references review (review_id)
);

create table if not exists sales_resume
(
    sales_resume_id bigint auto_increment
        primary key,
    created_at      datetime(6)  null,
    is_deleted      bit          null,
    updated_at      datetime(6)  null,
    is_notified     bit          null,
    phone_number    varchar(255) null,
    product_id      varchar(255) null,
    user_id         bigint       null,
    user_name       varchar(255) null
);

create table if not exists tag
(
    tag_id     bigint auto_increment
        primary key,
    created_at datetime(6)  null,
    is_deleted bit          null,
    updated_at datetime(6)  null,
    tag_name   varchar(255) null
);

create table if not exists notification
(
    notification_id      bigint auto_increment
        primary key,
    notification_content varchar(255) null,
    notification_link    varchar(255) null
);

create table if not exists member_notification
(
    member_notification_id bigint auto_increment
        primary key,
    created_at             datetime(6) null,
    is_deleted             bit         null,
    updated_at             datetime(6) null,
    is_read                bit         null,
    user_id                bigint      null,
    notification_id        bigint      null,
    constraint FKd59lsqqgsrspgt54x09f113l0
        foreign key (notification_id) references notification (notification_id)
);