require 'yaml'

RSpec.describe 'YAML Functionality' do
  before(:all) do
    # Load YAML data from the test file
    @data = YAML.load_file('test_data.yml')
  end

  it 'parses YAML data correctly' do
    expect(@data['user']['name']).to eq('John Doe')
    expect(@data['user']['age']).to eq(30)
    expect(@data['user']['email']).to eq('john.doe@example.com')
    expect(@data['user']['interests']).to include('programming')
  end

  it 'dumps Ruby objects to YAML' do
    ruby_object = { user: { name: 'Jane Doe', age: 25, email: 'jane.doe@example.com' } }
    yaml_output = YAML.dump(ruby_object)
    
    expect(yaml_output).to include('name: Jane Doe')
    expect(yaml_output).to include('age: 25')
    expect(yaml_output).to include('email: jane.doe@example.com')
  end
end
