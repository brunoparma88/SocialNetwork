describe Api::V1::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: '/api/v1/user').to route_to('api/v1/users#update', format: :json)
    end
  end
end
