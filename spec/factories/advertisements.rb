FactoryGirl.define do
  factory :advertisement do

    title "Old Couch"
    description "Old couch for sale"
    price "$20"
    association :user, factory: :user
  end
end
