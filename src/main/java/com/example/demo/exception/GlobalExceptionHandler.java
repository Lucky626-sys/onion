//@ControllerAdvice 和 @ExceptionHandler 提供了一種統一處理異常的方法
//Exception.class指的是捕獲所有類型為 Exception 的異常
//Exception.class 用來告訴 Spring 當出現任何 Exception 類型的異常時，都會執行 handleException() 方法
//e.getClass().getSimpleName() -> e 是異常物件本身 -> e.getClass() 會返回這個異常物件的類型 -> getSimpleName() 會返回這個類型的簡單名稱
package com.example.demo.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.example.demo.response.ApiResponse;

// 利用 @ControllerAdvice 的特性來處理全局錯誤
@ControllerAdvice
public class GlobalExceptionHandler {
	
	// 當系統發生例外錯誤
	@ExceptionHandler(Exception.class)
	public ResponseEntity<ApiResponse<Object>> handleException(Exception e) {
		// MethodArgumentTypeMismatchException
		// NoResourceFoundException
		String errorMessage = e.toString();
		switch (e.getClass().getSimpleName()) {
			case "MethodArgumentTypeMismatchException": 
				errorMessage = "參數錯誤(" + e.getClass().getSimpleName() + ")";
				break;
			case "NoResourceFoundException":
				errorMessage = "查無網頁(" + e.getClass().getSimpleName() + ")";
				break;
		}	
		ApiResponse<Object> apiResponse = ApiResponse.error(errorMessage);
		return ResponseEntity.badRequest().body(apiResponse);
	}
}