# # encoding: utf-8

# Inspec test for recipe mongodb--server::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should_not be_listening }
end


describe package 'mongodb-org' do
	it {should be_installed}
	 its('version'){ should match /3\.2\../ }
end

describe port(27017) do
	it {should be_listening}
	its('addresses'){should include '0.0.0.0' }
end

# describe command('mongodb --version') do

# end

describe service 'mongodb' do
	it {should be_running}
	it {should be_enabled}
end


