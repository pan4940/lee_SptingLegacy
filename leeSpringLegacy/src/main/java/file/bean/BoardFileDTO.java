package file.bean;

import lombok.Data;

@Data
public class BoardFileDTO {
	private int boardfile_id;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int board_number;
}
