package friendsgram.a.skw.controller;

class ResponseMessage {
    private boolean success;
    private String message;
	public ResponseMessage(boolean b, String string) {
		
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

    // 생성자, getter, setter
}