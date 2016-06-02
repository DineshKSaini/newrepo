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

ActiveRecord::Schema.define(:version => 20160602105502) do

  create_table "activities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "activity_type_id"
    t.string   "name"
    t.string   "canonicals"
    t.text     "description"
  end

  create_table "activity_types", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "canonicals"
  end

  create_table "addons_pncs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "addon_type"
    t.string   "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agent_adjustments", :force => true do |t|
    t.integer  "status",             :limit => 1
    t.date     "adjustment_date"
    t.integer  "user_id"
    t.integer  "amount"
    t.integer  "requested_trip_id"
    t.integer  "type_of_adjustment", :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sub_account_id"
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "replied_by"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_comment_id"
  end

  create_table "archive_visitor_trackings", :force => true do |t|
    t.integer  "user_id"
    t.datetime "time_of_visit"
    t.string   "url"
    t.decimal  "total_time_spent", :precision => 10, :scale => 2, :default => 0.0
    t.text     "time_spent_arr"
    t.string   "platform"
  end

  add_index "archive_visitor_trackings", ["user_id", "url"], :name => "index_archive_visitor_trackings_on_user_id_and_url"

  create_table "article_images", :force => true do |t|
    t.string   "caption"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "article_ranks", :force => true do |t|
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "summary"
    t.integer  "city_id"
    t.boolean  "published",   :default => false
  end

  create_table "associated_versions", :force => true do |t|
    t.integer "parent_version_id"
    t.string  "parent_type"
    t.integer "child_version_id"
    t.string  "child_type"
  end

  add_index "associated_versions", ["child_version_id", "child_type"], :name => "index_associated_versions_on_child_version_id_and_child_type"
  add_index "associated_versions", ["parent_version_id", "parent_type"], :name => "index_associated_versions_on_parent_version_id_and_parent_type"

  create_table "attachments", :force => true do |t|
    t.string   "desc"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "attachments", ["attachable_type", "attachable_id"], :name => "index_attachments_on_attachable_type_and_attachable_id"

  create_table "attraction_tas", :force => true do |t|
    t.string   "name"
    t.string   "ta_url"
    t.integer  "g_id"
    t.integer  "d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attraction_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attraction_types_attractions", :id => false, :force => true do |t|
    t.integer "attraction_id"
    t.integer "attraction_type_id"
  end

  create_table "attractions", :force => true do |t|
    t.string   "name"
    t.string   "image_url"
    t.integer  "ratings"
    t.integer  "price"
    t.string   "currency"
    t.text     "description"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.text     "att_type"
    t.text     "schedule"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.boolean  "preincluded",                                         :default => false
    t.string   "time_required"
    t.string   "transport_medium"
    t.string   "terms_and_conditions"
    t.integer  "saving"
    t.boolean  "is_recommended",                                      :default => false
    t.decimal  "max_price",            :precision => 10, :scale => 0
  end

  add_index "attractions", ["city_id"], :name => "index_attractions_on_city_id"
  add_index "attractions", ["destination_id"], :name => "index_attractions_on_destination_id"
  add_index "attractions", ["name", "city_id"], :name => "index_attractions_on_name_and_city_id"

  create_table "attractions_trip_types", :id => false, :force => true do |t|
    t.integer "attraction_id"
    t.integer "trip_type_id"
  end

  add_index "attractions_trip_types", ["attraction_id", "trip_type_id"], :name => "index_attractions_trip_types_on_attraction_id_and_trip_type_id"

  create_table "attribute_lists", :force => true do |t|
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "att_type"
    t.string   "att_sub_type"
    t.string   "tag"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "b2bs", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "destinations"
    t.integer  "status",       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "bank_accounts", :force => true do |t|
    t.string   "ifsc"
    t.string   "account_no"
    t.string   "name_of_beneficiary"
    t.string   "bank_name"
    t.string   "bank_address"
    t.string   "swift_code"
    t.string   "account_currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",              :limit => 1
    t.integer  "user_id"
    t.float    "remittance_charge",                :default => 0.0
  end

  create_table "bank_transaction_payments", :force => true do |t|
    t.integer "payment_id"
    t.integer "bank_transaction_id"
  end

  add_index "bank_transaction_payments", ["bank_transaction_id"], :name => "index_btp_bank_transaction_id"
  add_index "bank_transaction_payments", ["payment_id", "bank_transaction_id"], :name => "index_btp_payment_id_and_bank_transaction_id"

  create_table "bank_transactions", :force => true do |t|
    t.date     "date"
    t.decimal  "amount",          :precision => 12, :scale => 2
    t.string   "medium"
    t.string   "misc"
    t.float    "non_trip_amount"
    t.string   "with"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_ids"
  end

  add_index "bank_transactions", ["with"], :name => "index_bt_with"

  create_table "bookings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.integer  "amountpaid"
    t.string   "currency"
    t.string   "paymentmethod"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "departuredate",                  :null => false
    t.integer  "numberoftickets", :default => 1, :null => false
    t.integer  "isPaid",          :default => 0, :null => false
    t.string   "unregisteredId"
    t.integer  "agent_id"
    t.datetime "payment_done_at"
  end

  add_index "bookings", ["user_id", "trip_id"], :name => "index_bookings_on_user_id_and_trip_id"

  create_table "budget_types", :force => true do |t|
    t.integer  "max_value"
    t.integer  "min_value"
    t.string   "btype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cab_rates", :force => true do |t|
    t.integer  "destination_id"
    t.string   "vehicle"
    t.integer  "per_day_charge"
    t.integer  "free_kms"
    t.integer  "extra_kms_charge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cabs", :force => true do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "description"
    t.boolean  "ac"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_recordings", :force => true do |t|
    t.string   "type_of_call"
    t.string   "call_date"
    t.string   "call_time"
    t.string   "called_number"
    t.string   "caller_number"
    t.string   "caller_user_id"
    t.string   "is_registered"
    t.string   "preferred_language"
    t.string   "caller_circle"
    t.text     "agent_list"
    t.string   "agent_connected"
    t.string   "agent_code"
    t.string   "call_status"
    t.text     "calls_missed_by"
    t.text     "agent_hangby_causes"
    t.string   "total_call_duration"
    t.text     "call_uuid"
    t.text     "recording_url"
    t.text     "sync_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidate_details", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "designation"
    t.string   "status",           :default => "New"
    t.text     "remarks"
  end

  create_table "candidate_emails", :force => true do |t|
    t.integer "candidate_id"
    t.integer "email_id"
  end

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.float    "experience"
    t.string   "source"
    t.datetime "last_active_at"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",         :limit => 1, :default => 0
    t.integer  "profile",        :limit => 1, :default => 0
  end

  create_table "canonical_hotels", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "canonical_hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "canonical_hotels", ["canonical_hotel_id"], :name => "index_canonical_hotels_on_canonical_hotel_id"
  add_index "canonical_hotels", ["hotel_id"], :name => "index_canonical_hotels_on_hotel_id"

  create_table "cards", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destination_id"
    t.integer  "sequence"
    t.string   "view_id"
  end

  create_table "cards_customizations", :force => true do |t|
    t.integer  "card_id"
    t.integer  "customization_id"
    t.string   "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destination_id"
    t.integer  "question_sequence"
    t.string   "action"
    t.string   "question_identifier"
  end

  add_index "cards_customizations", ["card_id"], :name => "index_cards_customizations_on_card_id"
  add_index "cards_customizations", ["customization_id"], :name => "index_cards_customizations_on_customization_id"

  create_table "careers", :force => true do |t|
    t.string   "category"
    t.string   "sub_category"
    t.text     "roles_and_responsibities"
    t.text     "skills"
    t.string   "experience"
    t.string   "age"
    t.string   "location"
    t.string   "education"
    t.text     "good_to_have"
    t.text     "what_you_get"
    t.string   "how_to_apply"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "career_image_file_name"
    t.string   "career_image_content_type"
    t.string   "career_image_file_size"
    t.string   "career_image_updated_at"
    t.boolean  "active_category",           :default => true
    t.boolean  "active_subcategory",        :default => true
  end

  create_table "categories", :force => true do |t|
    t.integer  "price"
    t.string   "currency"
    t.integer  "trip_id"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cab_id"
    t.string   "price_type"
    t.integer  "extra_adult"
    t.integer  "child_with_bed"
    t.integer  "child_without_bed"
    t.integer  "cab_upgrade_price"
    t.string   "cab_upgrade_name"
  end

  create_table "chaoses", :force => true do |t|
    t.integer  "issue_category"
    t.text     "description"
    t.integer  "status",            :default => 0
    t.integer  "severity",          :default => 0
    t.boolean  "is_acknowledged",   :default => false
    t.datetime "next_action_date"
    t.string   "next_action_on",    :default => "agent"
    t.integer  "requested_trip_id"
    t.boolean  "delta",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chaoses", ["requested_trip_id"], :name => "index_chaoses_on_requested_trip_id"

  create_table "chat_offlines", :force => true do |t|
    t.string   "current_url"
    t.string   "sent_date"
    t.string   "email"
    t.string   "name"
    t.string   "client_details"
    t.string   "current_loc"
    t.text     "message"
    t.string   "destination"
    t.string   "assignee"
    t.string   "work_status"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", :force => true do |t|
    t.text     "history",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id",   :null => false
    t.integer  "receiver_id", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "info"
    t.text     "climate"
    t.text     "how_to_reach"
    t.text     "conveyance"
    t.text     "shoping_list"
    t.text     "cuisines"
    t.float    "rating"
    t.integer  "location",        :limit => nil
    t.integer  "destination_id"
    t.integer  "state_id"
    t.text     "canonical_names"
    t.boolean  "is_active",                      :default => true
    t.integer  "country_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_tourist"
    t.integer  "ranking",                        :default => 100
    t.boolean  "is_recommended",                 :default => false
    t.boolean  "published",                      :default => true
  end

  add_index "cities", ["destination_id"], :name => "index_cities_on_destination_id"
  add_index "cities", ["id", "destination_id"], :name => "index_cities_on_id_and_destination_id"
  add_index "cities", ["name"], :name => "index_cities_on_name"

  create_table "city_activity_types", :force => true do |t|
    t.integer  "city_id"
    t.integer  "activity_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "city_activity_types", ["city_id", "activity_type_id"], :name => "index_city_activity_types_on_city_id_and_activity_type_id", :unique => true

  create_table "city_in_itineraries", :force => true do |t|
    t.integer  "city_id"
    t.integer  "days"
    t.text     "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_id"
    t.string   "mealplan"
    t.integer  "category_id"
    t.integer  "trip_day_id"
    t.string   "room_type"
  end

  create_table "city_tas", :force => true do |t|
    t.string   "name"
    t.string   "region"
    t.integer  "g_id"
    t.string   "ta_url"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_images", :force => true do |t|
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "cloud_imageable_id"
    t.string   "cloud_imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloudinary_infos", :force => true do |t|
    t.string   "public_id"
    t.string   "public_url"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cloudinary_infos", ["picture_id"], :name => "index_cloudinary_infos_on_picture_id"

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                          :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id", "created_at"], :name => "index_comments_on_user_id_and_created_at"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "commissions", :force => true do |t|
    t.string   "comm_type"
    t.decimal  "comm_value",       :precision => 5,  :scale => 2
    t.boolean  "is_enabled",                                      :default => true
    t.integer  "agent_id"
    t.integer  "destination_id"
    t.integer  "tag_id"
    t.string   "type_of_tag"
    t.decimal  "priority",         :precision => 10, :scale => 0
    t.date     "effective_date"
    t.date     "expiry_date"
    t.string   "type_of_traveler"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agent_loc"
    t.string   "traveler_loc"
  end

  add_index "commissions", ["agent_id", "type_of_traveler"], :name => "index_commissions_on_agent_id_and_type_of_traveler"
  add_index "commissions", ["destination_id", "agent_id"], :name => "index_commissions_on_destination_id_and_agent_id"
  add_index "commissions", ["destination_id", "tag_id"], :name => "index_commissions_on_destination_id_and_tag_id"
  add_index "commissions", ["destination_id", "type_of_tag"], :name => "index_commissions_on_destination_id_and_type_of_tag"
  add_index "commissions", ["destination_id"], :name => "index_commissions_on_destination_id"
  add_index "commissions", ["effective_date"], :name => "index_commissions_on_effective_date"
  add_index "commissions", ["expiry_date"], :name => "index_commissions_on_expiry_date"

  create_table "contact_infos", :force => true do |t|
    t.text     "address",                                 :null => false
    t.integer  "phone_cc"
    t.integer  "phone_ac"
    t.string   "phone_no"
    t.integer  "phone_extension"
    t.string   "mobile"
    t.string   "city",                                    :null => false
    t.integer  "zip_code",                                :null => false
    t.string   "time_zone",                               :null => false
    t.integer  "user_id",                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :null => false
    t.string   "country",            :default => "India", :null => false
    t.string   "multiValuedPhoneNo"
  end

  add_index "contact_infos", ["user_id"], :name => "index_contact_infos_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.boolean  "domestic",       :default => false
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_rules", :force => true do |t|
    t.string   "operator"
    t.integer  "coupon_id"
    t.integer  "couponrule_template_id"
    t.string   "attribute_value"
    t.string   "error_text"
    t.string   "status",                 :default => "active"
    t.string   "rule_query"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupon_rules", ["coupon_id"], :name => "index_coupon_rules_on_coupon_id"
  add_index "coupon_rules", ["couponrule_template_id"], :name => "index_coupon_rules_on_couponrule_template_id"

  create_table "couponrule_templates", :force => true do |t|
    t.string   "model_name"
    t.string   "attribute_name"
    t.string   "attribute_type"
    t.string   "query_template"
    t.string   "context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", :force => true do |t|
    t.string   "code"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
    t.string   "status",         :default => "inactive"
    t.string   "context"
    t.text     "tnc"
    t.string   "success_msg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discount_type"
    t.integer  "discount_value"
    t.integer  "max_discount"
  end

  add_index "coupons", ["code"], :name => "index_coupons_on_code", :unique => true

  create_table "crons", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value_type"
    t.float    "value"
    t.text     "values_text"
    t.string   "currency"
  end

  create_table "currency_conversions", :force => true do |t|
    t.date     "date"
    t.string   "currency"
    t.float    "conversion_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customizations", :force => true do |t|
    t.string   "qtype"
    t.integer  "sequence"
    t.boolean  "is_generic"
    t.integer  "destination_id"
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
    t.boolean  "visible_to_agent", :default => true
    t.string   "value_type"
  end

  add_index "customizations", ["destination_id"], :name => "index_customizations_on_destination_id"

  create_table "data_migrations", :id => false, :force => true do |t|
    t.string "version", :null => false
  end

  add_index "data_migrations", ["version"], :name => "unique_data_migrations", :unique => true

  create_table "declinedquotes", :force => true do |t|
    t.integer  "quote_id"
    t.integer  "user_id"
    t.integer  "declinereason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",                              :default => 0
    t.integer  "attempts",                              :default => 0
    t.text     "handler",           :limit => 16777215
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "requested_trip_id"
    t.string   "queue"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deliverables", :force => true do |t|
    t.string   "name"
    t.string   "delivered_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departure_infos", :force => true do |t|
    t.integer  "city_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
  end

  create_table "destination_activities", :force => true do |t|
    t.integer "destination_id"
    t.integer "activity_id"
    t.text    "description"
  end

  create_table "destination_experiences", :force => true do |t|
    t.string   "heading"
    t.string   "desc"
    t.string   "video_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_nurturings", :force => true do |t|
    t.string   "summary"
    t.string   "budget_rating"
    t.string   "dest_budget_desc"
    t.string   "recommend_days"
    t.string   "recommend_nights"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  add_index "destination_nurturings", ["budget_rating"], :name => "index_destination_nurturings_on_budget_rating"
  add_index "destination_nurturings", ["destination_id"], :name => "index_destination_nurturings_on_destination_id"

  create_table "destination_ops", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "op_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_themes", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_trip_types", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "trip_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "title",               :default => ""
    t.text     "desc"
    t.text     "short_desc"
  end

  add_index "destination_trip_types", ["destination_id"], :name => "index_destination_trip_types_on_destination_id"
  add_index "destination_trip_types", ["trip_type_id", "destination_id"], :name => "index_destination_trip_types_on_trip_type_id_and_destination_id"
  add_index "destination_trip_types", ["trip_type_id"], :name => "index_destination_trip_types_on_trip_type_id"

  create_table "destination_weekend_destinations", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "weekend_dest_id"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "travel_time"
  end

  add_index "destination_weekend_destinations", ["destination_id", "weekend_dest_id"], :name => "week_dest_index"
  add_index "destination_weekend_destinations", ["destination_id"], :name => "index_destination_weekend_destinations_on_destination_id"
  add_index "destination_weekend_destinations", ["weekend_dest_id"], :name => "index_destination_weekend_destinations_on_weekend_dest_id"

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "short_desc"
    t.integer  "tours",                          :default => 0
    t.boolean  "published",                      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "canonical_names"
    t.string   "destination_type"
    t.integer  "min_budget"
    t.integer  "max_budget"
    t.text     "best_time_to_visit"
    t.string   "level"
    t.text     "desc"
    t.text     "how_to_reach"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "min_days",                       :default => 1
    t.integer  "max_days",                       :default => 30
    t.string   "region"
    t.string   "tourism_video_link"
    t.integer  "tag_distribution_count",         :default => 1
    t.integer  "restrict_budget_with_flight",    :default => 6000
    t.integer  "restrict_budget_without_flight", :default => 1000
    t.text     "from_places"
    t.text     "nationalities"
    t.text     "cost_desc"
    t.text     "tour_package_desc"
    t.text     "days_desc"
    t.text     "from_desc"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "continent_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "visa_on_arrival",                :default => false
    t.integer  "rank",                           :default => 1000
    t.string   "seo_title"
    t.integer  "trip_min_days"
    t.integer  "trip_max_days"
    t.boolean  "new_dest",                       :default => false
    t.boolean  "is_top_selling",                 :default => false
    t.boolean  "is_hot",                         :default => false
    t.boolean  "is_honeymoon",                   :default => false
    t.string   "slug"
    t.integer  "honeymoon_rank"
  end

  add_index "destinations", ["city_id"], :name => "index_destinations_on_city_id"
  add_index "destinations", ["name"], :name => "index_destinations_on_name", :length => {"name"=>7}
  add_index "destinations", ["slug"], :name => "index_destinations_on_slug"

  create_table "destinations_cities", :id => false, :force => true do |t|
    t.integer "destination_id"
    t.integer "city_id"
  end

  add_index "destinations_cities", ["destination_id", "city_id"], :name => "index_destinations_cities_on_destination_id_and_city_id", :unique => true

  create_table "destinations_extends", :force => true do |t|
    t.string   "airport_city"
    t.string   "airport_name"
    t.string   "airport_code"
    t.decimal  "total_flights",        :precision => 10, :scale => 0
    t.binary   "airport_rest_data"
    t.string   "bus_station_city"
    t.decimal  "buses_reached_from",   :precision => 10, :scale => 0
    t.binary   "buses_rest_data"
    t.string   "railway_station_name"
    t.string   "railway_station_city"
    t.string   "railway_station_code"
    t.decimal  "max_trains",           :precision => 10, :scale => 0
    t.binary   "trains_rest_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destination_id"
  end

  add_index "destinations_extends", ["airport_code"], :name => "index_destinations_extends_on_airport_code"
  add_index "destinations_extends", ["destination_id"], :name => "index_destinations_extends_on_destination_id"
  add_index "destinations_extends", ["railway_station_code"], :name => "index_destinations_extends_on_railway_station_code"

  create_table "device_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "device_token"
    t.string   "os_version"
    t.string   "app_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_type"
    t.string   "reg_id"
  end

  create_table "dining_descs", :force => true do |t|
    t.integer  "hotel_id"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "doc_type"
    t.text     "requested_trip_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "email_messages", :force => true do |t|
    t.text     "subject"
    t.text     "body"
    t.integer  "comment_id"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_messages", ["comment_id"], :name => "index_email_messages_on_comment_id"
  add_index "email_messages", ["email_id"], :name => "index_email_messages_on_email_id"

  create_table "email_templates", :force => true do |t|
    t.string   "mailer_category",                    :null => false
    t.string   "mailer_name",                        :null => false
    t.string   "template_name",                      :null => false
    t.text     "template_text"
    t.text     "subject"
    t.boolean  "deleted",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "percentage",      :default => 0
    t.integer  "percentage_min",  :default => 0
    t.integer  "percentage_max",  :default => 0
  end

  create_table "email_trackings", :force => true do |t|
    t.string   "email"
    t.string   "email_type"
    t.datetime "sent_at"
    t.datetime "viewed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "email",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",      :limit => 1, :default => 0
    t.string   "status_mail"
  end

  add_index "emails", ["email"], :name => "index_emails_on_email", :unique => true

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "faqable_type"
    t.integer  "faqable_id"
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.string   "level"
    t.boolean  "is_for_agent",     :default => false
  end

  add_index "faqs", ["accountable_id", "accountable_type"], :name => "index_faqs_on_accountable_id_and_accountable_type"
  add_index "faqs", ["faqable_id", "faqable_type"], :name => "index_faqs_on_faqable_id_and_faqable_type"

  create_table "feedbacks", :force => true do |t|
    t.text     "body"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_feedback", :default => "query"
    t.datetime "time"
  end

  create_table "financials", :force => true do |t|
    t.integer  "destination_id"
    t.date     "month_end_date"
    t.integer  "marketing_facebook"
    t.integer  "ops"
    t.integer  "misc"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marketing_adword"
    t.integer  "marketing_misc"
  end

  create_table "flight_cities", :force => true do |t|
    t.string   "heading"
    t.integer  "from_id"
    t.integer  "to_id"
    t.text     "comments"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",  :default => false
    t.float    "duration"
  end

  add_index "flight_cities", ["from_id", "to_id"], :name => "index_flight_cities_on_from_id_and_to_id"
  add_index "flight_cities", ["from_id"], :name => "index_flight_cities_on_from_id"
  add_index "flight_cities", ["to_id"], :name => "index_flight_cities_on_to_id"

  create_table "flight_details", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.date     "going_date"
    t.date     "coming_date"
    t.integer  "no_of_adults"
    t.integer  "no_of_children"
    t.integer  "no_of_infants"
    t.string   "no_of_stops"
    t.string   "preferred_time_going"
    t.string   "preferred_time_coming"
    t.boolean  "dates_flexible"
    t.text     "comments"
    t.boolean  "status"
    t.integer  "requested_trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flight_follow_ups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "flight_detail_id"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flight_options", :force => true do |t|
    t.float    "cost_price"
    t.float    "offer_price"
    t.string   "currency"
    t.text     "comments"
    t.string   "status"
    t.integer  "flight_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "footer_links", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "onhover"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "footer_section_id"
    t.boolean  "is_nofollow"
  end

  create_table "footer_sections", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "footer_sectionable_type"
    t.integer  "footer_sectionable_id"
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.string   "level"
    t.text     "header_below_text"
    t.text     "footer_above_text"
  end

  add_index "footer_sections", ["accountable_id", "accountable_type"], :name => "index_footer_sections_on_accountable_id_and_accountable_type"
  add_index "footer_sections", ["footer_sectionable_id", "footer_sectionable_type"], :name => "footer_sectionable_id_and_footer_sectionable_type"

  create_table "funnel_tracks", :force => true do |t|
    t.integer  "requested_trip_id", :null => false
    t.string   "status",            :null => false
    t.integer  "user_id"
    t.text     "reason"
    t.text     "other_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_decline_reasons", :force => true do |t|
    t.integer  "quote_id"
    t.integer  "quote_decline_reason_id"
    t.string   "other_quote_decline_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geo_names_feature_codes", :force => true do |t|
    t.integer  "major_id"
    t.string   "includes"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "rank"
  end

  add_index "geo_names_feature_codes", ["major_id"], :name => "index_geo_names_feature_codes_on_major_id"

  create_table "geonames", :force => true do |t|
    t.integer  "geonameid"
    t.string   "name"
    t.string   "asciiname"
    t.string   "alternatenames"
    t.decimal  "latitude",          :precision => 10, :scale => 0
    t.decimal  "longitude",         :precision => 10, :scale => 0
    t.string   "feature_class"
    t.string   "feature_code"
    t.string   "country_code"
    t.string   "cc2"
    t.string   "admin1"
    t.string   "admin2"
    t.string   "admin3"
    t.string   "admin4"
    t.integer  "population"
    t.decimal  "elevation",         :precision => 10, :scale => 0
    t.decimal  "gtopo30",           :precision => 10, :scale => 0
    t.string   "timezone"
    t.datetime "modification_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_rate_plans", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "normal_price"
    t.integer  "with_extra_bed_price"
    t.string   "room_category"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_reviews", :force => true do |t|
    t.string   "name"
    t.string   "ta_url"
    t.integer  "g_id"
    t.integer  "d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "city_id"
    t.text     "address"
    t.string   "tripadvisor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "discount"
    t.text     "description"
    t.text     "included"
    t.text     "tnc"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.float    "rating"
    t.string   "address1"
    t.integer  "eanhotel_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "loc_short_add"
    t.string   "checkin_time"
    t.string   "checkout_time"
    t.integer  "property_type_id"
    t.string   "pin_code",             :limit => 10
    t.string   "ta_url"
    t.integer  "g_id"
    t.integer  "d_id"
    t.integer  "clear_trip_id"
    t.string   "phone"
    t.string   "fax"
    t.string   "emails"
    t.string   "website"
    t.text     "directions"
    t.integer  "no_of_rooms"
    t.integer  "in_active"
    t.string   "canonical_hotel_ids"
    t.integer  "min_price"
    t.integer  "status",                                                            :default => 1
    t.boolean  "delta",                                                             :default => true
    t.boolean  "is_recommended",                                                    :default => false
    t.string   "budget_category"
    t.decimal  "max_price",                          :precision => 10, :scale => 0
    t.boolean  "is_default",                                                        :default => false
    t.boolean  "published",                                                         :default => true
    t.boolean  "is_published_seo",                                                  :default => false
  end

  add_index "hotels", ["city_id"], :name => "index_hotels_on_city_id"
  add_index "hotels", ["is_default"], :name => "index_hotels_on_is_default"
  add_index "hotels", ["name", "city_id", "pin_code", "created_at"], :name => "index_hotels_on_name_and_city_id_and_pin_code_and_created_at", :unique => true
  add_index "hotels", ["name", "city_id", "pin_code"], :name => "index_hotels_on_name_and_city_id_and_pin_code", :unique => true
  add_index "hotels", ["name", "city_id"], :name => "index_hotels_on_name_and_city_id"

  create_table "hotels_inclusions", :id => false, :force => true do |t|
    t.integer "hotel_id"
    t.integer "inclusion_id"
  end

  add_index "hotels_inclusions", ["hotel_id", "inclusion_id"], :name => "index_hotels_inclusions_on_hotel_id_and_inclusion_id", :unique => true

  create_table "html_tags", :force => true do |t|
    t.string   "keyword"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destinationable_id",   :default => -1
    t.string   "destinationable_type"
    t.integer  "categoriable_id",      :default => -1
    t.string   "categoriable_type"
    t.string   "level",                :default => "package"
  end

  add_index "html_tags", ["categoriable_id", "categoriable_type"], :name => "index_html_tags_on_categoriable_id_and_categoriable_type"
  add_index "html_tags", ["categoriable_id", "destinationable_id"], :name => "index_html_tags_on_categoriable_id_and_destinationable_id"
  add_index "html_tags", ["categoriable_id"], :name => "index_html_tags_on_categoriable_id"
  add_index "html_tags", ["destinationable_id", "destinationable_type"], :name => "index_html_tags_on_destinationable_id_and_destinationable_type"
  add_index "html_tags", ["destinationable_id"], :name => "index_html_tags_on_destinationable_id"

  create_table "images", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "s_image_url"
    t.string   "m_image_url"
    t.string   "l_image_url"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_type"
  end

  add_index "images", ["imageable_id", "imageable_type"], :name => "index_images_on_imageable_id_and_imageable_type"
  add_index "images", ["imageable_id"], :name => "index_images_on_imageable_id"

  create_table "inclusions", :force => true do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "options",          :default => "---\n:type:\n- 0\n"
    t.integer  "destination_id"
    t.boolean  "visible_to_agent", :default => true
    t.boolean  "is_nurturing",     :default => false
    t.integer  "order_in_form",    :default => 0
  end

  create_table "invoices", :force => true do |t|
    t.string   "fullname"
    t.string   "phone_no"
    t.string   "email"
    t.text     "toc"
    t.text     "trip_details"
    t.float    "ttcommission"
    t.float    "agent_earning"
    t.integer  "agent_id"
    t.integer  "quote_id"
    t.string   "traveller_fullname"
    t.string   "traveller_email"
    t.string   "traveller_phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.float    "price"
    t.string   "invoice_id"
    t.string   "address"
    t.float    "tax"
    t.string   "filename"
    t.integer  "voucher_days",                                                       :default => 3
    t.integer  "requested_trip_id"
    t.string   "currency",                                                           :default => "Rupee"
    t.text     "changed_logs"
    t.float    "flight_amount"
    t.float    "discount"
    t.integer  "tt_discount_reason",     :limit => 1
    t.decimal  "discount_traveller",                  :precision => 10, :scale => 0
    t.date     "payment_proof_due_date"
    t.decimal  "visa_cost",                           :precision => 10, :scale => 0
    t.string   "voucher_rejection_msg"
    t.integer  "flight_option_id"
    t.text     "flight_details"
    t.boolean  "is_approve",                                                         :default => false
  end

  add_index "invoices", ["quote_id"], :name => "index_invoices_on_quote_id"
  add_index "invoices", ["requested_trip_id"], :name => "index_invoices_on_requested_trip_id"

  create_table "invoices_deliverables", :force => true do |t|
    t.integer "invoice_id"
    t.integer "deliverable_id"
    t.text    "comments"
  end

  create_table "itineraries", :force => true do |t|
    t.integer  "destination_id"
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "days"
    t.string   "tags"
    t.integer  "user_id"
    t.text     "extra_inclusions"
    t.text     "extra_exclusions"
    t.float    "ratings"
    t.boolean  "visibility"
    t.integer  "picfile_id"
    t.text     "tnc"
    t.integer  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itineraries_inclusions", :id => false, :force => true do |t|
    t.integer "itinerary_id"
    t.integer "inclusion_id"
  end

  create_table "junk_remove_line_regexes", :force => true do |t|
    t.string   "regex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "junk_remove_words", :force => true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_new_junk"
    t.boolean  "is_after_cleaning_junk", :default => false
  end

  create_table "junk_remove_words_regexes", :force => true do |t|
    t.string   "regex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "label_details", :force => true do |t|
    t.integer  "label_id"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "label_details", ["labelable_id", "labelable_type"], :name => "index_label_details_on_labelable_id_and_labelable_type"

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.string   "type"
    t.string   "options"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", :force => true do |t|
    t.integer  "agent_id",                  :null => false
    t.integer  "user_id",                   :null => false
    t.integer  "ref_id"
    t.string   "reference",                 :null => false
    t.integer  "count",      :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_emails", :force => true do |t|
    t.string   "email"
    t.integer  "notify_count", :default => 0
    t.string   "bit_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "clicked",      :default => false
    t.integer  "base",         :default => 1
    t.integer  "priority",     :default => 0
  end

  create_table "marketing_packages", :force => true do |t|
    t.integer  "package_detail_id"
    t.integer  "marketing_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marketing_packages", ["marketing_page_id", "package_detail_id"], :name => "mpage_packdetail_index", :unique => true
  add_index "marketing_packages", ["package_detail_id"], :name => "index_marketing_packages_on_package_detail_id"

  create_table "marketing_pages", :force => true do |t|
    t.string   "headline_hero_img"
    t.string   "recently_booked_package_headline"
    t.string   "recently_booked_package_sub_headline"
    t.text     "about_destination"
    t.string   "page_title"
    t.boolean  "include_script"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sub_headline_hero_img"
    t.string   "destination"
    t.string   "description"
    t.string   "keywords"
    t.string   "currency"
    t.string   "quote_heading"
    t.string   "cta1"
    t.string   "cta2"
    t.string   "cta3"
    t.string   "proxy_dest"
  end

  add_index "marketing_pages", ["destination"], :name => "index_marketing_pages_on_destination"
  add_index "marketing_pages", ["url"], :name => "index_marketing_pages_on_url"

  create_table "marketing_pages_testimonials", :force => true do |t|
    t.integer  "marketing_page_id"
    t.integer  "testimonial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marketing_pages_testimonials", ["marketing_page_id", "testimonial_id"], :name => "mt_pg_testm_index"

  create_table "marketing_pages_users", :force => true do |t|
    t.integer  "marketing_page_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marketing_pages_users", ["marketing_page_id", "user_id"], :name => "mt_pg_user_index"

  create_table "marketing_rules", :force => true do |t|
    t.string   "creator"
    t.string   "rule"
    t.string   "l1"
    t.string   "l2"
    t.string   "l3"
    t.string   "l4"
    t.string   "l5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "most_selling_packages", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "days"
    t.float    "percentage"
    t.integer  "min_price"
    t.integer  "max_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

  add_index "most_selling_packages", ["destination_id", "days"], :name => "index_most_selling_packages_on_destination_id_and_days"
  add_index "most_selling_packages", ["destination_id"], :name => "index_most_selling_packages_on_destination_id"

  create_table "multimedias", :force => true do |t|
    t.string  "content_type"
    t.integer "trip_id"
    t.string  "embed_code"
  end

  add_index "multimedias", ["trip_id"], :name => "index_multimedias_on_trip_id"

  create_table "notes", :force => true do |t|
    t.integer  "record_id"
    t.string   "attr1"
    t.string   "attr2"
    t.string   "attr3"
    t.string   "attr4"
    t.float    "attr5"
    t.float    "attr6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "task"
    t.integer  "notificationable_id"
    t.string   "notificationable_type"
    t.text     "description"
  end

  add_index "notifications", ["user_id", "notificationable_id"], :name => "index_notifications_on_user_id_and_notificationable_id"

  create_table "nurturing_budget_types", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "budget_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_budget_types", ["budget_type_id"], :name => "index_nurturing_budget_types_on_budget_type_id"
  add_index "nurturing_budget_types", ["destination_nurturing_id", "budget_type_id"], :name => "index_on_nurturing_bbudget_types", :unique => true

  create_table "nurturing_destination_experiences", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "destination_experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_destination_experiences", ["destination_experience_id"], :name => "index_on_ddestination_experiences_id"
  add_index "nurturing_destination_experiences", ["destination_nurturing_id", "destination_experience_id"], :name => "index_on_nurturing_ddestination_experiences", :unique => true

  create_table "nurturing_inclusions", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "inclusion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_inclusions", ["destination_nurturing_id", "inclusion_id"], :name => "index_on_nurturing_iinclusions", :unique => true
  add_index "nurturing_inclusions", ["inclusion_id"], :name => "index_nurturing_inclusions_on_inclusion_id"

  create_table "nurturing_user_experiences", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "user_experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_user_experiences", ["destination_nurturing_id", "user_experience_id"], :name => "index_on_nurturing_uuser_experiences", :unique => true
  add_index "nurturing_user_experiences", ["user_experience_id"], :name => "index_nurturing_user_experiences_on_user_experience_id"

  create_table "nurturing_visa_infos", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "visa_info_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_visa_infos", ["destination_nurturing_id", "visa_info_id"], :name => "index_on_nurturing_vvisa_infos", :unique => true
  add_index "nurturing_visa_infos", ["visa_info_id"], :name => "index_nurturing_visa_infos_on_visa_info_id"

  create_table "nurturing_weather_infos", :force => true do |t|
    t.integer  "destination_nurturing_id"
    t.integer  "weather_info_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nurturing_weather_infos", ["destination_nurturing_id", "weather_info_id"], :name => "index_on_nurturing_wweather_infos", :unique => true
  add_index "nurturing_weather_infos", ["weather_info_id"], :name => "index_nurturing_weather_infos_on_weather_info_id"

  create_table "offer_partners", :force => true do |t|
    t.string   "name"
    t.integer  "is_external", :default => 1
    t.integer  "is_active",   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "running_status", :default => "0"
    t.text     "standard_tnc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers_provided_by_partners", :force => true do |t|
    t.integer  "offer_type_id"
    t.integer  "offer_partner_id"
    t.integer  "is_multiple",      :default => 0
    t.integer  "is_active",        :default => 1
    t.text     "tnc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offline_chats", :force => true do |t|
    t.text     "offline_messg", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id",     :null => false
    t.integer  "receiver_id",   :null => false
  end

  create_table "old_tag_emails", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ops", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "remarks"
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "customization_id"
    t.text     "url"
    t.text     "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
  end

  add_index "options", ["customization_id"], :name => "index_options_on_customization_id"

  create_table "orders", :force => true do |t|
    t.integer  "order_no"
    t.integer  "order_id"
    t.string   "order_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "otps", :force => true do |t|
    t.string   "msg_text"
    t.integer  "is_used",       :default => 0
    t.integer  "user_phone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.string   "api_sms_id"
  end

  add_index "otps", ["user_phone_id"], :name => "index_otps_on_user_phone_id"

  create_table "package_details", :force => true do |t|
    t.integer  "number_of_travellers"
    t.string   "duration"
    t.string   "city"
    t.integer  "hotel_ratings"
    t.string   "hotel_name"
    t.integer  "price1"
    t.string   "price1_subtitle"
    t.integer  "price2"
    t.string   "price2_subtitle"
    t.boolean  "hotel"
    t.boolean  "return_transfer"
    t.boolean  "flights"
    t.boolean  "meals"
    t.boolean  "sightseeing"
    t.boolean  "visa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marketing_page_id"
    t.integer  "sub_heading_number"
    t.string   "title",                :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "top_3_activites"
    t.text     "difference_TT"
    t.text     "packages"
    t.string   "category"
    t.string   "activity"
    t.boolean  "visible"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "image_urls"
    t.text     "call_to_action"
    t.integer  "trip_type_id"
  end

  add_index "pages", ["destination_id"], :name => "index_pages_on_destination_id"

  create_table "panoramas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link",                                  :null => false
    t.text     "desc"
    t.integer  "venue_id"
    t.string   "title",                                 :null => false
    t.boolean  "panIndex",   :default => false
    t.integer  "rating",     :default => 3
    t.boolean  "isActive",   :default => false
    t.string   "template",   :default => "pan_logo_RB"
    t.integer  "city_id"
    t.boolean  "has_swf",    :default => false
  end

  add_index "panoramas", ["venue_id"], :name => "index_panoramas_on_venue_id"

  create_table "passport_infos", :force => true do |t|
    t.string   "name"
    t.string   "passport_no"
    t.date     "issued_date"
    t.date     "expiry_date"
    t.string   "issued_place"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.float    "from_traveler"
    t.datetime "created_at"
    t.string   "method"
    t.float    "to_agent"
    t.string   "status"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "invoice_id"
    t.datetime "received_at"
    t.datetime "transfered_at"
    t.string   "traveler_currency",    :default => "Rupee"
    t.string   "agent_currency",       :default => "Rupee"
    t.float    "from_traveler_actual"
    t.float    "to_agent_actual"
    t.date     "scheduled_date"
    t.integer  "payu_merchant_id",     :default => 0
    t.boolean  "auto_tranch",          :default => false
  end

  add_index "payments", ["invoice_id"], :name => "index_payments_on_invoice_id"
  add_index "payments", ["method"], :name => "index_payments_on_method"
  add_index "payments", ["status"], :name => "index_payments_on_status"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "picfiles", :force => true do |t|
    t.string   "image_url"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "picfiles", ["city_id"], :name => "index_picfiles_on_city_id"

  create_table "picture_infos", :force => true do |t|
    t.integer  "picture_id"
    t.string   "alt_text"
    t.string   "caption_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "attraction_image_file_name"
    t.string   "attraction_image_content_type"
    t.integer  "attraction_image_file_size"
    t.datetime "attraction_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attraction_id"
    t.integer  "destination_id"
    t.integer  "hotel_id"
    t.integer  "destination_experience_id"
    t.integer  "user_experience_id"
    t.integer  "destination_nurturing_id"
    t.boolean  "is_default",                    :default => false
    t.string   "aspect_ratio"
    t.integer  "destination_trip_type_id"
    t.integer  "trip_type_id"
  end

  add_index "pictures", ["attraction_id"], :name => "index_pictures_on_attraction_id"
  add_index "pictures", ["destination_experience_id"], :name => "index_pictures_on_destination_experience_id"
  add_index "pictures", ["destination_id"], :name => "index_pictures_on_destination_id"
  add_index "pictures", ["destination_nurturing_id"], :name => "index_pictures_on_destination_nurturing_id"
  add_index "pictures", ["destination_trip_type_id"], :name => "index_pictures_on_destination_trip_type_id"
  add_index "pictures", ["hotel_id"], :name => "hotel_idx"
  add_index "pictures", ["hotel_id"], :name => "index_pictures_on_hotel_id"
  add_index "pictures", ["trip_type_id"], :name => "index_pictures_on_trip_type_id"
  add_index "pictures", ["user_experience_id"], :name => "index_pictures_on_user_experience_id"

  create_table "preferences", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.string   "answerids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customization_id"
    t.integer  "requested_trip_id"
    t.string   "userinputs"
  end

  add_index "preferences", ["customization_id", "requested_trip_id"], :name => "index_preferences_on_customization_id_and_requested_trip_id"
  add_index "preferences", ["requested_trip_id"], :name => "index_preferences_on_requested_trip_id"

  create_table "press_releases", :force => true do |t|
    t.text     "heading"
    t.datetime "released_date"
    t.integer  "priority"
    t.string   "url"
    t.text     "brief_description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.integer  "priceable_id"
    t.string   "priceable_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "price",          :precision => 10, :scale => 0
    t.string   "currency",                                      :default => "Rupee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "min_price",      :precision => 10, :scale => 0
    t.decimal  "max_price",      :precision => 10, :scale => 0
  end

  add_index "prices", ["priceable_id", "priceable_type"], :name => "index_prices_on_priceable_id_and_priceable_type"

  create_table "private_attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "producttype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_attributes", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "attribute_list_id"
    t.string   "append_text"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_attributes", ["hotel_id", "attribute_list_id"], :name => "index_property_attributes_on_hotel_id_and_attribute_list_id"

  create_table "property_descs", :force => true do |t|
    t.integer  "hotel_id"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_types", :force => true do |t|
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "push_notifications", :force => true do |t|
    t.integer  "notification_type",         :limit => 1
    t.integer  "triggered_by"
    t.integer  "triggered_for"
    t.string   "action_type"
    t.string   "message"
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.datetime "expiry_time"
    t.text     "extra_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notification_category"
    t.string   "notification_sub_category"
    t.integer  "requested_trip_id"
    t.boolean  "read"
  end

  add_index "push_notifications", ["notifiable_type", "notifiable_id"], :name => "index_push_notification_on_notifiable"
  add_index "push_notifications", ["requested_trip_id", "notifiable_type", "notifiable_id"], :name => "index_push_notification_on_requested_trip_id_and_notifiable"
  add_index "push_notifications", ["triggered_by"], :name => "index_push_notification_on_triggered_by"
  add_index "push_notifications", ["triggered_for", "notifiable_type", "notifiable_id"], :name => "index_push_notification_on_triggered_for_and_notifiable"

  create_table "queries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.integer  "q_by_user_id"
    t.integer  "q_to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "queries", ["q_by_user_id", "q_to_user_id"], :name => "index_queries_on_q_by_user_id_and_q_to_user_id"

  create_table "questions", :force => true do |t|
    t.string   "headline"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "view_count"
    t.integer  "answers_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_cities", :force => true do |t|
    t.integer  "trip_day_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_id"
    t.integer  "is_alternate", :default => 0
    t.text     "comments"
    t.string   "room_type"
  end

  add_index "quote_cities", ["city_id"], :name => "index_quote_cities_on_city_id"
  add_index "quote_cities", ["trip_day_id", "city_id", "hotel_id"], :name => "index_quote_cities_on_trip_day_id_and_city_id_and_hotel_id", :unique => true
  add_index "quote_cities", ["trip_day_id"], :name => "index_quote_cities_on_trip_day_id"

  create_table "quote_city_attractions", :force => true do |t|
    t.integer  "quote_city_id"
    t.integer  "attraction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quote_city_attractions", ["attraction_id"], :name => "index_quote_city_attractions_on_attraction_id"
  add_index "quote_city_attractions", ["quote_city_id", "attraction_id"], :name => "index_quote_city_attractions_on_quote_city_id_and_attraction_id", :unique => true
  add_index "quote_city_attractions", ["quote_city_id"], :name => "index_quote_city_attractions_on_quote_city_id"

  create_table "quote_decline_reasons", :force => true do |t|
    t.integer  "reason_value"
    t.string   "reason_short_name"
    t.string   "reason_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_funnel_tracks", :force => true do |t|
    t.string   "status",       :null => false
    t.integer  "user_id"
    t.string   "reason"
    t.text     "other_reason"
    t.integer  "quote_id"
    t.string   "platform"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_hotels", :force => true do |t|
    t.integer  "quote_id"
    t.integer  "hotel_id"
    t.string   "hotelline"
    t.boolean  "is_matched"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "is_valid",   :default => -1
  end

  add_index "quote_hotels", ["hotel_id"], :name => "index_quote_hotels_hotel_id"
  add_index "quote_hotels", ["hotel_id"], :name => "index_quote_hotels_on_hotel_id"
  add_index "quote_hotels", ["hotelline", "quote_id"], :name => "index_quote_hotels_on_hotelline_and_quote_id"
  add_index "quote_hotels", ["quote_id", "hotel_id"], :name => "index_quote_hotels_on_quote_id_and_hotel_id"

  create_table "quote_hotels_canonical_names", :force => true do |t|
    t.integer  "quote_hotel_id"
    t.integer  "hotel_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quote_hotels_canonical_names", ["quote_hotel_id", "hotel_id"], :name => "index_quotes_hotels_canonical_names_on_qh_id_and_hotel_id", :unique => true

  create_table "quote_inclusions", :force => true do |t|
    t.integer  "inclusion_id"
    t.integer  "quote_id"
    t.boolean  "is_included"
    t.string   "comments_added", :limit => 2047
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quote_inclusions", ["quote_id"], :name => "index_quote_inclusions_on_quote_id"

  create_table "quote_stats", :force => true do |t|
    t.datetime "first_seen_at"
    t.datetime "last_seen_at"
    t.integer  "viewed_count",        :default => 0
    t.integer  "quote_id",                           :null => false
    t.string   "first_seen_from"
    t.string   "last_seen_from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_seen_platform"
    t.text     "misc_info"
  end

  add_index "quote_stats", ["quote_id"], :name => "index_quote_stats_on_quote_id", :unique => true

  create_table "quote_tab_stats", :force => true do |t|
    t.string   "tab_name",                               :null => false
    t.integer  "viewed_count", :default => 0
    t.integer  "quote_id"
    t.text     "time_stamps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "platform",     :default => "Not_mobile"
  end

  create_table "quotes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requested_trip_id"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                                                  :default => 1,       :null => false
    t.integer  "trip_id"
    t.string   "type_of_trip"
    t.integer  "days",                                                    :default => 1
    t.text     "places"
    t.text     "included"
    t.text     "excluded"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.string   "perperson"
    t.integer  "show_contact_info"
    t.text     "info_from_admin"
    t.text     "flights"
    t.text     "hotels"
    t.string   "hotel_accommodation_type"
    t.string   "facilities"
    t.boolean  "need_reply",                                              :default => false
    t.string   "currency",                                                :default => "Rupee"
    t.integer  "agent_status",                                            :default => 0
    t.datetime "needed_reply_since"
    t.datetime "last_replied_at"
    t.integer  "auto_quote_status",                                       :default => 0
    t.text     "info_from_agent"
    t.integer  "agent_sub_status",                                        :default => 1
    t.text     "cities_list"
    t.string   "hotel_category",                                          :default => ""
    t.string   "suitable_for",                                            :default => ""
    t.text     "versions_log"
    t.string   "title"
    t.integer  "decline_reason",                                          :default => 0
    t.boolean  "delta",                                                   :default => true
    t.integer  "per_person_budget"
    t.boolean  "is_most_selling_package",                                 :default => false
    t.string   "during_stay_info"
    t.text     "cabs"
    t.integer  "nights"
    t.text     "terms_conditions"
    t.text     "transfer"
    t.decimal  "flight_cost",              :precision => 10, :scale => 0
    t.decimal  "visa_cost",                :precision => 10, :scale => 0
    t.datetime "top_package"
    t.boolean  "marked_forcefully"
    t.boolean  "system_unmarked"
    t.string   "comm_type"
    t.decimal  "comm_value",               :precision => 5,  :scale => 2
    t.string   "discountable_type"
    t.integer  "discountable_type_id"
  end

  add_index "quotes", ["created_at", "user_id"], :name => "index_quotes_on_created_at_and_user_id"
  add_index "quotes", ["is_most_selling_package", "days", "per_person_budget"], :name => "most_selling_days_budget_idx"
  add_index "quotes", ["is_most_selling_package", "days"], :name => "index_quotes_on_is_most_selling_package_and_days"
  add_index "quotes", ["is_most_selling_package"], :name => "index_quotes_on_is_most_selling_package"
  add_index "quotes", ["requested_trip_id"], :name => "index_quotes_on_requested_trip_id"
  add_index "quotes", ["status"], :name => "index_quotes_on_status"
  add_index "quotes", ["user_id", "requested_trip_id", "created_at"], :name => "index_quotes_on_user_id_and_requested_trip_id_and_created_at"
  add_index "quotes", ["user_id"], :name => "index_quotes_on_user_id"

  create_table "quotes_tags", :force => true do |t|
    t.integer  "quote_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rating",                      :default => 0
    t.datetime "created_at",                                  :null => false
    t.string   "rateable_type", :limit => 15, :default => "", :null => false
    t.integer  "rateable_id",                 :default => 0,  :null => false
    t.integer  "user_id",                     :default => 0,  :null => false
  end

  add_index "ratings", ["rateable_id"], :name => "index_ratings_on_rateable_id"

  create_table "reademails", :force => true do |t|
    t.integer  "user_id"
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.string   "name"
    t.string   "record_type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referer_infos", :force => true do |t|
    t.string   "network"
    t.string   "site"
    t.string   "campaign_name"
    t.string   "cid"
    t.string   "ad_set_name"
    t.string   "ad_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "medium"
  end

  create_table "referer_links", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "referer",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referer_users", :force => true do |t|
    t.string   "device_id"
    t.integer  "user_id"
    t.integer  "requested_trip_id"
    t.integer  "referer_info_id"
    t.string   "unique_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "platform"
    t.text     "misc_info"
    t.text     "custom_referer"
  end

  add_index "referer_users", ["requested_trip_id", "user_id"], :name => "index_referer_users_on_requested_trip_id_and_user_id"

  create_table "referrables", :force => true do |t|
    t.integer  "referred_id"
    t.integer  "referer_id"
    t.integer  "status",      :default => 0
    t.integer  "channel",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referral_credits", :force => true do |t|
    t.integer  "referrable_id"
    t.string   "redeemable_type"
    t.integer  "redeemable_type_id"
    t.decimal  "total_amount",       :precision => 6, :scale => 2
    t.decimal  "redeemed_amount",    :precision => 7, :scale => 2, :default => 0.0
    t.integer  "credit_status",                                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "expiry_date"
    t.integer  "beneficiary_id"
  end

  create_table "referrals", :force => true do |t|
    t.integer  "amount_type",     :default => 1
    t.integer  "referer_amount"
    t.integer  "referred_amount"
    t.text     "tnc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "region_cities", :id => false, :force => true do |t|
    t.integer "city_id"
    t.integer "region_id"
  end

  add_index "region_cities", ["city_id", "region_id"], :name => "index_region_cities_on_city_id_and_region_id"

  create_table "region_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "region_users", ["user_id", "region_id"], :name => "index_region_users_on_user_id_and_region_id"

  create_table "regions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "related_articles", :force => true do |t|
    t.integer "article1_id"
    t.integer "article2_id"
    t.integer "correlation", :default => 100
  end

  create_table "requested_agents", :force => true do |t|
    t.string   "company_name"
    t.string   "contact_person_name"
    t.string   "phone"
    t.text     "company_profile"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "referer"
    t.string   "skype"
    t.string   "url"
    t.integer  "status"
    t.string   "sales_team"
    t.text     "destinations"
    t.integer  "b2b_id"
    t.text     "admin_comments"
    t.string   "company_owner"
    t.string   "booking_rate"
    t.string   "online_experience"
    t.string   "agency_age"
    t.string   "employee_strength"
    t.string   "current_travelers"
  end

  create_table "requested_trip_agents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requested_trip_id"
    t.datetime "first_viewed_at"
    t.datetime "last_viewed_at"
    t.integer  "view_count",                :default => 0
    t.integer  "sub_account_id"
    t.integer  "isdeclined",                :default => 0
    t.integer  "decline_reason"
    t.integer  "tt_discount"
    t.string   "active_status_tag"
    t.integer  "misc_status"
    t.text     "decline_description"
    t.text     "notes"
    t.date     "show_contact_info_date"
    t.integer  "phone_no_taken_by_role_id"
  end

  add_index "requested_trip_agents", ["requested_trip_id"], :name => "index_requested_trip_agents_on_requested_trip_id"
  add_index "requested_trip_agents", ["sub_account_id"], :name => "index_requested_trip_agents_on_sub_account_id"
  add_index "requested_trip_agents", ["user_id"], :name => "index_requested_trip_agents_on_user_id"

  create_table "requested_trip_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "requested_trip_id"
    t.integer  "category_type",     :limit => 1
    t.string   "category_name"
    t.text     "remark"
    t.text     "sub_remark"
    t.text     "misc_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requested_trip_emails", :force => true do |t|
    t.integer  "requested_trip_id"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requested_trip_emails", ["email_id"], :name => "index_requested_trip_emails_on_email_id"
  add_index "requested_trip_emails", ["requested_trip_id", "email_id"], :name => "index_requested_trip_emails_on_requested_trip_id_and_email_id", :unique => true

  create_table "requested_trips", :force => true do |t|
    t.date     "start_date"
    t.integer  "trip_days"
    t.integer  "adult",                                      :default => 0,      :null => false
    t.integer  "child",                                      :default => 0,      :null => false
    t.string   "budget"
    t.integer  "trip_id"
    t.string   "currency"
    t.text     "info",                                                           :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from_loc"
    t.string   "phone_no"
    t.text     "adminComments"
    t.string   "status",                                     :default => "Cold"
    t.string   "email",                                                          :null => false
    t.string   "to_loc"
    t.string   "from_complete"
    t.string   "to_complete"
    t.text     "addtl_info"
    t.string   "type_of_trip"
    t.text     "referer"
    t.datetime "last_viewed_at"
    t.datetime "converted_at"
    t.datetime "closed_at"
    t.datetime "cancelled_at"
    t.datetime "activated_at"
    t.string   "no_of_rooms"
    t.string   "flight_way"
    t.string   "type"
    t.date     "end_date"
    t.boolean  "flight_flexible",                            :default => false
    t.integer  "trip_stage",                    :limit => 1, :default => 0
    t.datetime "postponed_at"
    t.boolean  "voucher_status",                             :default => false
    t.datetime "last_interacted_with_traveler"
    t.datetime "dormant_at"
    t.integer  "quotes_count",                               :default => 0
    t.string   "budget_type"
    t.float    "score",                                      :default => 0.0
    t.string   "usr_location"
    t.string   "from_loc_type"
    t.string   "to_loc_type"
    t.datetime "confirmed_at"
    t.integer  "op_id"
    t.float    "base_score",                                 :default => -1.0
    t.string   "location_is"
    t.boolean  "delta",                                      :default => true
    t.string   "why_confused_reason"
    t.text     "why_confused_ops_comments"
    t.boolean  "auto_confirm",                               :default => false
  end

  add_index "requested_trips", ["activated_at"], :name => "index_requested_trips_on_activated_at"
  add_index "requested_trips", ["converted_at"], :name => "index_requested_trips_on_converted_at"
  add_index "requested_trips", ["created_at"], :name => "index_requested_trips_on_created_at"
  add_index "requested_trips", ["email"], :name => "index_requested_trips_on_email"
  add_index "requested_trips", ["phone_no"], :name => "index_requested_trips_on_phone_no"
  add_index "requested_trips", ["status"], :name => "index_requested_trips_on_status"
  add_index "requested_trips", ["user_id"], :name => "index_requested_trips_on_user_id"

  create_table "requested_trips_cities", :id => false, :force => true do |t|
    t.integer "city_id"
    t.integer "requested_trip_id"
  end

  add_index "requested_trips_cities", ["city_id", "requested_trip_id"], :name => "index_requested_trips_cities_on_city_id_and_requested_trip_id"

  create_table "requested_trips_destinations", :id => false, :force => true do |t|
    t.integer "destination_id"
    t.integer "requested_trip_id"
  end

  add_index "requested_trips_destinations", ["destination_id", "requested_trip_id"], :name => "rtrip_dest_ind", :unique => true
  add_index "requested_trips_destinations", ["requested_trip_id"], :name => "rtrip_id_ind"

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.text     "location"
    t.integer  "average_price"
    t.string   "currency"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.text     "todo"
  end

  create_table "review_pics", :force => true do |t|
    t.integer  "tr_a_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "desc"
  end

  create_table "reviews", :force => true do |t|
    t.text     "review_text"
    t.decimal  "rating",      :precision => 10, :scale => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agent_id"
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "roleusers", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roleusers", ["user_id"], :name => "index_roleusers_on_user_id"

  create_table "room_type_attributes", :force => true do |t|
    t.integer  "room_type_id"
    t.integer  "attribute_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_types", :force => true do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.string   "s_image_url"
    t.string   "l_image_url"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.text     "from_location"
    t.text     "to_location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.text     "description"
    t.text     "todo"
  end

  add_index "routes", ["activity_id"], :name => "index_routes_on_activity_id"

  create_table "rt_status_versions", :force => true do |t|
    t.integer  "requested_trip_id"
    t.integer  "versionable_id"
    t.string   "versionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rt_status_versions", ["requested_trip_id"], :name => "index_rt_status_versions_on_requested_trip_id"

  create_table "rtrip_stats", :force => true do |t|
    t.integer  "cold",                      :default => 0
    t.integer  "quote_0",                   :default => 0
    t.integer  "quote_no_seen",             :default => 0
    t.integer  "quote_seen",                :default => 0
    t.integer  "in_progress",               :default => 0
    t.integer  "hot",                       :default => 0
    t.integer  "payment_pending",           :default => 0
    t.integer  "priority",                  :default => 0
    t.integer  "converted",                 :default => 0
    t.integer  "post_converted",            :default => 0
    t.integer  "requested_trip_id"
    t.datetime "quote_seen_at"
    t.integer  "admin_click",               :default => 0
    t.integer  "admin",                     :default => 0
    t.integer  "agent",                     :default => 0
    t.integer  "system",                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "quotes_allowed",            :default => true
    t.text     "trip_stage"
    t.text     "navigation_history"
    t.text     "tracked_mails"
    t.boolean  "new_agents_can_quote",      :default => true
    t.boolean  "old_agents_can_quote",      :default => true
    t.text     "lock_acquired"
    t.text     "locked"
    t.boolean  "old_locked",                :default => false
    t.datetime "trip_date"
    t.boolean  "booked_tickets"
    t.boolean  "exploring_destinations"
    t.text     "budget_new"
    t.text     "start_date_idea"
    t.text     "quote_track"
    t.integer  "min_quote"
    t.integer  "comment_word_count",        :default => 0
    t.text     "nurturing_mail_status"
    t.string   "nurturing_mail_sent"
    t.string   "trip_confirm_channel"
    t.datetime "more_quote_request_since"
    t.integer  "more_quote_request_id"
    t.string   "more_quote_request_reason"
  end

  add_index "rtrip_stats", ["min_quote"], :name => "index_rtrip_stats_on_min_quote"
  add_index "rtrip_stats", ["requested_trip_id"], :name => "index_rtrip_stats_on_requested_trip_id"

  create_table "search_queries", :force => true do |t|
    t.string   "search_query"
    t.integer  "marketing_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seeds", :force => true do |t|
    t.string   "file_name"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seo_package_add_ons", :force => true do |t|
    t.integer  "seo_package_id"
    t.integer  "addonable_id"
    t.string   "addonable_type"
    t.boolean  "is_mandatory"
    t.boolean  "is_default"
    t.integer  "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",          :precision => 12, :scale => 2
    t.string   "flight_way"
  end

  add_index "seo_package_add_ons", ["addonable_id", "addonable_type"], :name => "index_seo_package_add_ons_on_addonable_id_and_addonable_type"
  add_index "seo_package_add_ons", ["seo_package_id"], :name => "index_seo_package_add_ons_on_seo_package_id"

  create_table "seo_package_destinations_categories", :force => true do |t|
    t.integer  "seo_package_id"
    t.integer  "destinationable_id"
    t.string   "destinationable_type"
    t.integer  "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_package_destinations_categories", ["destinationable_id", "destinationable_type"], :name => "seo_p_dest_catgry_dest_id_dest_type_idx"
  add_index "seo_package_destinations_categories", ["seo_package_id"], :name => "index_seo_package_destinations_categories_on_seo_package_id"

  create_table "seo_package_group_levels", :force => true do |t|
    t.integer  "seo_package_id"
    t.string   "add_on_ids_for_pnc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_package_group_levels", ["seo_package_id"], :name => "index_seo_package_group_levels_on_seo_package_id"

  create_table "seo_package_itineraries", :force => true do |t|
    t.integer  "day_of_itinerary"
    t.text     "description"
    t.string   "cities_visited"
    t.string   "options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "mobile_description"
  end

  create_table "seo_package_itinerary_add_ons", :force => true do |t|
    t.integer  "itinerary_id"
    t.integer  "addonable_id"
    t.string   "addonable_type"
    t.integer  "ranking"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",          :precision => 12, :scale => 2
    t.boolean  "is_mandatory"
    t.string   "flight_way"
  end

  add_index "seo_package_itinerary_add_ons", ["addonable_id", "addonable_type"], :name => "seo_p_i_add_on_addonable_id_and_type_idx"
  add_index "seo_package_itinerary_add_ons", ["itinerary_id"], :name => "seo_p_i_add_on_itinerary_index"

  create_table "seo_package_level_itineraries", :force => true do |t|
    t.integer  "seo_package_id"
    t.integer  "itinerary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_package_level_itineraries", ["seo_package_id"], :name => "index_seo_package_level_itineraries_on_seo_package_id"

  create_table "seo_package_prices", :force => true do |t|
    t.integer  "seo_package_id"
    t.decimal  "min_base_price",   :precision => 10, :scale => 0, :default => 0
    t.decimal  "hotel_price",      :precision => 10, :scale => 0, :default => 0
    t.decimal  "flight_price",     :precision => 10, :scale => 0, :default => 0
    t.decimal  "airport_transfer", :precision => 10, :scale => 0, :default => 0
    t.decimal  "total_price",      :precision => 10, :scale => 0, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_package_prices", ["seo_package_id"], :name => "index_seo_package_prices_on_seo_package_id"

  create_table "seo_package_tags", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seo_package_tags_pictures", :id => false, :force => true do |t|
    t.integer "seo_package_tag_id"
    t.integer "picture_id"
  end

  add_index "seo_package_tags_pictures", ["seo_package_tag_id", "picture_id"], :name => "seo_p_tags_pictures_tag_id_pic_id_idx"
  add_index "seo_package_tags_pictures", ["seo_package_tag_id"], :name => "index_seo_package_tags_pictures_on_seo_package_tag_id"

  create_table "seo_packages", :force => true do |t|
    t.integer  "destination_id"
    t.string   "heading"
    t.float    "discount_price"
    t.boolean  "is_fixed"
    t.integer  "days",                   :limit => 2
    t.integer  "nights",                 :limit => 2
    t.text     "cities"
    t.text     "exclusions"
    t.boolean  "is_index"
    t.string   "set_url"
    t.boolean  "is_nofollow"
    t.string   "currency"
    t.boolean  "perperson"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "overview"
    t.text     "tour_info"
    t.integer  "score"
    t.text     "inclusions_text"
    t.boolean  "is_honeymoon",                        :default => false
    t.boolean  "is_published",                        :default => false
    t.text     "overview_inclusions"
    t.boolean  "from_destination_fixed",              :default => false
    t.boolean  "is_home_page_package",                :default => false
  end

  add_index "seo_packages", ["destination_id"], :name => "index_seo_packages_on_destination_id"
  add_index "seo_packages", ["parent_id"], :name => "index_seo_packages_on_parent_id"
  add_index "seo_packages", ["set_url", "parent_id"], :name => "index_seo_packages_on_set_url_and_parent_id"

  create_table "service_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_users", ["user_id", "service_id"], :name => "index_service_users_on_user_id_and_service_id"

  create_table "services", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "destination_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats_snapshots", :force => true do |t|
    t.integer  "users"
    t.integer  "reqs"
    t.integer  "trips"
    t.integer  "quotes"
    t.integer  "cold_reqs"
    t.integer  "dormant_reqs"
    t.integer  "active_reqs"
    t.integer  "cancelled_reqs"
    t.integer  "converted_reqs"
    t.integer  "closed_reqs"
    t.float    "avg_quotes_per_req"
    t.float    "avg_time_for_first_quote"
    t.float    "avg_time_to_get_trip_converted"
    t.float    "avg_time_to_get_trip_closed"
    t.float    "avg_time_to_get_trip_activated"
    t.float    "max_time_to_get_first_quote"
    t.float    "max_time_to_get_trip_converted"
    t.float    "max_time_to_get_trip_closed"
    t.float    "max_time_to_get_trip_activated"
    t.integer  "req_id_for_max_time_first_quote"
    t.integer  "req_id_for_max_time_converted"
    t.integer  "req_id_for_max_time_closed"
    t.integer  "req_id_for_max_time_activated"
    t.float    "conversion_perc"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "tt_commission",                   :default => 0.0
    t.float    "total_earning",                   :default => 0.0
    t.integer  "daily_users",                     :default => 0
    t.integer  "daily_reqs",                      :default => 0
    t.integer  "daily_converted_reqs",            :default => 0
    t.integer  "daily_active_reqs",               :default => 0
    t.integer  "daily_quotes",                    :default => 0
    t.integer  "hot_reqs"
    t.integer  "in_progress_reqs"
    t.integer  "postponed_reqs"
    t.integer  "cancelled_after_converted_reqs"
    t.integer  "new_destinations"
  end

  create_table "stays", :force => true do |t|
    t.string   "name"
    t.integer  "star"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.text     "location"
    t.text     "todo"
  end

  add_index "stays", ["activity_id"], :name => "index_stays_on_activity_id"

  create_table "sub_account_emails", :force => true do |t|
    t.integer  "sub_account_id"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_account_tags", :force => true do |t|
    t.integer  "sub_account_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_account_tags", ["sub_account_id", "tag_id"], :name => "index_sub_account_tags_on_sub_account_id_and_tag_id"
  add_index "sub_account_tags", ["tag_id"], :name => "index_sub_account_tags_on_tag_id"

  create_table "sub_accounts", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "account_type"
    t.integer  "status"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_no"
  end

  add_index "sub_accounts", ["user_id"], :name => "index_sub_accounts_on_user_id"

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email"

  create_table "ta_ratings", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "ta_rating"
    t.integer  "ta_review_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_dist_dests", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "group_number"
    t.string   "tag_type"
    t.integer  "tag_distribution_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_emails", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "email_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_emails", ["email_id"], :name => "index_tag_emails_on_email_id"
  add_index "tag_emails", ["tag_id", "email_id"], :name => "index_tag_emails_on_tag_id_and_email_id", :unique => true

  create_table "tag_trips", :force => true do |t|
    t.integer  "tag_id",            :null => false
    t.integer  "requested_trip_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_trips", ["requested_trip_id"], :name => "index_tag_trips_on_requested_trip_id"
  add_index "tag_trips", ["tag_id", "requested_trip_id"], :name => "index_tag_trips_on_tag_id_and_requested_trip_id"

  create_table "tag_users", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_users", ["tag_id", "user_id"], :name => "index_tag_users_on_tag_id_and_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "type_of_tag",      :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enable_analytics", :default => false
    t.integer  "destination_id"
    t.integer  "new_agents"
    t.integer  "old_agents"
    t.integer  "slot_enable",      :default => 0
    t.integer  "op_id"
  end

  add_index "tags", ["destination_id"], :name => "index_tags_on_destination_id"
  add_index "tags", ["name", "type_of_tag"], :name => "index_tags_on_name_and_type_of_tag", :unique => true

  create_table "task_schedulers", :force => true do |t|
    t.string   "title"
    t.string   "message"
    t.string   "email"
    t.datetime "run_at"
    t.integer  "requested_trip_id"
    t.integer  "user_id"
    t.string   "status",            :default => "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_schedulers", ["requested_trip_id"], :name => "index_task_schedulers_on_requested_trip_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "designation"
    t.text     "brief_description"
    t.integer  "priority"
    t.string   "linkedin_link"
    t.string   "twitter_link"
    t.string   "fb_link"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonials", :force => true do |t|
    t.text     "body"
    t.string   "title"
    t.string   "full_name"
    t.integer  "user_id"
    t.string   "misc_info"
    t.integer  "testimoniable_id"
    t.string   "testimoniable_type"
    t.boolean  "published",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "destination_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "agent_id"
  end

  add_index "testimonials", ["destination_id"], :name => "index_testimonials_on_destination_id"
  add_index "testimonials", ["testimoniable_id"], :name => "index_testimonials_on_testimoniable_id"
  add_index "testimonials", ["testimoniable_type"], :name => "index_testimonials_on_testimoniable_type"
  add_index "testimonials", ["user_id"], :name => "index_testimonials_on_user_id"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "order"
  end

  create_table "tips", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "tippable_type"
    t.integer  "tippable_id"
  end

  add_index "tips", ["tippable_type", "tippable_id"], :name => "index_tips_on_tippable_type_and_tippable_id"

  create_table "tour_package_estimater_attributes", :force => true do |t|
    t.integer  "min_duration"
    t.integer  "max_duration"
    t.string   "cabs"
    t.integer  "min_hotel_category"
    t.integer  "max_hotel_category"
    t.string   "flight"
    t.string   "meals"
    t.integer  "start_month"
    t.integer  "end_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_package_estimaters", :force => true do |t|
    t.integer  "trip_type_id"
    t.integer  "min_price"
    t.integer  "max_price"
    t.string   "currency"
    t.string   "image_url"
    t.text     "cities"
    t.text     "from_places"
    t.integer  "destination_id"
    t.integer  "tour_package_estimater_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tr_a_profiles", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "subdomain"
    t.string   "company"
    t.string   "skype"
    t.text     "info"
    t.boolean  "registration_docs"
    t.integer  "commission_code",                                                    :default => 0
    t.integer  "payment_terms_code",                                                 :default => 0
    t.integer  "ticker_status",                                                      :default => 1
    t.boolean  "multi_login",                                                        :default => false
    t.integer  "kyc_score",              :limit => 1,                                :default => 1
    t.string   "kyc_misc",                                                           :default => ""
    t.integer  "b2b_id"
    t.integer  "channel",                :limit => 1
    t.string   "destinations"
    t.integer  "inbound_interest",       :limit => 1
    t.datetime "special_com_valid_till"
    t.decimal  "special_com_per",                     :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "credit_limit",                        :precision => 12, :scale => 2
    t.decimal  "credit_limit_used",                   :precision => 12, :scale => 2, :default => 0.0
    t.integer  "max_phone_no_limit",                                                 :default => 40,    :null => false
  end

  add_index "tr_a_profiles", ["payment_terms_code"], :name => "index_tr_a_profile_on_payment_terms_code"
  add_index "tr_a_profiles", ["user_id"], :name => "index_tr_a_profiles_on_user_id"

  create_table "tr_profiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "location"
    t.string   "designation"
    t.string   "social_media_pic"
  end

  add_index "tr_profiles", ["user_id"], :name => "index_tr_profiles_on_user_id"

  create_table "track_tag_emails", :force => true do |t|
    t.integer  "email_id"
    t.integer  "tag_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "sub_account_id", :default => -1
  end

  add_index "track_tag_emails", ["email_id"], :name => "index_track_tag_emails_on_email_id"
  add_index "track_tag_emails", ["sub_account_id"], :name => "index_track_tag_emails_on_sub_account_id"
  add_index "track_tag_emails", ["tag_id"], :name => "index_track_tag_emails_on_tag_id"

  create_table "tracked_cta", :force => true do |t|
    t.integer  "tracked_email_id"
    t.string   "cta_name"
    t.datetime "first_clicked_at"
    t.integer  "clicked_count"
    t.text     "misc_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clicked_on_device"
  end

  add_index "tracked_cta", ["tracked_email_id"], :name => "index_tracked_cta_on_tracked_email_id"

  create_table "tracked_emails", :force => true do |t|
    t.string   "email_name"
    t.string   "email_by"
    t.string   "email_to"
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.datetime "first_sent_at"
    t.datetime "first_opened_at"
    t.text     "misc_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "requested_trip_id", :default => 0
    t.string   "opened_on_device"
    t.integer  "email_template_id"
  end

  add_index "tracked_emails", ["email_name"], :name => "index_tracked_emails_on_email_name"
  add_index "tracked_emails", ["email_template_id", "email_name"], :name => "index_tracked_emails_on_email_template_id_and_email_name"
  add_index "tracked_emails", ["first_sent_at"], :name => "index_tracked_emails_on_first_sent_at"
  add_index "tracked_emails", ["requested_trip_id"], :name => "index_tracked_email_requested_trip_id"
  add_index "tracked_emails", ["requested_trip_id"], :name => "index_tracked_emails_on_requested_trip_id"
  add_index "tracked_emails", ["trackable_type", "trackable_id", "email_name"], :name => "index_tracked_emails_on_trackable_type_id_name"
  add_index "tracked_emails", ["trackable_type", "trackable_id"], :name => "index_tracked_emails_on_trackable_type_id"

  create_table "tracking_histories", :force => true do |t|
    t.integer  "historiable_id"
    t.string   "historiable_type"
    t.datetime "removed_at"
    t.integer  "created_by"
    t.integer  "removed_by"
    t.integer  "requested_trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_details", :force => true do |t|
    t.string   "detail_type"
    t.string   "name"
    t.integer  "age"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_days", :force => true do |t|
    t.integer  "day_of_itinerary"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "quote_id"
    t.string   "cities"
    t.string   "attractions"
    t.string   "title"
  end

  add_index "trip_days", ["quote_id"], :name => "index_trip_days_on_quote_id"
  add_index "trip_days", ["trip_id"], :name => "index_trip_days_on_trip_id"

  create_table "trip_feedbacks", :force => true do |t|
    t.text     "trip_memory"
    t.integer  "hotel"
    t.integer  "agent_service"
    t.integer  "cab"
    t.integer  "itinerary"
    t.integer  "meals"
    t.integer  "quotes_quality"
    t.integer  "quotes_time"
    t.integer  "payment_process"
    t.integer  "website_use"
    t.integer  "agent_interaction"
    t.text     "testimonial"
    t.integer  "requested_trip_id"
    t.integer  "agent_id"
    t.integer  "overall_feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tt_recommend",      :limit => 1
    t.string   "title"
  end

  add_index "trip_feedbacks", ["requested_trip_id"], :name => "index_trip_feedback_on_requested_trip_id"

  create_table "trip_type_activity_types", :force => true do |t|
    t.integer  "trip_type_id"
    t.integer  "activity_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "canonicals"
    t.text     "filters"
    t.text     "desc"
    t.text     "image_url"
    t.string   "container"
    t.string   "suitable_for"
    t.text     "short_desc"
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "budget"
    t.string   "currency"
    t.string   "type_of_trip"
    t.date     "offered_date_start"
    t.date     "offered_date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "days",                                 :null => false
    t.string   "tags"
    t.integer  "user_id"
    t.text     "included"
    t.text     "excluded"
    t.boolean  "visibility",         :default => true
    t.string   "wiki_links"
    t.integer  "picfile_id"
    t.integer  "nights"
    t.text     "tnc"
    t.boolean  "deal"
    t.integer  "discount"
    t.integer  "destination_id"
    t.float    "ratings"
    t.text     "groups"
  end

  add_index "trips", ["picfile_id", "destination_id"], :name => "index_trips_on_picfile_id_and_destination_id"
  add_index "trips", ["user_id"], :name => "index_trips_on_user_id"

  create_table "trips_cities", :force => true do |t|
    t.integer "city_id"
    t.integer "trip_id"
  end

  add_index "trips_cities", ["city_id", "trip_id"], :name => "index_trips_cities_on_city_id_and_trip_id"

  create_table "trips_inclusions", :id => false, :force => true do |t|
    t.integer "trip_id"
    t.integer "inclusion_id"
  end

  add_index "trips_inclusions", ["trip_id", "inclusion_id"], :name => "index_trips_inclusions_on_trip_id_and_inclusion_id", :unique => true

  create_table "unreademails", :force => true do |t|
    t.integer  "user_id"
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_emails", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "email_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_emails", ["email_id"], :name => "index_user_emails_on_email_id"
  add_index "user_emails", ["user_id", "email_id"], :name => "index_user_emails_on_user_id_and_email_id", :unique => true

  create_table "user_experiences", :force => true do |t|
    t.string   "user_name"
    t.string   "trip_duration"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_exp_link"
  end

  create_table "user_mailer_preps", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_phones", :force => true do |t|
    t.integer  "user_id"
    t.string   "phone_no"
    t.integer  "verified",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_phones", ["user_id", "phone_no"], :name => "index_user_phones_on_user_id_and_phone_no"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                         :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "first_name",                                               :null => false
    t.string   "last_name",                                                :null => false
    t.integer  "subscribed",                            :default => 1,     :null => false
    t.boolean  "currently_logged_in",                   :default => false
    t.integer  "reademails_count",                      :default => 0
    t.float    "transaction_value",                     :default => 0.0
    t.integer  "converted_trips",                       :default => 0
    t.integer  "credits",                               :default => 0
    t.float    "score",                                 :default => 0.0
    t.string   "location_type"
    t.string   "temp_password"
    t.string   "nationality"
    t.string   "skype_id"
    t.string   "similar_ids",                           :default => ""
    t.datetime "reset_password_sent_at"
    t.datetime "last_visited"
    t.string   "fingerprint_ids"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "gender"
    t.boolean  "delta",                                 :default => true
    t.datetime "deleted_at"
    t.integer  "refer_health",                          :default => 1
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["password_salt"], :name => "index_users_on_password_salt"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_credits", :force => true do |t|
    t.integer  "beneficiary_id"
    t.integer  "benefit_type_id"
    t.integer  "requested_trip_id"
    t.integer  "quote_id"
    t.integer  "offers_provided_by_partner_id"
    t.integer  "credit_detail_id"
    t.integer  "amount_type"
    t.decimal  "amount",                        :precision => 7, :scale => 2
    t.integer  "credit_status"
    t.integer  "is_spent"
    t.datetime "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_destinations", :force => true do |t|
    t.integer "destination_id"
    t.integer "user_id"
  end

  add_index "users_destinations", ["destination_id", "user_id"], :name => "index_users_destinations_on_destination_id_and_user_id", :unique => true
  add_index "users_destinations", ["user_id"], :name => "index_users_destinations_on_user_id"

  create_table "vcategories", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "majorcategory_id"
  end

  add_index "vcategories", ["majorcategory_id"], :name => "index_vcategories_on_majorcategory_id"

  create_table "vcategory_venues", :id => false, :force => true do |t|
    t.integer "vcategory_id"
    t.integer "venue_id"
  end

  add_index "vcategory_venues", ["vcategory_id", "venue_id"], :name => "index_vcategory_venues_on_vcategory_id_and_venue_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.text     "todo"
    t.integer  "geolocation", :limit => nil
    t.float    "rating"
    t.text     "info"
    t.integer  "city_id"
    t.text     "location"
  end

  add_index "venues", ["activity_id", "city_id"], :name => "index_venues_on_activity_id_and_city_id"

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_id", "item_type"], :name => "index_versions_on_item_id_and_item_type"
  add_index "versions", ["item_id"], :name => "index_versions_on_item_id"

  create_table "visa_infos", :force => true do |t|
    t.string   "heading"
    t.string   "disclaimer"
    t.string   "options"
    t.string   "visa_desc"
    t.string   "visa_link"
    t.string   "visa_requirement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitor_trackings", :force => true do |t|
    t.integer  "user_id"
    t.datetime "time_of_visit"
    t.string   "url"
    t.decimal  "total_time_spent", :precision => 10, :scale => 2, :default => 0.0
    t.text     "time_spent_arr"
    t.string   "platform"
  end

  add_index "visitor_trackings", ["user_id", "url"], :name => "index_visitor_trackings_on_user_id_and_url"
  add_index "visitor_trackings", ["user_id"], :name => "index_visitor_trackings_on_user_id"

  create_table "visitor_trackings_archives", :id => false, :force => true do |t|
    t.integer  "id",                                                                 :default => 0,   :null => false
    t.integer  "user_id"
    t.datetime "time_of_visit"
    t.string   "url"
    t.decimal  "total_time_spent",                     :precision => 5, :scale => 2, :default => 0.0
    t.text     "time_spent_arr"
    t.binary   "data",             :limit => 16777215
  end

  create_table "visitor_trip_data", :force => true do |t|
    t.string   "user_id"
    t.text     "trip_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "platform"
  end

  create_table "vouchers", :force => true do |t|
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.string   "voucher_type",                                    :default => "hotel_voucher"
    t.string   "visible_to",                                      :default => "traveler"
    t.decimal  "amount",           :precision => 10, :scale => 0, :default => 0
    t.boolean  "notify_agent",                                    :default => false
    t.string   "rejection_reason",                                :default => ""
  end

  add_index "vouchers", ["invoice_id"], :name => "index_vouchers_on_invoice_id"

  create_table "weather_infos", :force => true do |t|
    t.string   "month_range"
    t.string   "temp_range"
    t.string   "temp_unit"
    t.string   "atmosphere"
    t.string   "additional_info"
    t.integer  "destination_id"
    t.boolean  "peak_season",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
