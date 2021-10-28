package com.kh.bookmate.recently_view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bookmate.recently_view.model.service.RecentlyViewService;

@Controller
public class RecentlyViewController {
	
	@Autowired
	private RecentlyViewService recentlyViewService;

}
