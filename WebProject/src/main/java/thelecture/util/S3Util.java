package thelecture.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;

public class S3Util {

	private String accessKey = "AKIAJN42WKX7L4T2XNSQ"; // 엑세스 키
	private String secretKey = "SOLKo7kIOnaOuIZv/D/3TlytdYwbMz8P3+rE7t7m"; // 보안 엑세스 키

	private AmazonS3 conn;

	public S3Util() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		
		conn = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(Regions.AP_NORTHEAST_2) // region
				.build();
	}

	// 버킷 리스트를 가져오는 메서드이다.
	public List<Bucket> getBucketList() {
		return conn.listBuckets();
	}

	// 버킷을 생성하는 메서드이다.
	public Bucket createBucket(String bucketName) {
		return conn.createBucket(bucketName);
	}

	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
	public void createFolder(String bucketName, String folderName) {
		conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	// 파일 업로드
	public void fileUpload(String bucketName, String fileName, byte[] fileData) {

		String filePath = (fileName).replace(File.separatorChar, '/'); 
		// 파일 구별자를 `/`로 설정(\->/) .
		ObjectMetadata metaData = new ObjectMetadata();

		metaData.setContentLength(fileData.length);
		// 메타데이터 설정 -->원래는 128kB까지 업로드 가능했으나 파일크기만큼 버퍼를 설정시켰다.
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData);
		// 파일 넣음

		try {
			conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);
		} catch (AmazonServiceException e) {
			e.printStackTrace();
			
		} finally {
			conn = null;
		}

	}

	public void fileUpload(String bucketName, String uploadedPath, File file) {

		/*
		 * File을 이용한 처리
		 */
		if (conn != null) {
			try {
				PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, uploadedPath, file);

				// file permission
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);

				// upload file
				PutObjectResult ret = conn.putObject(putObjectRequest);
				System.out.println("ret: " + ret.getETag());

			} catch (AmazonServiceException ase) {
				ase.printStackTrace();
			} finally {
				conn = null;
			}
		}

	}

	// 파일 삭제
	public void fileDelete(String bucketName, String fileName) {
		String imgName = (fileName).replace(File.separatorChar, '/');
		conn.deleteObject(bucketName, imgName);
		System.out.println("삭제성공");
	}

	// 파일 URL
	public String getFileURL(String bucketName, String fileName) {
		System.out.println("넘어오는 파일명 : " + fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
	}

}
