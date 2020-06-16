# frozen_string_literal: true

json.array! @record_groups, partial: 'record_groups/record_group', as: :record_group
