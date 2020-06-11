require 'rails_helper'
describe Item do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      
      category = create(:category)
      item = build(:item)
      expect(item).to be_valid
    end
    it "商品名がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    
    it "商品名が40字の場合は出品できる" do
      
      category = create(:category)
      item = build(:item, name: "a" * 40)
      expect(item).to be_valid
    end
    it "商品名が40字以上の場合は出品できない" do
      category = create(:category)
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name][0])
    end
    it "商品説明がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "商品説明が1000文字を越えている場合は出品できない" do
      category = create(:category)
      item = build(:item, introduction: "a" * 1001)
      item.valid?
      expect(item.errors[:introduction][0])
    end

    it "priceがない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が300円の場合は出品できる" do
      category = create(:category)
      item = build(:item, price: "300")
      expect(item).to be_valid
    end

    it "価格が300円未満では出品できない" do
      category = create(:category)
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price])
    end

    it "価格が9,999,999円の場合は出品できる" do
      category = create(:category)
      item = build(:item, price: "9999999")
      expect(item).to be_valid
    end

    it "価格が9,999,999円より高い場合は出品できない" do
      category = create(:category)
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price])
    end

    it "商品の状態がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, item_condition_id: "")
      item.valid?
      expect(item.errors[:item_condition_id]).to include("can't be blank")
    end

    it "発送元がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, shipping_prefecture_id: "")
      item.valid?
      expect(item.errors[:shipping_prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, shipping_day_id: "")
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it "送料負担の選択がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, postage_payer_id: "")
      item.valid?
      expect(item.errors[:postage_payer_id]).to include("can't be blank")
      
    end

    it "category_idがない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
  end


  describe '#update' do
    it "必須項目がすべて存在すれば登録できること" do
      
      category = create(:category)
      item = build(:item)
      expect(item).to be_valid
    end
    it "商品名がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    
    it "商品名が40字の場合は出品できる" do
      
      category = create(:category)
      item = build(:item, name: "a" * 40)
      expect(item).to be_valid
    end
    it "商品名が40字以上の場合は出品できない" do
      category = create(:category)
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name][0])
    end
    it "商品説明がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "商品説明が1000文字を越えている場合は出品できない" do
      category = create(:category)
      item = build(:item, introduction: "a" * 1001)
      item.valid?
      expect(item.errors[:introduction][0])
    end

    it "priceがない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が300円の場合は出品できる" do
      category = create(:category)
      item = build(:item, price: "300")
      expect(item).to be_valid
    end

    it "価格が300円未満では出品できない" do
      category = create(:category)
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price])
    end

    it "価格が9,999,999円の場合は出品できる" do
      category = create(:category)
      item = build(:item, price: "9999999")
      expect(item).to be_valid
    end

    it "価格が9,999,999円より高い場合は出品できない" do
      category = create(:category)
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price])
    end

    it "商品の状態がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, item_condition_id: "")
      item.valid?
      expect(item.errors[:item_condition_id]).to include("can't be blank")
    end

    it "発送元がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, shipping_prefecture_id: "")
      item.valid?
      expect(item.errors[:shipping_prefecture_id]).to include("can't be blank")
    end

    it "発送までの日数がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, shipping_day_id: "")
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("can't be blank")
    end

    it "送料負担の選択がない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, postage_payer_id: "")
      item.valid?
      expect(item.errors[:postage_payer_id]).to include("can't be blank")
      
    end

    it "category_idがない場合は登録できないこと" do
      category = create(:category)
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end


  end
end
