package com.ezen.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.biz.dto.PriceVO;
import com.ezen.biz.service.PriceService;
import com.ezen.biz.utils.Criteria;


@Controller
@SessionAttributes("price")
public class PriceController {
	@Autowired
	private PriceService PriceService;

	@RequestMapping(value="priceList")
	public String selectPriceList(Model model,Criteria cri) {
		List<PriceVO> list1=PriceService.selectPriceList();
		model.addAttribute("list1", list1);
		return "price/priceList";
	}
	
	//priceView
	
	@GetMapping("priceView")
	public String priceView(Model model,Criteria cri,PriceVO vo) {
		//productView.jsp 에서 필요한 데이터를 검색해서 model에 담아서 
		vo=PriceService.selectPrice(vo); //가격상세 조회
//		if(vo.getContent()!=null)
//			vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
//		Map<String, Number> pmap=ProductServiceImpl.selectAvgCountScore(vo.getPnum());
//		System.out.println(pmap);
//		model.addAttribute("pmap",pmap);
		model.addAttribute("price",vo);
		model.addAttribute("cri", cri);
		if(vo.getFilename()!=null)
			model.addAttribute("originFilename",vo.getFilename().substring(37));
		return "price/priceView";
	}

	//priceNew

	@GetMapping("priceNew")
	public String priceNew() {
		return "price/priceNew";
	}
	@PostMapping("priceNew")
	public String priceNew(PriceVO vo,Model mode)  {
		
		PriceService.insertPrice(vo);
		return "redirect:priceList";
	}
	
	//priceUpdate
	

	@PostMapping("priceUpdate")
	public String priceUpdate(@RequestParam MultipartFile uploadFile,@ModelAttribute("product") PriceVO vo,Criteria cri,RedirectAttributes rd) throws IllegalStateException, IOException {
		//System.out.println("기존파일명 : "+vo.getFilename());
		if(vo.getFilename().equals(""))vo.setFilename(null);
		if(!uploadFile.isEmpty()) {//서버에 저장 작업
			String filename=uploadFile.getOriginalFilename();
			//System.out.println("수정 파일명 : "+filename);
			//서버에 저장
			UUID uuid=UUID.randomUUID();
			String saveFilename=uuid+"-"+filename;
			uploadFile.transferTo(new File(saveFilename));
			//기존파일이 있는지 확인 - 있으면 기존 파일 삭제하기
			if(vo.getFilename()!=null) {
				File file=new File(vo.getFilename());
				if(file.exists())
					file.delete();
			}
			//저장된 파일명을 vo 에 담는다
			vo.setFilename(saveFilename);
		}
		//update 수행
		PriceService.updatePrice(vo);
		rd.addAttribute("pinum", vo.getPinum());
		return "redirect:productView";
	}
	//priceDelete
	@GetMapping("deletePrice")
	public String deletePrice(@RequestParam int pinum) {
		PriceService.deletePrice(pinum);
		return "forward:productView";
	}
}

