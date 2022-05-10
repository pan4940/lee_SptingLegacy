package file.bean;

import lombok.Data;

@Data
public class FileDTO {
	private int id;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int linked_num;
}
