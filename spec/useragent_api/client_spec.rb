describe UseragentApi::Client do
  describe '#initialize' do
    let(:client) { UseragentApi::Client.new(api_key) }

    context 'given valid API key' do
      let(:api_key) { '01234abc' }
      it { expect(client).to be_an_instance_of UseragentApi::Client }
    end

    context 'given invalid API key' do
      let(:api_key) { '' }
      it { expect { client }.to raise_error ArgumentError }
    end
  end

  describe '#parse' do
    let(:client) { UseragentApi::Client.new(api_key) }

    context 'given registered API key' do
      let(:api_key) { '01234abc' }
      let(:valid_response) do
        {
          'data' => {
            'ua_type'         => 'Desktop',
            'os_name'         => 'macOS',
            'os_version'      => '10.12.3',
            'browser_name'    => 'Chrome',
            'browser_version' => '56.0.2924.87',
            'engine_name'     => 'WebKit',
            'engine_version'  => '537.36',
          }
        }
      end
      let(:stub_status) { 200 }
      let(:stub_body) { valid_response.to_json }
      let(:user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' }
      let(:request_uri) { 'https://useragentapi.com/api/v4/json/%s/%s' % [api_key, CGI.escape(user_agent)] }

      before do
        stub_request(:get, request_uri).to_return(
          status: stub_status, body: stub_body
        )
      end

      it 'is valid response' do
        expect(client.parse(user_agent)).to match_array valid_response
      end
    end

    context 'given unregistered API key' do
      let(:api_key) { 'unregistered' }
      let(:valid_response) do
        {
          'error' => {
            'code'    => 'key_invalid',
            'message' => 'API Key Invalid'
          }
        }
      end
      let(:stub_status) { 400 }
      let(:stub_body) { valid_response.to_json }
      let(:user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' }
      let(:request_uri) { 'https://useragentapi.com/api/v4/json/%s/%s' % [api_key, CGI.escape(user_agent)] }

      before do
        stub_request(:get, request_uri).to_return(
          status: stub_status, body: stub_body
        )
      end

      it 'is valid response' do
        expect(client.parse(user_agent)).to match_array valid_response
      end
    end

    context 'when a server returns a broken response' do
      let(:api_key) { '01234abc' }
      let(:stub_status) { 500 }
      let(:stub_body) { '<b>Fatal error</b>' }
      let(:user_agent) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' }
      let(:request_uri) { 'https://useragentapi.com/api/v4/json/%s/%s' % [api_key, CGI.escape(user_agent)] }

      before do
        stub_request(:get, request_uri).to_return(
          status: stub_status, body: stub_body
        )
      end

      it 'is valid response' do
        expect(client.parse(user_agent)).to eq({})
      end
    end
  end
end
