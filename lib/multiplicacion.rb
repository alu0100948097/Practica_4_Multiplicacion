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
    
    def izq(b)
        temp=b.split("")
        for i in (0..temp.length-2)
            temp[i]=temp[i+1]
        end
        temp[temp.length-1]="0"
        return temp.join
    end
    
    def XOR(a,b)
        temp=a.unpack('C*').zip(b.unpack('C*'))
        temp=temp.map {|x,y| x^y}.join
        return temp
    end
    
    def operacion(n)
        temp=""
        for i in (0..n)
            if (i==0)
                temp=@primer
            elsif (temp[0]=="1")
                temp=XOR(izq(temp),algoritmo)
            else
                temp=izq(temp)
            end
        end
        return temp
    end
    
    def multiplicar
        temp=[]
        suma=[]
        
        for i in (0..@segundo.length-1)
            if (@segundo[i]=="1")
                temp.push(7-i)
            end
        end
        
        temp.reverse!
        
        for i in (0..temp.length-1)
            suma.push(operacion(temp[i]))
        end
        
        t=suma[0]
        
        for i in (1..suma.length-1)
            t=XOR(t,suma[i])
        end
        
        return t
    end
    
end

@test=Multiplicacion.new

loop do
    puts
    puts "PRACTICA: MULTIPLICACIÓN EN SNOW 3G y AES"
    print "Introduzca el primer byte: "
    primer=gets.chomp
    @test.primer=primer
    print "Introduzca el segundo byte: "
    segundo=gets.chomp
    @test.segundo=segundo
    puts "Seleccionar Algoritmo"
    puts "1: AES"
    puts "2: SNOW 3G"
    puts "3: Modificación"
    print "Introduzca una opcion: "
    opcion = gets.chomp
    puts
    case opcion
        when '1'
        @test.algoritmo="1B"
        puts "Primer byte: #{@test.primer}"
        puts "Segundo byte: #{@test.segundo}"
        puts "Byte Algoritmo: #{@test.algoritmo}"
        puts "Multiplicación: #{@test.multiplicar}"
        when '2'
        @test.algoritmo="A9"
        puts "Primer byte: #{@test.primer}"
        puts "Segundo byte: #{@test.segundo}"
        puts "Byte Algoritmo: #{@test.algoritmo}"
        puts "Multiplicación: #{@test.multiplicar}"
        when '3'
        @test.algoritmo="AF"
        puts "Primer byte: #{@test.primer}"
        puts "Segundo byte: #{@test.segundo}"
        puts "Byte Algoritmo: #{@test.algoritmo}"
        puts "Multiplicación: #{@test.multiplicar}"
        else
        system "clear"
        puts "La opción introducida es incorrecta".red
        puts
    end
end

