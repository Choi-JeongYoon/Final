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

import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.service.ProductService;
import com.ezen.biz.utils.Criteria;
import com.ezen.biz.utils.PageMaker;
@Controller
@SessionAttributes("product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	
	private final String imgPath="C:/upload/productimg/";
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		return "home";
//	}
	
	@RequestMapping(value = "productList")
	public String selectProductList(Model model,Criteria cri) {
		List<ProductVO> list=service.selectProductList(cri);
		model.addAttribute("list", list);
		//PageMaker 객체 생성 : 
		int cnt=service.selectRowCount(cri);
		PageMaker maker=new PageMaker(cri, cnt);
		model.addAttribute("pmaker", maker);
		return "product/productList";
	}
	@GetMapping("productView")
	public String productView(Model model,Criteria cri,ProductVO vo) {
		//productView.jsp 에서 필요한 데이터를 검색해서 model에 담아서 
		vo=service.selectProduct(vo); //도서상세 조회
//		if(vo.getContent()!=null)
//			vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
//		Map<String, Number> pmap=ProductServiceImpl.selectAvgCountScore(vo.getPnum());
//		System.out.println(pmap);
//		model.addAttribute("pmap",pmap);
		model.addAttribute("product",vo);
		model.addAttribute("cri", cri);
		if(vo.getFilename()!=null)
			model.addAttribute("originFilename",vo.getFilename().substring(37));
		if(vo.getPcontent()!=null)
			model.addAttribute("repContent", vo.getPcontent().replaceAll("\r\n", "<br>"));
		
		return "product/productView";
	}
	//상품 등록
	@GetMapping("productNew")
	public String productNew() {
		return "product/productNew";
	}
	@PostMapping("productNew")
	public String productNew(@RequestParam MultipartFile uploadFile,@RequestParam MultipartFile uploadFile2,ProductVO vo) throws IllegalStateException, IOException {
		//업로드 파일 처리
		//MultipartFile uploadFile=vo.getUploadFile();
		if(!uploadFile.isEmpty()) {//서버에 저장 작업
			String pimg1=uploadFile.getOriginalFilename();
			//서버에 저장
			UUID uuid=UUID.randomUUID();
			String saveFilename=uuid+"-"+pimg1;
			uploadFile.transferTo(new File(imgPath+saveFilename));
			//저장된 파일명을 vo 에 담는다
			vo.setFilename(saveFilename);
		}
		if(!uploadFile2.isEmpty()) {//서버에 저장 작업
			String pimg2=uploadFile2.getOriginalFilename();
			//서버에 저장
			UUID uuid=UUID.randomUUID();
			String saveFilename=uuid+"-"+pimg2;
			//uploadFile.transferTo(new File(imgPath+saveFilename));
			//저장된 파일명을 vo 에 담는다
			vo.setFilename(saveFilename);
		}
		//DB에 저장하기
		service.insertProduct(vo);
		return "forward:productList";
	}
	//상품 수정
	@PostMapping("productUpdate")
	public String productUpdate(@RequestParam MultipartFile uploadFile,@ModelAttribute("product") ProductVO vo,Criteria cri,RedirectAttributes rd) throws IllegalStateException, IOException {
		//System.out.println("기존파일명 : "+vo.getFilename());
		if(vo.getFilename().equals(""))vo.setFilename(null);
		if(!uploadFile.isEmpty()) {//서버에 저장 작업
			String filename=uploadFile.getOriginalFilename();
			//System.out.println("수정 파일명 : "+filename);
			//서버에 저장
			UUID uuid=UUID.randomUUID();
			String saveFilename=uuid+"-"+filename;
			uploadFile.transferTo(new File(imgPath+saveFilename));
			//기존파일이 있는지 확인 - 있으면 기존 파일 삭제하기
			if(vo.getFilename()!=null) {
				File file=new File(imgPath+vo.getFilename());
				if(file.exists())
					file.delete();
			}
			//저장된 파일명을 vo 에 담는다
			vo.setFilename(saveFilename);
		}
		
		//update 수행
		service.updateProduct(vo);
		rd.addAttribute("pnum", vo.getPnum());
		rd.addAttribute("pageNum", cri.getPageNum());
		rd.addAttribute("searchword", cri.getSearchword());
		rd.addAttribute("searchtype", cri.getSearchtype());
		return "redirect:productView";
	}
	//상품 삭제
	@GetMapping("deleteProduct")
	public String deleteProduct(@RequestParam int pnum) {
		service.deleteProduct(pnum);
		return "forward:productList";
	}
}
