package thelecture.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import thelecture.dao.MemberDaoImpl;
import thelecture.model.LectureBean;
import thelecture.service.BoardService;
import thelecture.service.EtcService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LecturesController2 {

	@Autowired
	MemberDaoImpl memberdao;

	@Autowired
	BoardService boardService;

	@Autowired
	EtcService etcService;

	/**
	 * review detail정보 불러오기 : 1. id에 따라 게시판 정보 불러옴.
	 * 
	 * @param 설명
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "review.do", method = RequestMethod.GET)
	public String review(@RequestParam("lecture_id") int lecture_id, HttpSession session, Model model) {

		// password가 맞으면
		System.out.println("L_id: " + lecture_id);
//		LectureBean lb = etcService.getReviewDetail(lecture_id, model);
		
		LectureBean lb = etcService.getReviewDetail_t(lecture_id,session, model);
		model.addAttribute("lb", lb);//LectureBean 객체
		

		return "review";

	}
	
	/**
	 * 대학 리스트 데이터를 json으로 전달함
	 */
	@RequestMapping("autocomplete_lec.do")
	@ResponseBody
	public List<String> selectLecList() {
		List<String> lec_list = etcService.getLec_list();
		return lec_list;
	}

}
