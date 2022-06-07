require './lib/merchant'

RSpec.describe Merchant do
  let(:merchant) {Merchant.new({:id => 5, :name => "Turing School", :created_at => "2012-11-23"})}

  it "exists" do
    expect(merchant).to be_an(Merchant)
  end

  it "has attributes" do
    expect(merchant.name).to eq("Turing School")
    expect(merchant.id).to eq(5)
    expect(merchant.created_at).to eq(Time.parse("2012-11-23"))
  end

end
