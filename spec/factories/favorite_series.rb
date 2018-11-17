FactoryBot.define do
  factory :favorite_series do
    series_id { "thing" }
    title { "stuff" }
    thumbnail { "picture" }
    start_year { 1111 }
    end_year { 2111 }
    user_id { 1 }

  end
end
