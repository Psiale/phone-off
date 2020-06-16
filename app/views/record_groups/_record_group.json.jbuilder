# frozen_string_literal: true

json.extract! record_group, :id, :created_at, :updated_at
json.url record_group_url(record_group, format: :json)
