# Blog Project

Blog is a Ruby on Rails project that allows users to create, edit, and delete articles, and also categorize them and add comments to articles. Articles and comments can have different statuses (private, public, archived).

## Getting Started

### Prerequisites

- Ruby (version X.X.X)
- Rails (version X.X.X)
- PostgreSQL (if applicable)

## Configuration
Make sure to run the following
- rails db:migrate
- bundle install
- `rake db:add_articles`
- `rake db:add_categories`
- `rake db:backfill_categories_description`