require 'spec_helper'

describe 'workstation::darwin' do
  context 'when running Darwin operation system' do 
    let(:facts) do
      { 
        :osfamily => 'Darwin',
        :operatingsystem => 'Darwin',
        :macosx_productversion_major => '10.7'
      }
    end

    let(:params) do
      { 
        :default_user => 'iamauser'
      }
    end

    it { is_expected.to compile }

    it { is_expected.to contain_class('workstation::darwin').with(
            'default_user' => 'iamauser' ) }

    it { should contain_class('workstation::darwin::developer') }
    it { should contain_class('workstation::darwin::filesystems') }
    it { should contain_class('workstation::darwin::media') }
    it { should contain_class('workstation::darwin::monitoring') }
    it { should contain_class('workstation::darwin::networking') }
    it { should contain_class('workstation::darwin::productivity') }
    it { should contain_class('workstation::darwin::social') }
    it { should contain_class('workstation::darwin::system') }
    it { should contain_class('workstation::darwin::terminal') }
    it { should contain_class('workstation::darwin::utilities') }
    it { should contain_class('workstation::darwin::web_browsers') }
  end
  
  context 'when running an unsupported operating system' do
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