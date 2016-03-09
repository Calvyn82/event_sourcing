require 'pg'
require_relative './user'
require_relative './task'

module Todo
  class Database
    READ_ONLY = true
    def initialize
      @db = PG.connect(dbname: 'todo')
      @db.type_map_for_results = PG:BasicTypeMapForResults.new(@db)
    end

    attr_reader :db

    def setup
      db.exec("CREATE TABLE IF NOT EXISTS users (
              id serial primary key,
              first_name text,
              last_name text
              created_at timestamp without time zone );"
             )

      db.exec("CREATE TABLE IF NOT EXISTS task (
              id serial primary key,
              user_id integer,
              name text,
              status text,
              description text,
              created_at timestamp without time zone );"
             )
    end

    def add_user(user)
      db.exec("INSERT INTO users (first_name, last_name) VALUES ($1, $2);",
              [user.first_name, user.last_name]
             )
    end

    def add_task(task: task, user: user)
      db.exec(
        "INSERT INTO tasks (user_id, name, status, description, created_at) VALUES ($1, $2, $3, $4, $5)",
        [user.id, task.name, task.status, task.description, task.created_at]
      )
    end

    def load_user(first_name: first_name, last_name: last_name)
      user_data = find_user_by_name(first_name: first_name, last_name: last_name)
      if user_data.empty?
        nil
      else
        user = User.new(
          first_name: user_data[:first_name],
          last_name: user_data[:last_name],
          id: user_data[:id],
          tasks: [] )
        load_items_for(user)
        user
      end
    end


    def update_task(id)
    end

  end
end
