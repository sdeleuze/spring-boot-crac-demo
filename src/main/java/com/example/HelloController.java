package com.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class HelloController {

	Logger logger = LoggerFactory.getLogger(HelloController.class);

	@GetMapping("/")
	String index() {
		String message = "Greetings from Spring Boot!";
		logger.info(message);
		return message;
	}

}
