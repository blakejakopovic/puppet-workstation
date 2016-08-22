require 'spec_helper'

describe 'workstation::arch' do
  context 'using Arch Linux operation system' do
    let(:facts) do
      { 
        :osfamily => 'Archlinux',
        :operatingsystem => 'Archlinux'
      }
    end

    let(:params) do
      { 
        :default_user => 'iamauser'
      }
    end

    it { is_expected.to compile }

    it { is_expected.to contain_class('workstation::arch').with(
            'default_user' => 'iamauser' ) } 

    it { should contain_class('workstation::arch::developer') }
    it { should contain_class('workstation::arch::filesystems') }
    it { should contain_class('workstation::arch::fonts') }
    it { should contain_class('workstation::arch::media') }
    it { should contain_class('workstation::arch::monitoring') }
    it { should contain_class('workstation::arch::networking') }
    it { should contain_class('workstation::arch::social') }
    
    it { should contain_class('workstation::arch::system').with(
            'default_user' => 'iamauser' ) }
    
    it { should contain_class('workstation::arch::terminal') }
    
    it { should contain_class('workstation::arch::web_browsers').with(
            'default_user' => 'iamauser' ) }
    it { should contain_class('workstation::arch::window_managers') }
  end

  context 'with unsupported operating system' do
    let(:params) do
      { 
        :default_user => 'iamauser'
      }
    end

    let(:facts) do
      { 
        :osfamily => 'bados',
        :operatingsystem => 'bados'
      }
    end

    it { should compile.and_raise_error(/unsupported/) }
  end
end