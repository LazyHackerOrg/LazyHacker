require_relative 'scanner.rb'
require_relative 'parser.rb'

Scanner.scan
parseador = Parser.new()
parseador.print
