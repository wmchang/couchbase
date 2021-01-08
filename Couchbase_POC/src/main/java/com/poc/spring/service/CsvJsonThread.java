package com.poc.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.web.multipart.MultipartFile;

import com.couchbase.client.java.Bucket;
import com.couchbase.client.java.document.StringDocument;
import com.couchbase.client.java.document.json.JsonObject;
import com.couchbase.client.java.query.N1qlQuery;
import com.couchbase.client.java.query.N1qlQueryResult;
import com.couchbase.client.java.query.N1qlQueryRow;
import com.fasterxml.jackson.databind.MappingIterator;

public class CsvJsonThread extends Thread  {

	static Bucket bucket;
	static MultipartFile multipartFile;
	static String strFilePath;
	static String docID;
	static MappingIterator<JsonObject> it;
	static String strExtention;
	int a = 0;
	int sumLine=0;
	

	public CsvJsonThread(Bucket bucket, String docID, MappingIterator<JsonObject> it, String strExtention) {

		this.bucket = bucket;
		this.docID = docID;
		this.it = it;
		this.strExtention = strExtention;
	}
	
//	Callable<Integer> threadCallable = new Callable<Integer>() {

		public Integer call() throws Exception {
			int a = 0;
			int sumLine = 0;
			try {
                String threadName = Thread.currentThread().getName(); 

//				synchronized (it) { // it synchronized.

					while (it.hasNext()) {
						int temp;
						List<Object> result = new ArrayList<Object>();

						result.add(it.next());
						a++;
						temp = a;

						JsonObject jsonObj = JsonObject.create();	// JsonObject
						jsonObj.put("jsonObject", result);

						// insert
						StringDocument doc = StringDocument.create(docID, jsonObj.getArray("jsonObject").get(0).toString());
						System.out.println(doc);
						bucket.insert(doc);

						System.out.println(threadName);
						sumLine = sumLine + 1;
						System.out.println(sumLine);
					}

					a = 0;

//				}


			} catch (Exception e) {
				e.printStackTrace();
			}

			return sumLine;
		}
		
//	};
	
	
	void threadCsvJson() throws NoSuchElementException {

		try {
            String threadName = Thread.currentThread().getName(); 
			synchronized (it) { // it synchronized.

				while (it.hasNext()) {
					List<Object> result = new ArrayList<Object>();
					result.add(it.next());
					

					int temp;
					a++;
					temp = a;
					
					JsonObject jsonObj = JsonObject.create();	// JsonObject
					jsonObj.put("jsonObject", result);

					// insert		
					StringDocument doc = StringDocument.create(docID, jsonObj.getArray("jsonObject").get(0).toString());
					System.out.println(doc);
					bucket.insert(doc);
					
					
		            System.out.println(threadName);
					sumLine = sumLine + 1;
					System.out.println(sumLine);

					it.wait();
					}

				}


		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void run() {
		threadCsvJson();
	}


}
