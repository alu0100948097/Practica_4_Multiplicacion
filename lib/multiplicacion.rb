class Multiplicacion
	
    attr_reader :primer, :segundo, :algoritmo
	
    def initialize
		@primer=""
        @segundo=""
        @algoritmo=""
	end
    
    def primer=(p)
		@primer=p.hex.to_s(2).rjust(8,'0')
	end
    
    def segundo=(s)
		@segundo=s.hex.to_s(2).rjust(8,'0')
	end
    
    def algoritmo=(a)
        @algoritmo=a.hex.to_s(2).rjust(8,'0')
    end
    
end
