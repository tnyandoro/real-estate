# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_23_180252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificates", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.string "certificate_number"
    t.binary "pdf_certificate"
    t.binary "png_certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_certificates_on_course_id"
    t.index ["student_id"], name: "index_certificates_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.binary "face_image"
    t.string "identification"
    t.date "date_of_birth"
    t.string "region"
    t.string "program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.date "dob"
    t.string "name"
    t.string "phone_number"
    t.string "address"
  end

  create_table "students_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.bigint "teachers_id", null: false
    t.bigint "students_id", null: false
    t.index ["students_id"], name: "index_students_teachers_on_students_id"
    t.index ["teachers_id"], name: "index_students_teachers_on_teachers_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "course"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "certificates", "courses"
  add_foreign_key "certificates", "students"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "students_teachers", "students", column: "students_id"
  add_foreign_key "students_teachers", "teachers", column: "teachers_id"
end
