class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def redirect_if_not_signed_in
        redirect_to signin_path if !signed_in? 
    end
end
