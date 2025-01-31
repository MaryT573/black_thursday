require 'time'
require 'CSV'
require_relative "merchant"
require_relative "invoice"
require_relative "item"
require_relative '../modules/findable'
require_relative '../modules/changeable'
require_relative "transaction"

class TransactionRepository
  include Findable
  include Changeable

  attr_reader :all

  def initialize(file_path)
    @file_path = file_path
    @all = []
    CSV.foreach(@file_path, headers: true, header_converters: :symbol) do |row|
      @all << Transaction.new(row)
    end
  end

  def inspect
    "#<#{self.class} #{@transaction.size} rows>"
  end

  def create(attributes)
    attributes[:id] = (@all.max {|transaction| transaction.id}).id + 1
      new_transaction = Transaction.new(attributes)
        @all << new_transaction
          new_transaction
  end

  def update(id, attributes)
    transaction = find_by_id(id)
    if transaction == nil
      exit
    else
      transaction.updated_at = Time.now
      attributes.each do |key, value|
        if key.to_sym == :credit_card_number
          transaction.credit_card_number = attributes[:credit_card_number]
        elsif key.to_sym == :credit_card_expiration_date
          transaction.credit_card_expiration_date = attributes[:credit_card_expiration_date]
        elsif key.to_sym == :result
          transaction.result = attributes[:result]
        end
      end
    end
  end
end
