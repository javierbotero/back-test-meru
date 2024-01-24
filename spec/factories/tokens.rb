FactoryBot.define do
  sequence(:token) { |i| "#{SecureRandom.hex(16)}i" }

  factory :token do
    token { generate(:token) }
  end
end
