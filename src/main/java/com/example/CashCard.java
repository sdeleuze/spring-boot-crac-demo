package com.example;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public final class CashCard {
	@Id private Long id;

	private Double amount;

	private String owner;

	public CashCard() {
		this.id = null;
		this.amount = null;
		this.owner = null;
	}

	public CashCard(Long id, Double amount, String owner) {
		this.id = id;
		this.amount = amount;
		this.owner = owner;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) return true;
		if (obj == null || obj.getClass() != this.getClass()) return false;
		var that = (CashCard) obj;
		return Objects.equals(this.id, that.id) &&
				Objects.equals(this.amount, that.amount) &&
				Objects.equals(this.owner, that.owner);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, amount, owner);
	}

	@Override
	public String toString() {
		return "CashCard[" +
				"id=" + id + ", " +
				"amount=" + amount + ", " +
				"owner=" + owner + ']';
	}

}