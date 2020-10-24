module Admin
  class BaseAdminController < ApplicationController
    before_action :authenticate_admin_user!

    layout 'admin/application'
  end
end
