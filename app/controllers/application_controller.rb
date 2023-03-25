class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken
  # include SetCurrentRequestDetails
end
