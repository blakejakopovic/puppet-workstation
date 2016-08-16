require 'spec_helper'

describe 'workstation::darwin' do
  context 'using Darwin operation system' do 
    let(:facts) { { :osfamily => 'Darwin',
                    :operatingsystem => 'Darwin',
                    :macosx_productversion_major => '10.7' } }
    let(:params) { { 
      :default_user => 'iamauser', } }

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
  context 'with unsupported operating system' do
    let(:params) { { 
      :default_user => 'iamauser', } }
    let(:facts) { { :osfamily => 'bados',
                    :operatingsystem => 'bados' } }
    it { should compile.and_raise_error(/unsupported/) }
  end
end