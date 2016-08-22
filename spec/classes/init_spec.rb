require 'spec_helper'

describe 'workstation' do

  let :params do
    { 
      :default_user => 'iamauser',
      :dotfiles_repo => 'http_dotfiles_repo'
    }
  end

  context 'default' do
    it { is_expected.to compile }
    
    it { should contain_class('workstation').with(
          'default_user'  => 'iamauser',
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
  end

  context 'when running Arch Linux as operating system' do
    let(:facts) do
      { 
        :osfamily => 'Archlinux',
        :operatingsystem => 'Archlinux'
      }
    end

    it { is_expected.to contain_class('workstation::arch') }
    
    it { should contain_class('workstation::dotfiles').with(
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
    
    it { should contain_class('workstation::pips') }
    it { should contain_class('workstation::rubygems') }
    it { should_not contain_class('workstation::darwin') }
  end

  context 'when running Darwin as operating system' do
    let(:facts) do 
    { 
      :osfamily => 'Darwin',
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
    let(:params) do 
      { 
        :default_user => 'root'
      }
    end

    it { should compile.and_raise_error(/default_user cannot be root/) }
  end

  context 'with dotfiles_repo url' do
    let(:params) do 
      { 
        :default_user  => 'iamauser',
        :dotfiles_repo => 'http_dotfiles_repo'
      }
    end
    
    it { should contain_class('workstation::dotfiles').with(
          'dotfiles_repo' => 'http_dotfiles_repo' ) }
  end

  context 'without dotfiles_repo url' do
    let(:params) do 
      { 
        :default_user  => 'iamauser'
      }
    end
    
    it { should_not contain_class('workstation::dotfiles') }
  end

  # at_exit { RSpec::Puppet::Coverage.report! }
end