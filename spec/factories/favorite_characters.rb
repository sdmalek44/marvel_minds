FactoryBot.define do
  factory :favorite_character do
    character_id { "1009351" }
    name { "Hulk" }
    description { "blah blah blah" }
    thumbnail { "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/standard_xlarge.jpg" }
    user_id { 1 }
  end
end
