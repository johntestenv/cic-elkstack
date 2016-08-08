require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'java' do
  describe command('java -version') do
    its(:stderr) { should contain 'java version' }
  end
end

describe 'elasticsearch' do
  describe service('elasticsearch') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(9200) do
    it { should be_listening }
  end

  describe port(9300) do
    it { should be_listening }
  end

describe 'nginx' do
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end
end

describe 'kibana' do

  it 'is configured with sv for init' do
    cmd = command('sv check kibana')
    expect(cmd.stdout).to include 'ok:'
  end

  describe service('kibana') do
    it { should be_running }
  end

  describe port(5601) do
    it { should be_listening }
  end
end

describe 'logstash' do
  describe service('logstash') do
    it { should be_running }
  end
end
end

