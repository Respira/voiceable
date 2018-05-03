FactoryGirl.define do

  factory :user do

    email { "#{SecureRandom.hex(8)}@mailinator.com" } # mail can be actually checked at mailinator.com.
    name { SecureRandom.hex }
    password { SecureRandom.hex }

  end

end
