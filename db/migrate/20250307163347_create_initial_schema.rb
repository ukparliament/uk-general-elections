class CreateInitialSchema < ActiveRecord::Migration[8.0]
  def change
    # These are extensions that must be enabled in order to support this database
    enable_extension "pg_catalog.plpgsql"
    enable_extension "pg_stat_statements"

    create_table "candidacies", id: :serial, force: :cascade do |t|
      t.integer "votes"
      t.integer "election_id", null: false
      t.integer "party_id", null: false
      t.integer "candidate_name_id", null: false
    end

    create_table "candidate_names", id: :serial, force: :cascade do |t|
      t.string "name", limit: 255, null: false
      t.integer "surname_id", null: false
    end

    create_table "constituencies", id: :serial, force: :cascade do |t|
      t.string "name", limit: 255, null: false
    end

    create_table "elections", id: :serial, force: :cascade do |t|
      t.float "turnout", limit: 24
      t.boolean "is_uncontested", default: false
      t.integer "general_election_id", null: false
      t.integer "constituency_id", null: false
    end

    create_table "general_elections", id: :serial, force: :cascade do |t|
      t.string "name", limit: 255, null: false
      t.date "voting_start_on", null: false
      t.date "voting_end_on", null: false
      t.integer "year_id", null: false
    end

    create_table "letters", id: :serial, force: :cascade do |t|
      t.string "letter", limit: 1, null: false
    end

    create_table "parties", id: :serial, force: :cascade do |t|
      t.string "name", limit: 255, null: false
    end

    create_table "surnames", id: :serial, force: :cascade do |t|
      t.string "surname", limit: 255, null: false
      t.integer "letter_id", null: false
    end

    create_table "years", id: :serial, force: :cascade do |t|
      t.integer "year", null: false
    end

    add_foreign_key "candidacies", "candidate_names", name: "fk_candidate_name"
    add_foreign_key "candidacies", "elections", name: "fk_election"
    add_foreign_key "candidacies", "parties", name: "fk_party"
    add_foreign_key "candidate_names", "surnames", name: "fk_surname"
    add_foreign_key "elections", "constituencies", name: "fk_constituency"
    add_foreign_key "elections", "general_elections", name: "fk_general_election"
    add_foreign_key "general_elections", "years", name: "fk_year"
    add_foreign_key "surnames", "letters", name: "fk_letter"
  end
end
