package com.ezen.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.McateVO;
import com.ezen.biz.dto.PriceVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.service.CateService;
import com.ezen.biz.service.ProductService;
import com.ezen.biz.service.ProductServiceImpl;
import com.ezen.biz.utils.Criteria;
import com.ezen.biz.utils.PageMaker;

import lombok.extern.log4j.Log4j;
@Controller
@SessionAttributes("product")
@Log4j
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private com.ezen.biz.service.PriceService priceService;
	@Autowired
	private CateService CateService;
	
	
	private final String imgPath="C:/final/pimg/";
	
	
	@RequestMapping(value = "productList")
	public String selectProductList(Model model,Criteria cri,String subcategory) {
		List<ProductVO> list=service.selectProductList(subcategory);
		model.addAttribute("list", list);
		//PageMaker 객체 생성 : 
		int cnt=service.selectRowCount(cri);
		PageMaker maker=new PageMaker(cri, cnt);
		model.addAttribute("pmaker", maker);
		return "product/productList";
	}
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {	
		log.info("dfdsfa");
		List<McateVO> list=CateService.selectCate();
		log.info(list);
		model.addAttribute("list", list);
		
		//List<ScateVO> sCate=service.
		return "home";
	}
	
	@GetMapping("productView")
	public String productView(Model model,Criteria cri,ProductVO vo) {
		//productView.jsp 에서 필요한 데이터를 검색해서 model에 담아서 
		log.info("vo====="+vo);
		vo=service.selectProduct(vo); //도서상세 조회
		model.addAttribute("product",vo);
		model.addAttribute("cri", cri);
		log.info("vo.getPnum()="+vo.getPnum());
		List<PriceVO> list1=priceService.selectPriceList(vo.getPnum());
		log.info("list1====="+list1);
		model.addAttribute("list1", list1);
		if(vo.getFilename()!=null)
			model.addAttribute("originFilename",vo.getFilename().substring(37));
		if(vo.getPcontent()!=null)
			model.addAttribute("repContent", vo.getPcontent().replaceAll("\r\n", "<br>"));
		
		return "product/productView";
	}
	//이미지 다운로드 
		@GetMapping("imgDown")
		public void imgDown(@RequestParam String filename,HttpServletRequest request,HttpServletResponse response) throws IOException {
			// 파라메타값 받아오기
			// 저장되어 있는 파일명 : filename -앞37자리 uuid
			String pathFilename=imgPath+filename;//경로 포함 파일명
			//이미지를 다른이름으로 다운로드할 때 uuid제외한 파일명 수정
			filename=filename.substring(37);
			//웹브라우저의 종류 확인
			String agent=request.getHeader("User-Agent");
			// ie 7 또는 edge
			boolean ieBrowser=(agent.indexOf("Trident")>-1)||(agent.indexOf("Edge")>-1);
			if(ieBrowser) {
				filename=URLEncoder.encode(filename,"utf-8").replace("\\","%20");
			}else {// edge, 파이어폭스, 크롬
				filename=new String(filename.getBytes("utf-8"),"iso-8859-1");
			}
			response.setContentType("image/jpg");
			//다운로드 되는 파일명 설정
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			FileInputStream in=new FileInputStream(pathFilename);//파일 open
			//출력할 곳
			BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());
			int numRead;
			byte b[]=new byte[4096];//4K만큼
			while((numRead=in.read(b,0,b.length))!=-1) {
				out.write(b,0,numRead);
			}//end while
			out.flush();//버퍼에 남은것 출력
			in.close();
			out.close();
		}
	//상품 등록
	@GetMapping("productNew")
	public String productNew(Model model) {
		List<McateInfo> mCate=CateService.selectProductMCateList();
		model.addAttribute("mCate", mCate);
		
		List<ScateInfo> sCate=CateService.selectProductSCateList();
		model.addAttribute("sCate", sCate);
		return "product/productNew";
	}
	@PostMapping("productNew")
	public String productNew(MultipartFile[] uploadFile, ProductVO vo ,Model model, @RequestParam String mCate) {
		int cnt = 0;
		log.info("전----:"+vo);
		vo.setPtype1(mCate);
		log.info("후ㅡ----:"+vo);
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			String savedFilename = UUID.randomUUID() + "-" + multipartFile.getOriginalFilename();
			if(multipartFile.getSize()>0) {
				File filename = new File(imgPath, savedFilename);
	
				try {
					multipartFile.transferTo(filename);
					cnt++;
					if (cnt == 1) {
					vo.setPimg1(savedFilename);
					} else if (cnt == 2) {
						vo.setPimg2(savedFilename);
					}
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
			}
		} // end for
		//DB에 저장하기
		vo.setPsavimg(imgPath);
		service.insertProduct(vo);
		return "forward:productList";
	}
	//상품 수정
	@PostMapping("productUpdate")
	public String productUpdate(MultipartFile[] uploadFile, @ModelAttribute("product") ProductVO vo,Criteria cri,RedirectAttributes rd) throws IllegalStateException, IOException {
		//System.out.println("기존파일명 : "+vo.getFilename());
		int cnt = 0;
		
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			String savedFilename = UUID.randomUUID() + "-" + multipartFile.getOriginalFilename();
			if(multipartFile.getSize()>0) {
				File filename = new File(imgPath, savedFilename);
	
				try {
					multipartFile.transferTo(filename);
					cnt++;
					if (cnt == 1) {
					vo.setPimg1(savedFilename);
					} else if (cnt == 2) {
						vo.setPimg2(savedFilename);
					}
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
			}
		} // end for
		//DB에 저장하기
		vo.setPsavimg(imgPath);
		service.updateProduct(vo);
//		if(vo.getFilename().equals(""))vo.setFilename(null);
//		if(!uploadFile.isEmpty()) {//서버에 저장 작업
//			String filename=uploadFile.getOriginalFilename();
//			//System.out.println("수정 파일명 : "+filename);
//			//서버에 저장
//			UUID uuid=UUID.randomUUID();
//			String saveFilename=uuid+"-"+filename;
//			uploadFile.transferTo(new File(imgPath+saveFilename));
//			//기존파일이 있는지 확인 - 있으면 기존 파일 삭제하기
//			if(vo.getFilename()!=null) {
//				File file=new File(imgPath+vo.getFilename());
//				if(file.exists())
//					file.delete();
//			}
//			//저장된 파일명을 vo 에 담는다
//			vo.setFilename(saveFilename);
//		}
		
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
