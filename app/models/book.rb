#class Book < ApplicationRecord
  #has_many :borrowings

#end
class Book < ApplicationRecord
  has_many :borrow_records, dependent: :destroy
  
  validates :title, presence: true
  validates :status, inclusion: { in: ['available', 'borrowed'] }
  
  before_validation :set_default_status
  
  def current_borrow_record
    borrow_records.where(returned_at: nil).first
  end
  
  def available?
    status == 'available'
  end
  
  def borrow(borrower_name)
    return false unless available?
    
    transaction do
      update!(status: 'borrowed')
      borrow_records.create!(
        borrower_name: borrower_name,
        borrowed_at: Time.current
      )
    end
    true
  rescue
    false
  end
  
  def return_book
    return false if available?
    
    transaction do
      update!(status: 'available')
      current_borrow_record.update!(returned_at: Time.current)
    end
    true
  rescue
    false
  end
  
  private
  
  def set_default_status
    self.status ||= 'available'
  end
end
