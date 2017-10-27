#
# Cookbook:: mongodb--server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongodb--server::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs mongodb-org' do
      expect(chef_run).to upgrade_package 'mongodb-org'
    end

    it 'should enable the database' do
      expect(chef_run).to enable_service 'mongodb'
    end

    it 'should start the database' do 
      expect(chef_run).to enable_service 'mongodb'
    end


  end
end
