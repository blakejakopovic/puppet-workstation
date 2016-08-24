require 'spec_helper'

describe 'workstation::arch' do
  context 'when running Arch Linux operation system' do
    let(:facts) do
      { 
        :osfamily => 'Archlinux',
        :operatingsystem => 'Archlinux'
      }
    end

    it { is_expected.to compile }

    it { is_expected.to contain_class('workstation::arch') }

    it { should contain_class('workstation::arch::developer') }
    it { should contain_class('workstation::arch::filesystems') }
    it { should contain_class('workstation::arch::media') }
    it { should contain_class('workstation::arch::monitoring') }
    it { should contain_class('workstation::arch::networking') }
    it { should contain_class('workstation::arch::social') }
    it { should contain_class('workstation::arch::system') }
    it { should contain_class('workstation::arch::terminal') }
    it { should contain_class('workstation::arch::web_browsers') }
    it { should contain_class('workstation::arch::window_managers') }
  end

  context 'when running an unsupported operating system' do
    let(:facts) do
      { 
        :osfamily => 'bados',
        :operatingsystem => 'bados'
      }
    end

    it { should compile.and_raise_error(/unsupported/) }
  end
end
