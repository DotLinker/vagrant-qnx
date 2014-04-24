module VagrantPlugins
  module GuestQNX
    module Cap
      class ConfigureNetworks
        def self.configure_networks(machine,networks)
        	machine.ui.warn("networking")
	      	networks.each do |network|
	          if network[:type].to_sym == :static
	            machine.communicate.execute("su -c - \"ifconfig en#{network[:interface]} inet #{network[:ip]} netmask #{network[:netmask]}\"")
	          elsif network[:type].to_sym == :dhcp
	            machine.communicate.execute("su -c - \"dhcp.client -i en#{network[:interface]}\"")
	          end
	        end
	      end
      end
    end
  end
end
