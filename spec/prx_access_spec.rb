class PRXAccessTest
  include PRXAccess
end

RSpec.describe PRXAccess do

  let(:prx_access) { PRXAccessTest.new }
  let(:fixture) { File.join(File.dirname(__FILE__), 'fixtures/files/podcast.json') }
  let(:podcast) { JSON.parse(File.open(fixture).read) }
  let(:resource) { PRXAccess::PRXHyperResource.new }

  before do
    allow(ENV).to receive(:[]).with("ID_HOST").and_return("id.prx.docker")
    allow(ENV).to receive(:[]).with("FEEDER_HOST").and_return("feeder.prx.docker")
    allow(ENV).to receive(:[]).with("CMS_HOST").and_return("cms.prx.docker")
    allow(ENV).to receive(:[]).with("CRIER_HOST").and_return("feeder.prx.docker")

    allow(ENV).to receive(:[]).with("http_proxy").and_return(nil)
    allow(ENV).to receive(:[]).with("HTTP_PROXY").and_return(nil)
  end

  it "has a version number" do
    expect(PRXAccess::VERSION).not_to be nil
  end

  it 'returns an api' do
    expect(prx_access.api).not_to be nil
  end

  it 'returns root uri' do
    expect(prx_access.id_root).not_to be nil
    expect(prx_access.cms_root).not_to be nil
    expect(prx_access.crier_root).not_to be nil
    expect(prx_access.feeder_root).not_to be nil
  end

  it 'create a resource from json' do
    res = prx_access.api_resource(podcast, prx_access.feeder_root)
    expect(res).not_to be nil
    res.attributes['title'] = '99% Invisible'
  end

  it 'underscores incoming hash keys' do
    input = { 'camelCase' => 1 }
    expect(resource.incoming_body_filter(input)['camel_case']).to equal(1)
  end

  it 'underscores outgoing hash keys' do
    input = { 'under_score' => 1 }
    expect(resource.outgoing_body_filter(input)['underScore']).to equal(1)
  end

  it 'serializes using the outgoing_body_filter' do
    stub_request(:post, 'http://cms.prx.docker/api/v1').
      with(body: '{"underScore":1}').
      to_return(status: 200, body: '{"foo":"bar"}', headers: {})

    prx_access.api.post('under_score' => 1)
  end
end
