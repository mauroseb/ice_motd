require 'chefspec'
require 'chefspec/policyfile'

RSpec.configure do |config|
  config.color = true
  config.file_cache_path = '/var/chef/cache'
  config.log_level = :warn
end

describe 'ice_motd::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '8') do |node|
      # Custom attributes not provided by Fauxhai
      node.default['policy_group'] = 'prod'
      node.default['chef_server_url'] = 'infra-chefspec-01.a2-01.local'
      node.default['business_line'] = 'Cloud Services'
      node.default['business_owner'] = 'Mauro Oddi'
      # os_release not in Fauxhai CentOS 8
      node.default['os_release']['pretty_name'] = 'CentOS Linux 8'
    end.converge(described_recipe)
  end

  context 'with default attributes' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates /etc/motd from template' do
      expect(chef_run).to create_template('/etc/motd').with(
        owner: 'root',
        group: 'root',
        mode: '0644'
      )
    end

    it { is_expected.to render_file('/etc/motd').with_content('THIS NODE IS MANAGED BY CHEF') }
    it { is_expected.to render_file('/etc/motd').with_content('PROD') }
    it { is_expected.to render_file('/etc/motd').with_content('Footer sample line') }
  end
end
