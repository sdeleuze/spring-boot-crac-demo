package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class HelloController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping("/")
	String index() {
		String message = "Greetings from Spring Boot!";
		logger.info(message);
		return message;
	}

}
