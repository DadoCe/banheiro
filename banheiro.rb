class Banheiro

	def initialize(mictorios)
		@mictorios = mictorios
	end

	def escolhe_mictorio
		if os_dois_primeiros_mictorios_estao_vagos?
			primeiro_mictorio
		elsif os_dois_ultimos_mictorios_estao_vagos?
			ultimo_mictorio
		elsif existe_sequencia_de_tres_mictorios_vagos?
			ache_mictorio_mijavel
		else
			"Nao deve usar esse banheiro"
		end																
	end

	def os_dois_primeiros_mictorios_estao_vagos?
		@mictorios.first(2) == [0,0]
	end

	def os_dois_ultimos_mictorios_estao_vagos?
		@mictorios.last(2) == [0,0]
	end

	def primeiro_mictorio
		"1"
	end

	def ultimo_mictorio
		@mictorios.size.to_s
	end

	def existe_sequencia_de_tres_mictorios_vagos?
		ache_mictorio_mijavel != "Nao encontrado"
	end

	def ache_mictorio_mijavel
		encontre_mictorio_vago_com_a_vizinhanca_vaga @mictorios
	end

	private
	def encontre_mictorio_vago_com_a_vizinhanca_vaga(mictorios)    
		mictorio_esquerda = mictorios.index(0)
		mictorio_centro = mictorio_esquerda + 1    
		mictorio_direita = mictorio_centro + 1

	    if mictorios[mictorio_centro] == 0 && mictorios[mictorio_direita] == 0
	    	return (mictorio_centro + 1).to_s
	    elsif mictorios[mictorio_direita .. @mictorios.size].index(0) 
	    	mictorios[mictorio_esquerda] = 1	
	    	return encontre_mictorio_vago_com_a_vizinhanca_vaga mictorios
		end
		"Nao encontrado"
	end
end