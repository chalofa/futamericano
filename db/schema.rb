# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120714045156) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["authentication_token"], :name => "index_admin_users_on_authentication_token", :unique => true
  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "channels", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "short",                              :null => false
    t.string   "state",      :default => "disabled", :null => false
    t.string   "url"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "channels", ["short"], :name => "index_channels_on_short", :unique => true

  create_table "channels_games", :force => true do |t|
    t.integer  "game_id"
    t.integer  "channel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "channels_games", ["channel_id"], :name => "index_channels_games_on_channel_id"
  add_index "channels_games", ["game_id", "channel_id"], :name => "index_channels_games_on_game_id_and_channel_id", :unique => true
  add_index "channels_games", ["game_id"], :name => "index_channels_games_on_game_id"

  create_table "coaches", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "team_id"
    t.string   "state",      :default => "disabled", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "coaches", ["name"], :name => "index_coaches_on_name", :unique => true
  add_index "coaches", ["state", "team_id"], :name => "index_coaches_on_state_and_team_id"
  add_index "coaches", ["state"], :name => "index_coaches_on_state"
  add_index "coaches", ["team_id"], :name => "index_coaches_on_team_id"

  create_table "divisions", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "conference",                         :null => false
    t.integer  "position",                           :null => false
    t.string   "state",      :default => "disabled", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "divisions", ["conference", "name", "position"], :name => "index_divisions_on_conference_and_name_and_position"
  add_index "divisions", ["conference", "name"], :name => "index_divisions_on_conference_and_name", :unique => true
  add_index "divisions", ["conference"], :name => "index_divisions_on_conference"

  create_table "games", :force => true do |t|
    t.integer  "week_id",                               :null => false
    t.integer  "team_id"
    t.integer  "away_team_id"
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "league_id"
    t.string   "state",          :default => "pending", :null => false
    t.date     "game_date"
    t.datetime "scheduled_at"
    t.boolean  "time_over",      :default => false,     :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "default_sort",   :default => 1,         :null => false
    t.integer  "channels_count", :default => 0
  end

  add_index "games", ["league_id"], :name => "index_games_on_league_id", :unique => true
  add_index "games", ["state"], :name => "index_games_on_state"
  add_index "games", ["week_id", "team_id", "away_team_id"], :name => "by_week", :unique => true

  create_table "players", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "pos",                                :null => false
    t.integer  "debut",                              :null => false
    t.string   "state",      :default => "disabled", :null => false
    t.integer  "team_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "players", ["name", "pos"], :name => "index_players_on_name_and_pos", :unique => true
  add_index "players", ["name"], :name => "index_players_on_name"
  add_index "players", ["pos"], :name => "index_players_on_pos"
  add_index "players", ["state"], :name => "index_players_on_state"
  add_index "players", ["team_id"], :name => "index_players_on_team_id"

  create_table "progresses", :force => true do |t|
    t.integer  "game_id"
    t.integer  "down"
    t.integer  "to_go"
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "home_to"
    t.integer  "away_to"
    t.string   "quarter"
    t.string   "clock"
    t.string   "pos_team"
    t.string   "yard_line"
    t.string   "home_scores"
    t.string   "away_scores"
    t.boolean  "red_zone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "progresses", ["game_id"], :name => "index_progresses_on_game_id", :unique => true

  create_table "seasons", :force => true do |t|
    t.integer  "year",       :default => 2011,       :null => false
    t.string   "state",      :default => "disabled", :null => false
    t.integer  "week_id"
    t.integer  "team_id"
    t.integer  "league_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "starts_at"
    t.datetime "ends_at"
  end

  add_index "seasons", ["league_id"], :name => "index_seasons_on_league_id"
  add_index "seasons", ["state", "team_id"], :name => "index_seasons_on_state_and_team_id"
  add_index "seasons", ["state"], :name => "index_seasons_on_state"
  add_index "seasons", ["team_id"], :name => "index_seasons_on_team_id"
  add_index "seasons", ["week_id"], :name => "index_seasons_on_week_id"
  add_index "seasons", ["year", "state"], :name => "index_seasons_on_year_and_state"
  add_index "seasons", ["year"], :name => "index_seasons_on_year", :unique => true

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "short"
    t.string   "settingable_type"
    t.text     "the_content"
    t.text     "the_values"
    t.text     "the_hash"
    t.boolean  "locked",           :default => false
    t.integer  "the_value"
    t.datetime "last_at"
    t.integer  "settingable_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "settings", ["last_at"], :name => "index_settings_on_last_at"
  add_index "settings", ["settingable_id"], :name => "index_settings_on_settingable_id"
  add_index "settings", ["settingable_type", "settingable_id", "name"], :name => "index_settings_on_settingable_type_and_settingable_id_and_name", :unique => true
  add_index "settings", ["settingable_type", "settingable_id", "short"], :name => "index_settings_on_settingable_type_and_settingable_id_and_short", :unique => true
  add_index "settings", ["settingable_type", "settingable_id"], :name => "index_settings_on_settingable_type_and_settingable_id"
  add_index "settings", ["settingable_type"], :name => "index_settings_on_settingable_type"

  create_table "standings", :force => true do |t|
    t.integer  "season_id"
    t.integer  "team_id"
    t.integer  "won",        :default => 0,          :null => false
    t.integer  "lost",       :default => 0,          :null => false
    t.integer  "tied",       :default => 0,          :null => false
    t.integer  "pf",         :default => 0,          :null => false
    t.integer  "pa",         :default => 0,          :null => false
    t.integer  "net",        :default => 0,          :null => false
    t.string   "won_ids"
    t.string   "lost_ids"
    t.string   "tied_ids"
    t.string   "week_type"
    t.string   "state",      :default => "disabled", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "standings", ["season_id", "state"], :name => "index_standings_on_season_id_and_state"
  add_index "standings", ["season_id", "team_id", "state"], :name => "index_standings_on_season_id_and_team_id_and_state"
  add_index "standings", ["season_id"], :name => "index_standings_on_season_id"
  add_index "standings", ["team_id"], :name => "index_standings_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "short",                               :null => false
    t.string   "city",                                :null => false
    t.string   "web",                                 :null => false
    t.string   "stadium",                             :null => false
    t.string   "area",                                :null => false
    t.integer  "division_id"
    t.integer  "league_id"
    t.integer  "year",                                :null => false
    t.string   "state",       :default => "disabled", :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "teams", ["division_id"], :name => "index_teams_on_division_id"
  add_index "teams", ["league_id"], :name => "index_teams_on_league_id"
  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true
  add_index "teams", ["short"], :name => "index_teams_on_short", :unique => true
  add_index "teams", ["state"], :name => "index_teams_on_state"

  create_table "weeks", :force => true do |t|
    t.integer  "season_id",                          :null => false
    t.string   "week_type",                          :null => false
    t.string   "state",      :default => "disabled", :null => false
    t.integer  "number"
    t.integer  "league_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "weeks", ["league_id"], :name => "index_weeks_on_league_id", :unique => true
  add_index "weeks", ["season_id", "week_type", "number", "state"], :name => "index_weeks_on_season_id_and_week_type_and_number_and_state"
  add_index "weeks", ["season_id", "week_type", "number"], :name => "index_weeks_on_season_id_and_week_type_and_number", :unique => true
  add_index "weeks", ["season_id", "week_type", "state"], :name => "index_weeks_on_season_id_and_week_type_and_state"

end
