# Run command if file doesn't exist
if [ ! -f db/development.sqlite3 ]; then
    rm -f db/schema.rb
    rails db:create
    rails db:migrate
    rails db:seed
fi