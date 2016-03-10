require_relative 'spec_helper.rb'

describe "my example spec" do
  it "should successfully return a greeting" do
    get '/'
    last_response.body.must_include 'Hello, World!'
  end
end
