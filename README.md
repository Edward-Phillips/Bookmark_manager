[![](https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cbmNsYXNzIEJvb2ttYXJrTWFuYWdlciB7XG4gICtjdXJyZW50X2Jvb2ttYXJrc1xuICArc2hvd19ib29rbWFya3MoKVxufSIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cbmNsYXNzIEJvb2ttYXJrTWFuYWdlciB7XG4gICtjdXJyZW50X2Jvb2ttYXJrc1xuICArc2hvd19ib29rbWFya3MoKVxufSIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)

The above is based on the following user story:

 "As a user,

So that I can access my bookmarks, 

I'd like to seea list of my bookmarks"



THIS PROJECT USES 2 DATABASES:

 - A live database, bookmark_manager
 - A test database, bookmark_manager_test

 They both have a single table 'bookmarks' with 2 columns, an 'id' column (serial PRIMARY KEY) and a 'url' column (VARCHAR (60)).

To set up these databases you will need PSQL and Postgresql installed, it is assumed that you have these installed, if you do not please do so first.

SETUP:

launch psql<br>
 [psql postgres]

create the databases:
 CREATE DATABASE "bookmark_manager_test";
 CREATE DATABASE "bookmark_manager";

connect to each database and create the bookmarks table:<br>
  \c [either of the two databases]<br>
  CREATE TABLE bookmarks (id serial PRIMARY KEY, url VARCHAR (60));

  there you go, you're all good to go.