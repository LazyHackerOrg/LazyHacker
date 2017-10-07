require 'nmap/xml'

Host = Struct.new (:IP, :os)
Service = Struct.new (:name, :version, :port, :protocol, :info)



class Parser

	def self.toJSON(file="scan.json")

	end

	def self.toCSV(file="scan.csv")

	end

	def self.toMap

	end

	def self.print
		data_map = parse()
		data_map.each do |host, service_array|
			puts "[#{host.IP}]::#{host.os}"
			service_array.each do |service|
				puts "#{service.name} - #{service.version} - #{service.port} - #{service.protocol} - #{service.info}"
		end

	end

	private: 

	def parse(file='./.scan_result')
		data_map = {}

		Nmap.XML.new(file) do |xml|
			xml.each_up_host do |host|
				
				# [IP, OS]
				a_host = Host.new(host.ip, host.os.matches.first.to_s)
				services = []

				host.each_port do |port|
						# [nombre, version, puerto, protocolo, info]
						a_service = Service.new( port.service.name,
																		 port.service.version,
																		 port.number,
																		 port.protocol,
																		 port.service.extra_info )
						services << a_service
				end

				@data_map[a_host] = services

			end
		end
		data_map
	end 



end
