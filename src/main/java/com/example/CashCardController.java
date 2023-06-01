package com.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cashcards")
public class CashCardController {
	private CashCardRepository cashCardRepository;

	public CashCardController(CashCardRepository cashCardRepository) {
		this.cashCardRepository = cashCardRepository;
	}

	@GetMapping
	public Iterable<CashCard> findAll() {
		return cashCardRepository.findAll();
	}

	@GetMapping("{id}")
	public CashCard findOne(@PathVariable Long id) {
		return cashCardRepository.findById(id).get();
	}
}