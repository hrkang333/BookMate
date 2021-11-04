package com.kh.bookmate.ubook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bookmate.ubook.model.service.UbookService;
import com.kh.bookmate.ubook.model.vo.Ubook;

public class UbookController {

	@Autowired
	UbookService ubookService;
	
	@RequestMapping("ubookList.ub")
	public String ubookList() {
		return "ubook/ubookList";
	}

	@RequestMapping("ubookDetail.ub")
	public String ubookDetail() {
		return "ubook/ubookDetail";
	}

	@RequestMapping("ubookEnroll.ub")
	public String ubookEnroll(Ubook ubook,
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date ubookPubDate,
								@RequestParam("UbookMainImgFile") MultipartFile UbookMainImgFile,
								HttpServletRequest request,
								Model model) {


		ubook.setUbookPubDate(ubookPubDate);
		ubook.setUbookDetail(ubook.getUbookDetail().replaceAll("\r\n", "<br>"));
		String ubookImg = changeFileNameAndSave(request, UbookMainImgFile);
		ubook.setUbookImg(ubookImg);
		
			ubookService.insertUbook(ubook);
			
			//int ubookDetail = ubookService.selectBook(ubook.getUbookNo());
			
			//model.addAttribute("ubook", ubookDetail);

			return "seller/ubookEnrollForm";
	}
	
	public String changeFileNameAndSave(HttpServletRequest request, MultipartFile file) {

		String originName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("resources") + File.separator+"images"+File.separator+"Ubookimg"+File.separator;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());

		int random = (int) (Math.random() * 99999 + Math.random() * 99999);

		
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String newFileName = currentTime + random + ext;
		
		try {
			file.transferTo(new File(path + newFileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("파일 업로드 에러");
		}
		return newFileName;
	}
}
