# https://github.com/terlar/archbox

require 'puppet/provider/package'
require 'set'
require 'uri'

Puppet::Type.type(:package).provide :aur, :parent => Puppet::Provider::Package do
  desc "Support for the Pacman-like AUR helper used in Archlinux."

  commands :aurget => "/usr/bin/aurget"
  commands :pacman => "/usr/bin/pacman"

  confine :operatingsystem => [:archlinux, :manjarolinux]
  has_feature :install_options
  has_feature :uninstall_options
  has_feature :upgradeable
  has_feature :virtual_packages

  # Install a package using 'aurget'.
  # Installs quietly, without confirmation.
  def install
    cmd = %w{--noconfirm --noedit --deps --builddir /tmp}
    cmd += install_options if @resource[:install_options]
    cmd << "-S" << @resource[:name]

    aurget(*cmd)

    unless self.query
      fail("Could not find package '#{@resource[:name]}'")
    end
  end

  # Fetch the list of packages that are currently installed on the system.
  def self.instances
    instances = []

    # Get the installed packages
    installed_packages = get_installed_packages
    installed_packages.sort_by { |k, _| k }.each do |package, version|
      instances << new(to_resource_hash(package, version))
    end

    instances
  end

  # returns a hash package => version of installed packages
  def self.get_installed_packages
    begin
      packages = {}
      execpipe([command(:pacman), "-Qm"]) do |pipe|
        # pacman -Qm output is 'packagename version-rel'
        regex = %r{^(\S+)\s(\S+)}
        pipe.each_line do |line|
          if match = regex.match(line)
            packages[match.captures[0]] = match.captures[1]
          else
            warning("Failed to match line '#{line}'")
          end
        end
      end
      packages
    rescue Puppet::ExecutionFailure
      fail("Error getting installed packages")
    end
  end

  # Because Archlinux is a rolling release based distro, installing a package
  # should always result in the newest release.
  def update
    # Install in pacman can be used for update, too
    self.install
  end

  # What's the latest package version available?
  def latest
    output = aurget "-Si", @resource[:name]

    if output =~ /Version\s+:\s+(\S+)$/
      return $1
    else
      self.err "Could not find latest version"
      return nil
    end
  end

  # Querys information for a package
  def query
    installed_packages = self.class.get_installed_packages
    resource_name = @resource[:name]

    version = installed_packages[resource_name]

    # Return nil if no package found
    return nil unless version

    self.class.to_resource_hash(resource_name, version)
  end

  def self.to_resource_hash(name, version)
    {
      :name     => name,
      :ensure   => version,
      :provider => self.name
    }
  end

  # Removes a package from the system.
  def uninstall
    cmd = %w{--noconfirm --noprogressbar}
    cmd += uninstall_options if @resource[:uninstall_options]
    cmd << "-R"
    cmd << @resource[:name]

    pacman(*cmd)
  end

  private

  def install_options
    join_options(@resource[:install_options])
  end

  def uninstall_options
    join_options(@resource[:uninstall_options])
  end
end