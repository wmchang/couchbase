package com.poc.spring.service;


import java.time.LocalDateTime;

import org.apache.commons.lang3.RandomStringUtils;

import com.couchbase.client.java.Bucket;
import com.couchbase.client.java.document.StringDocument;

public class CouchbaseThread implements Runnable{
	  int docSize;
      int docCount;
      int docIdSize;
      Bucket bucket;
      
    public CouchbaseThread(int docSize,int docCount, int docIdSize, Bucket bucket) {
    	this.docSize = docSize;
    	this.docCount = docCount;
    	this.docIdSize = docIdSize;
    	this.bucket = bucket;
    	
    }
    
    public synchronized void run() {
        try {
        	while (docCount > 0) {
        		
        		if(docCount == 1) {
        			System.out.println("완료");
        		}
        		--docCount;
        		StringDocument ddoc = StringDocument.create(RandomStringUtils.randomAlphanumeric(docIdSize), "{\"a\":\"" + RandomStringUtils.randomAlphanumeric(docSize) + "\"}");
    			bucket.upsert(ddoc);
        	}
        }catch(Exception e) {

        }
    }
}
