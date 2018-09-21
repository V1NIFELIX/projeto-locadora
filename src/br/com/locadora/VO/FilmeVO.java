package br.com.locadora.VO;

import java.util.ArrayList;

public class FilmeVO {
	
	private Integer idFilmes;
	private String sinopseF;
	private String nomeF;
	private Integer quantidadeF;
	
	
	public Integer getIdFilmes() {
		return idFilmes;
	}
	public void setIdFilmes(Integer idFilmes) {
		this.idFilmes = idFilmes;
	}

	public String getSinopseF() {
		return sinopseF;
	}
	public void setSinopseF(String sinopseF) {
		this.sinopseF = sinopseF;
	}
	public String getNomeF() {
		return nomeF;
	}
	public void setNomeF(String nomeF) {
		this.nomeF = nomeF;
	}
	public Integer getQuantidadeF() {
		return quantidadeF;
	}
	public void setQuantidadeF(Integer quantidadeF) {
		this.quantidadeF = quantidadeF;
	}
	public void setIdFilmes(ArrayList<Integer> idFilmes2) {
		// TODO Auto-generated method stub
		
	}
	

}
