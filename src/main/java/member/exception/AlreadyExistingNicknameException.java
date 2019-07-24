package member.exception;

public class AlreadyExistingNicknameException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AlreadyExistingNicknameException(String message) {
		super(message);
	}
}
