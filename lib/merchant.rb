class Merchant

  attr_accessor :id, :name, :created_at

  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = Time.parse(data[:created_at].to_s)
  end
end
