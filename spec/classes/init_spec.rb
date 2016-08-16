require 'spec_helper'

describe 'workstation' do

  let(:params) { { 
      :default_user => 'iamauser',
      :dotfiles_repo => 'http_dotfiles_repo' } }

  context 'default' do
    it { is_expected.to compile }
    it { should contain_class('workstation').with(
          'default_user'  => 'iamauser',
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
  end

  context 'with Arch Linux' do
    let(:facts) { { :osfamily => 'Archlinux',
                    :operatingsystem => 'Archlinux' } }

    it { is_expected.to contain_class('workstation::arch').with(
          'default_user'  => 'iamauser' ) }
    it { should contain_class('workstation::dotfiles').with(
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
    it { should contain_class('workstation::pips') }
    it { should contain_class('workstation::rubygems') }
    it { should_not contain_class('workstation::darwin') }
  end

  context 'with Darwin' do
    let(:facts) do 
    { :osfamily => 'Darwin',
      :operatingsystem => 'Darwin',
      :macosx_productversion_major => '10.7' 
    }
    end
                    
    it { is_expected.to contain_class('workstation::darwin').with(
          'default_user' => 'iamauser' ) }
    it { should contain_class('workstation::dotfiles').with(
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
    it { should contain_class('workstation::pips') }
    it { should contain_class('workstation::rubygems') }
    it { should_not contain_class('workstation::arch') }
  end

  context 'using root as default user' do
    let(:params) { { 
      :default_user => 'root' } }
    # it { is_expected.to contain_class('workstation::arch').with(
    #       'default_user'  => 'root' ) }
    it { should compile.and_raise_error(/default_user cannot be root/) }
  end

  # at_exit { RSpec::Puppet::Coverage.report! }
end


# it { should contain_file('yum.conf').with_ensure('present') }

# context 'install git-core' do
#   it { should contain_package('git-core')
#        .with_ensure('latest')
#   }
# end

# it { is_expected.to contain_package('mysql-server').with_ensure('present') }

# https://github.com/rodjek/rspec-puppet
# http://betterspecs.org

# https://github.com/puppetlabs/puppetlabs_spec_helper

# it { is_expected.to create_class('profile::apache') }
# it { is_expected.to contain_package('httpd') }
# it { is_expected.to contain_user("apache") }

# context 'with defaults for all parameters' do