CREATE TABLE public.aliases
(
    alias character varying COLLATE pg_catalog."default" NOT NULL,
    lastname character varying COLLATE pg_catalog."default" NOT NULL
);

ALTER TABLE public.aliases
    OWNER to postgres;

create table users
(
    id           integer not null
        constraint users_pk
            primary key,
    login        varchar not null,
    password     varchar,
    first_name   varchar,
    last_name    varchar,
    email        varchar,
    phone_number varchar,
    card_number  varchar,
    enabled boolean
);

alter table users
    owner to postgres;

create unique index users_login_uindex
    on users (login);


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

