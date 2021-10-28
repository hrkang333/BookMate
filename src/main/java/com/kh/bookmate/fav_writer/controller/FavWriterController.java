package com.kh.bookmate.fav_writer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bookmate.fav_writer.model.service.FaveWriterService;

@Controller
public class FavWriterController {
	
	@Autowired
	private FaveWriterService faveWriterService;

} 
