describe Api::V1::TargetsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(POST: '/api/v1/targets').to route_to('api/v1/targets#create', format: :json)
    end

    it 'routes to #delete' do
      expect(DELETE: '/api/v1/targets/1').to route_to('api/v1/targets#destroy', format: :json,
                                                                                id: '1')
    end
  end
end
