module Org
  class OrganizationController < ApplicationController
    before_action :get_organization
    before_action :authenticate
    before_action :can_authorize

    layout proc { logged_in? ? 'organization/application' : 'organization/guest' }

    def can_authorize
      access_denied unless @current_organization.id === @current_user.organization_id
    end

    def get_organization
      @current_organization = Org::Organization.find_by_subdomain(request.subdomain)
      not_found unless @current_organization
    end

    def not_found
      render 'org/organization/404', status: 404, layout: nil
    end

    def access_denied
      render 'org/organization/401', status: 401, layout: nil
    end
  end
end