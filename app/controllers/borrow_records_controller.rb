class BorrowRecordsController < ApplicationController
  def create
    @borrow_record = BorrowRecord.new(borrow_record_params)
    
    if @borrow_record.save
      redirect_to @borrow_record.book, notice: 'Borrow record was successfully created.'
    else
      redirect_to @borrow_record.book, alert: 'Could not create borrow record.'
    end
  end

  def borrower_history
    @borrower_name = params[:borrower_name]
    @borrow_records = BorrowRecord.where(borrower_name: @borrower_name)
                                 .includes(:book)
                                 .order(borrowed_at: :desc)
  end

  private

  def borrow_record_params
    params.require(:borrow_record).permit(:book_id, :borrower_name)
  end
end

