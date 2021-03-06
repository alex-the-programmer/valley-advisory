class HomesController < ApplicationController
  def index
    view = case current_user&.role
             when nil then 'signed_out_home'
             when 'candidate' then 'applicant_home'
             when 'hiring_manager' then 'hiring_manager_home'
             when 'advisor' then 'advisor_home'
           end

    render view
  end
end
