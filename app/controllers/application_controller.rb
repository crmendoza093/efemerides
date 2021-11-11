class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def unprocessable_entity
    render :nothing, status: __method__
  end

  def not_found
    render :nothing, status: __method__
  end
end
