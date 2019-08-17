module Sjabloon
  class Plan < ApplicationRecord
   self.table_name = "sjabloon_plans"

    include Storext.model

    scope :active,  -> { where(active: true) }
    scope :visible, -> { where(visible: true) }
    scope :monthly, -> { where(interval: "month") }
    scope :annual,  -> { where(interval: "year") }

    def price
      amount / 100 if amount?
    end

    def has_trial_period?
      trial_period_days?
    end

    store_attributes :features do
      # Add your plan items/features
      # (eg. team members, groups, download, etc.) here
      # Examples:
      # team_members Integer
      # concierge_service Boolean, default: false
      all_components Integer, default: true
      tailwind_code Integer, default: true
      new_additions Integer, default: true
      dedicated_support Integer, default: true
    end
  end
end
