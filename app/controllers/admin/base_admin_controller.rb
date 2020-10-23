class Admin
  class BaseAdminController < ApplicationController
    before_action :authenticate_admin!
  end
end
