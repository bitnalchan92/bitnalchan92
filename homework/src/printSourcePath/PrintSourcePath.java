package printSourcePath;

import java.io.File;

public class PrintSourcePath {
    public static void main(String[] args) {
        // 조회할 디렉토리 경로 설정
        String directoryPath = "/Users/chankim/github/bitnalchan92/homework/src";

        // File 객체 생성
        File directory = new File(directoryPath);

        // 디렉토리가 존재하는지 확인
        if (directory.exists() && directory.isDirectory()) {
            listFilesAndFolders(directory);
        } else {
            System.out.println("디렉토리가 존재하지 않거나 유효하지 않습니다.");
        }
    }

    private static void listFilesAndFolders(File dir) {
        File[] files = dir.listFiles();

        if (files == null) return;

        for (File file : files) {
            String filePath = file.getPath();

            String emoji = filePath.lastIndexOf(".") == -1 ? "🗂️ " : "\t\t";
            System.out.println(emoji + filePath);

            File f = new File(filePath);
            listFilesAndFolders(f);
        }
    }
}
