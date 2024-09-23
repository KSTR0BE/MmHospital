package kr.or.ddit.comm.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.http.Part;

import kr.or.ddit.comm.dao.AtchFileDaoImpl;
import kr.or.ddit.comm.dao.IAtchFileDao;
import kr.or.ddit.comm.vo.AtchFileDetailVO;
import kr.or.ddit.comm.vo.AtchFileVO;

public class AtchFileServiceImpl implements IAtchFileService{
	private static final String UPLOAD_DIR = "upload_files";
	
	private IAtchFileDao fileDao;
	
	private static IAtchFileService fileService = new AtchFileServiceImpl();
	
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		return fileService;
	}

	@Override
	public AtchFileVO saveAtchFileList(Collection<Part> parts) {
		String uploadPath = "D:\\A_TeachingMaterial\\04_MiddelProject\\workspace\\MmHospital\\WebContent\\" + UPLOAD_DIR;
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		AtchFileVO atchFileVO = null;
		
		boolean isFirstFile = true; // 첫번째 업로드 파일 여부
		
		for(Part part : parts) {
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.contentEquals("")) {
				if(isFirstFile) {
					// 첫번째 파일인 경우
					isFirstFile = false;
					
					// 파일 기본경로 저장하기
					atchFileVO = new AtchFileVO();
					fileDao.insertAtchFile(atchFileVO);
				}
				String orignFileName = fileName; // 원본 파일명
				long fileSize = part.getSize(); // 파일 크기
				String saveFileName = ""; // 저장파일명
				String saveFilePath = ""; // 저장파일경로
				
				saveFileName = UUID.randomUUID().toString()
							.replace("-", "");
				
				saveFilePath = uploadPath + "/" + saveFileName;
				
				try {
					part.write(saveFilePath); // 업로드 처리
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				// 확장명 추출
				String fileExtension = orignFileName.lastIndexOf(".") < 0 ?
									"" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
				
				AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
				atchFileDetailVO.setAtchFileId(atchFileVO.getAtchFileId());
				atchFileDetailVO.setStreFileNm(saveFileName);
				atchFileDetailVO.setFileSize(fileSize);
				atchFileDetailVO.setOrignlFileNm(orignFileName);
				atchFileDetailVO.setFileStreCours(saveFilePath);
				atchFileDetailVO.setFileExtsn(fileExtension);
				
				fileDao.insertAtchFileDetail(atchFileDetailVO);
				
				try {
					part.delete(); // 임시 업로드 파일 삭제하기
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		return atchFileVO;
	}

	@Override
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO) {
		return fileDao.getAtchFile(atchFileVO);
	}

	@Override
	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileDetailVO) {
		return fileDao.getAtchFileDetail(atchFileDetailVO);
	}
	
	
}
