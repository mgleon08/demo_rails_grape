class ErrorsController < ApplicationController
  def error_404
    render json: { error: "path #{request.path} not found" }
  end
end
