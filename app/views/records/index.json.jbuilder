# frozen_string_literal: true

json.array! @records, partial: 'records/record', as: :record
