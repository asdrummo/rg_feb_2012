class ComponentsController < ApplicationController
  before_filter :confirm_logged_in
  layout 'admin'
end