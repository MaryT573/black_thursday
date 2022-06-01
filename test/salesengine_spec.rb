require "./lib/salesengine"
# require "./lib/item_repository"
# require "./lib/merchant_repository"

#You may need to add more `expect` lines to each test to make it more robust...!
RSpec.describe SalesEngine do
  xit "exists" do
    sales_engine = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })
    expect(sales_engine).to be_instance_of SalesEngine
  end

  xit "can return an array of all items" do
    sales_engine = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    expect(sales_engine.items).to be_instance_of ItemRepository
  end

  xit "can return an array of all instances" do
    sales_engine = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv"
    })

    expect(sales_engine.merchants).to be_instance_of MerchantRepository
  end

end
