FactoryBot.define do

  factory :random_countries, class: Api::V1::Country do
    title { Faker::Address.country }
    country_code { Faker::Address.country_code }
  end


  factory :random_currencies, class: Api::V1::Currency do
    title { Faker::Currency.name }
    currency_code { Faker::Currency.code }
  end

  category = ["Sales Tax", "Commercial Tax"]
  rate = ["0.07", "0.05", "0.10"]
  factory :random_taxes, class: Api::V1::Tax do
    tax_category { category.sample }
    tax_rate { rate.sample }
  end




end