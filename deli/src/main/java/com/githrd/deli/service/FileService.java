package com.githrd.deli.service;

/**
 * @author 	박찬슬
 * @since	2022/06/30
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 					2022/06/30	- 담당자 : 박찬슬
 * 									파일 서비스 클래스 제작
 */

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.* ;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.deli.dao.*;
import com.githrd.deli.util.*;
import com.githrd.deli.vo.*;

public class FileService {
	
	@Autowired
	PcsDao PcDao;
	
	// 단일 파일 업로드 처리함수
	public FileVO uploadProc(MultipartFile file) {
		// 반환값 변수
		FileVO fVO = uploadProc(file, "/upload");
		
		return fVO;
	}
	
	public FileVO uploadProc(MultipartFile file, String dir) {
		/*
			이 함수가 파일을 업로드 하기 위해서는 
			컨트롤러에서 업로드할 파일의 정보를 받아와야 한다.
			
			여러개의 파일중 이 함수에서는 한개의 파일만 처리하도록 하자.
		 */
		
		// 반환값 변수
		FileVO fVO = new FileVO();
		
		// 저장 경로를 기억할 변수
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;
		
		fVO.setDir("/resources" + dir + "/");
		
		// 파일 크기
		long len = file.getSize();
		fVO.setLen(len);
		
		// 파일의 원 이름을 꺼내오고
		String oriname = file.getOriginalFilename();
		if(oriname == null) {
			return fVO;
		}
		
		fVO.setOriname(oriname);
		
		// 저장이름 만들고
		String rename = FileUtil.rename(path, oriname);
		
		fVO.setSavename(rename);
		
		// 파일 업로드하고
		try {
			File f = new File(path, rename);
			
			file.transferTo(f); //  파일 내용 기록...
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return fVO;
	}
	
	// 다중 파일 업로드 기능 처리함수
	public ArrayList<FileVO> uploadProc(MultipartFile[] file){
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		
		for(MultipartFile f : file) {
			list.add(uploadProc(f));
		}
		
		return list;
	}
	@Transactional
	public void se2Upload(FileVO fVO) {
		if(fVO.getFile() != null) {
			// 파일정보테이블에 파일정보들 입력하고(반복)
			ArrayList<FileVO> list = uploadProc(fVO.getFile());
		}
	}
	
	// 데이터베이스 입력작업 전담 처리함수
	@Transactional
	public void addMemberData(PcsVO pcVO) {
		// 할일
		// 게시판 테이블에 데이터 입력하고
		PcDao.addMember(pcVO);
		
		
		System.out.println("############### service mno : " + pcVO.getMno());
		if(pcVO.getFile() != null) {
			// 파일정보테이블에 파일정보들 입력하고(반복)
			ArrayList<FileVO> list = uploadProc(pcVO.getFile());
			// bno를 꺼내서 FileVO들에 채워주고
			for(FileVO f : list) {
				f.setAmno(pcVO.getMno());
				System.out.println("#### service file amno 1 : " + f.getAmno());
			}
			
			// 데이터 입력작업을 파일 갯수만큼 반복해준다.\
			for(FileVO f : list) {
				System.out.println("#### service file amno 2 : " + f.getAmno());
				PcDao.addProfile(f);
			}
		}
	}
	
	
	// 회원정보 수정 데이터베이스 작업 처리함수
	@Transactional
	public void editMemberData(PcsVO pcVO) {
		// 회원정보 수정
		if(pcVO.getPw() != null || pcVO.getMail() != null || 
				pcVO.getTel() != null || pcVO.getAddr() != null) {
			PcDao.editMember(pcVO);
		}
		// 파일정보테이블에 파일정보들 입력하고(반복)
		if(pcVO.getFile() != null) {
			ArrayList<FileVO> list = uploadProc(pcVO.getFile());
			// bno를 꺼내서 FileVO들에 채워주고
			for(FileVO f : list) {
				f.setAmno(pcVO.getMno());
			}
	
			// 데이터 입력작업을 파일 갯수만큼 반복해준다.\
			for(FileVO f : list) {
				PcDao.editProfile(f);
			}
		}
	}

}