package com.bruncheers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import jakarta.annotation.PostConstruct;

@Component
@Log4j2
@RequiredArgsConstructor
public class CustomFileUtil {
	@Value("${org.zerock.upload.path}")
	private String uploadPath;

	/*	@PostConstruct
		public void init() {
			File tempFolder = new File(uploadPath);
			if (tempFolder.exists() == false) {
				tempFolder.mkdir();
			}
			uploadPath = tempFolder.getAbsolutePath();
			log.info("-------------------------------------");
			log.info(uploadPath);
		}
	*/
	// 파일 저장
	public List<String> saveFiles(List<MultipartFile> files) throws RuntimeException {
		if (files == null || files.size() == 0) {
			System.out.println(files.size());
			return null;
		}
		List<String> uploadNames = new ArrayList<>();

		for (MultipartFile multipartFile : files) {
			String savedName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
			Path savePath = Paths.get(uploadPath, savedName);
			try {
				Files.copy(multipartFile.getInputStream(), savePath);
				String contentType = multipartFile.getContentType();
				if (contentType != null && contentType.startsWith("image")) { // 이미지여부 확인
					// 썸네일용 사진
					Path thumbnailPath = Paths.get(uploadPath, "s_" + savedName);
					Thumbnails.of(savePath.toFile()).size(500, 500).toFile(thumbnailPath.toFile());
				}
				uploadNames.add(savedName);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end for
		return uploadNames;
	}

	// 파일 하나 저장
	public String saveFile(MultipartFile file) throws RuntimeException {
		if (file == null || file.isEmpty()) {
			return null;
		}
		String savedName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		Path savePath = Paths.get(uploadPath, savedName);
		try {
			Files.copy(file.getInputStream(), savePath);
			String contentType = file.getContentType();
			if (contentType != null && contentType.startsWith("image")) { // 이미지여부 확인
				// 썸네일용 사진
				Path thumbnailPath = Paths.get(uploadPath, "s_" + savedName);
				Thumbnails.of(savePath.toFile()).size(500, 500).toFile(thumbnailPath.toFile());
			}
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return savedName;

	}

	// 파일 조회
	public ResponseEntity<Resource> getFile(String fileName) {
		Resource resource = new FileSystemResource(uploadPath + File.separator + fileName);
		System.out.println("경로 확인" + resource);
		if (!resource.exists()) {
			// 파일이 존재하지 않을경우 보낼 사진
			resource = new FileSystemResource(uploadPath + File.separator + "noImage.png");
		}
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(resource.getFile().toPath()));
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
		return ResponseEntity.ok().headers(headers).body(resource);
	}

	// 파일 삭제
	public void deleteFiles(List<String> fileNames) {
		if (fileNames == null || fileNames.size() == 0) {
			return;
		}
		fileNames.forEach(fileName -> {
			// 썸네일이 있는지 확인하고 삭제
			String thumbnailFileName = "s_" + fileName;
			Path thumbnailPath = Paths.get(uploadPath, thumbnailFileName);
			Path filePath = Paths.get(uploadPath, fileName);
			try {
				Files.deleteIfExists(filePath);
				Files.deleteIfExists(thumbnailPath);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage());
			}
		});
	}
}
