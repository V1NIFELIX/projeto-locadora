package br.com.locadora.VO;

import java.util.Date;

public class ClienteVO {
	
	private Integer idCliente;
	private String cpfC;
	private String endC;
	private Date dataNascC;
	private String senhaC;
	private String emailC;
	private String nomeC;
	
	

	public String getCpfC() {
		return cpfC;
	}
	public void setCpfC(String cpfC) {
		this.cpfC = cpfC;
	}
	public String getEndC() {
		return endC;
	}
	public void setEndC(String endC) {
		this.endC = endC;
	}

	public String getSenhaC() {
		return senhaC;
	}
	public void setSenhaC(String senhaC) {
		this.senhaC = senhaC;
	}
	public String getEmailC() {
		return emailC;
	}
	public void setEmailC(String emailC) {
		this.emailC = emailC;
	}
	public String getNomeC() {
		return nomeC;
	}
	public void setNomeC(String nomeC) {
		this.nomeC = nomeC;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Date getDataNascC() {
		return dataNascC;
	}
	public void setDataNascC(Date dataNascC) {
		this.dataNascC = dataNascC;
	}


	
	
	

}
