class OrganizationRouteConstrains

  def matches?(request)
    request.subdomain.present? && !_is_special_subdomain(request.subdomain)
  end

  private

  def _is_special_subdomain(subdomain)
    ['www'].include?(subdomain)
  end
end