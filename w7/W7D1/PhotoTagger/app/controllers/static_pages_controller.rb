class StaticPagesController < ApplicationController
  before_filter :require_current_user!

  def root
    render :root
  end
end
