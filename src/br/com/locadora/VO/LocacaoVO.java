package br.com.locadora.VO;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class LocacaoVO {
	
	private Integer idLocacao;
	private Date dataDeLocacao;
	private Date dataDeDevolucao;
	private Date dataDeVencimento;
	private double valorBase;
	private double valorReal;
	private boolean situacao;
	private ClienteVO cliente;
	private List<FilmeVO> filme;
	private String nomeF;

	
	
	
	public LocacaoVO() {
		setCliente(new ClienteVO());
		setFilme(new ArrayList<FilmeVO>());
		
	}
	
	public Integer getIdLocacao() {
		return idLocacao;
	}
	public void setIdLocacao(Integer idLocacao) {
		this.idLocacao = idLocacao;
	}

	public ClienteVO getCliente() {
		return cliente;
	}
	public void setCliente(ClienteVO cliente) {
		this.cliente = cliente;
	}

	public boolean getSituacao() {
		return situacao;
	}
	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}


	public double getValorReal() {
		return valorReal;
	}


	public void setValorReal(double valorReal) {
		this.valorReal = valorReal;
	}


	public double getValorBase() {
		return valorBase;
	}


	public void setValorBase(double valorBase) {
		this.valorBase = valorBase;
	}

	public Date getDataDeLocacao() {
		return dataDeLocacao;
	}

	public void setDataDeLocacao(Date dataDeLocacao) {
		this.dataDeLocacao = dataDeLocacao;
	}

	public Date getDataDeDevolucao() {
		return dataDeDevolucao;
	}

	public void setDataDeDevolucao(Date dataDeDevolucao) {
		this.dataDeDevolucao = dataDeDevolucao;
	}

	public Date getDataDeVencimento() {
		return dataDeVencimento;
	}

	public void setDataDeVencimento(Date dataDeVencimento) {
		this.dataDeVencimento = dataDeVencimento;
	}

	public String getNomeF() {
		return nomeF;
	}

	public void setNomeF(String nomeF) {
		this.nomeF = nomeF;
	}

	public List<FilmeVO> getFilme() {
		return filme;
	}

	public void setFilme(List<FilmeVO> filme) {
		this.filme = filme;
	}







}
