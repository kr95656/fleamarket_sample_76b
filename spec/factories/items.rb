FactoryBot.define do

  factory :item do
    name              {"商品名"}
    price             {10000}
    introduction      {"商品説明"}
    item_condition_id    {1}
    postage_payer_id   {1}
    shipping_day_id  {1}
    shipping_prefecture_id  {1}
    category_id       {1}
  end

  factory :category do  
    name              {"おもちゃ"}
    id                {1}
  end

  
end