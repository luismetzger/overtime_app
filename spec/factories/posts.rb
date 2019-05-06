FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { "Something is going here..." }
    user
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Something else is going here..." }
    user
  end
end