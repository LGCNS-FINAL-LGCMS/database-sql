\c guide

CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table test_guide_bot_embedded_q
(
    id        uuid default uuid_generate_v4() not null
        primary key,
    content   text,
    metadata  json,
    embedding vector(1024)
);

alter table test_guide_bot_embedded_q
    owner to lgcms;

create index test_guide_bot_embedded_q_index
    on test_guide_bot_embedded_q using hnsw (embedding vector_cosine_ops);

