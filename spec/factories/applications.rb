FactoryBot.define do
  factory :RegisteredApplication do
    name FFaker::Internet.domain_word
    URL FFaker::Internet.http_url
    user
  end
end
