require 'nmap/xml'

Host = Struct.new(:IP, :os)
Service = Struct.new(:name, :version, :port, :protocol, :info)



class Parser

	def initialize(filename='./.scan_result.xml')
		@data_map = {}
		parse(filename)
	end


	def toJSON(file="scan.json")

	end

	def toCSV(file="scan.csv")

	end

	def print
		@data_map.each do |host, service_array|
			puts '·'*45
			puts "[#{host.IP}]::#{host.os}"
			service_array.each do |service|
				puts "#{service.name} - #{service.version} - #{service.port} - #{service.protocol} - #{service.info}"
			end
		end
	end

	def to_s
		@data_map.to_s
	end

	private

	def parse(file)

		Nmap::XML.new(file) do |xml|
			xml.each_up_host do |host|
				
				# [IP, OS]
				a_host = Host.new(host.ip, host.os.matches.first.to_s)
				services = []

				host.each_port do |port|
						# [nombre, version, puerto, protocolo, info]
						a_service = Service.new(port.service.name,
												port.service.version,
												port.number,
												port.protocol,
												port.service.extra_info )
						services << a_service
				end

				@data_map[a_host] = services

			end
		end
	end 


end
