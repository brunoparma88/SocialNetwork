# frozen_string_literal: true

module Helpers
  # Helper method to parse a response
  #
  # @return [Hash]
  def json
    JSON.parse(subject.body).with_indifferent_access
  end

  def auth_headers
    @auth_headers ||= user.create_new_auth_token
  end
end
