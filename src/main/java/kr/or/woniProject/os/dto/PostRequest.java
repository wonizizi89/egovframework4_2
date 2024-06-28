package kr.or.woniProject.os.dto;

public class PostRequest {

    final String searchWord;

    final String searchType;


    public PostRequest(String searchWord, String searchType) {
        this.searchWord = searchWord;
        this.searchType = searchType;
    }
}
