describe Api::V1::TargetsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(POST: '/api/v1/targets').to route_to('api/v1/targets#create', format: :json)
    end
  end
end
