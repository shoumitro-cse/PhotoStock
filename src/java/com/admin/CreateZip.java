package com.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 *
 * @author shoumitro
 */
public class CreateZip {
   

    public static void main(String args[]) {

        //get user_id from request
        int user_id = 1102;
        String extension = ".jpg";
        String image_dir = "/home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/image/";
        
        // picture url that is store in database
        String picture_url = "images/image/"+"image_"+user_id+extension;
        //System.out.println(picture_url);
        
        String[] fileNames = {"image_"+user_id+extension};
        String zipFileName = "image_"+user_id;
        String cwd_path = image_dir+user_id;
        
        CreateZip.createZipFile(fileNames, zipFileName, cwd_path);

    }

    public static void createZipFile(String[] fileNamesArray, String zipFileName, String cwd_path) {
        try {
            // set working dir
            System.setProperty("user.dir", cwd_path);
            System.out.println("Current working dir : " + System.getProperty("user.dir"));

            // let's create a ZIP file to write data
            FileOutputStream fos = new FileOutputStream(cwd_path + "/"+zipFileName+".zip");
            ZipOutputStream zipOS = new ZipOutputStream(fos);


            for (int i = 0; i < fileNamesArray.length; i++) {
                CreateZip.writeToZipFile(fileNamesArray[i], zipOS);
            }

            zipOS.close();
            fos.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void writeToZipFile(String path, ZipOutputStream zipStream)
            throws FileNotFoundException, IOException {

        System.out.println("Writing file : '" + path + "' to zip file");

        File aFile = new File(path);
        FileInputStream fis = new FileInputStream(aFile.getAbsolutePath());
        ZipEntry zipEntry = new ZipEntry(path);
        zipStream.putNextEntry(zipEntry);

        byte[] bytes = new byte[1024];
        int length;
        while ((length = fis.read(bytes)) >= 0) {
            zipStream.write(bytes, 0, length);
        }

        zipStream.closeEntry();
        fis.close();
    } 
}
