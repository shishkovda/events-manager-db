create table users
(
    id           integer not null
        constraint users_pk
            primary key,
    username        varchar not null,
    password     varchar,
    first_name   varchar,
    last_name    varchar,
    email        varchar,
    phone_number varchar,
    card_number  varchar
);

alter table users
    owner to postgres;

create unique index users_username_uindex
    on users (username);


create table events
(
    id       integer not null
        constraint events_pk
            primary key,
    title    varchar not null,
    date     varchar,
    assignee integer
        constraint events_users_id_fk
            references users
);

alter table events
    owner to postgres;


create table users_templates
(
    id          integer,
    user_id     integer
        constraint users_templates_users_id_fk
            references users,
    event_id    integer
        constraint users_templates_events_id_fk
            references events,
    template_id integer
);

alter table users_templates
    owner to postgres;


create sequence hibernate_sequence;

alter sequence hibernate_sequence owner to postgres;

