FactoryGirl.define do

  factory :recording do

    user
    speaker 1
    data { "some json parsed to a string" }
    description { Faker::ChuckNorris.fact }

  end

end
