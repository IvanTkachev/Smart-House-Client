package com.smart_house.client.service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLConnection;
import java.util.Collections;
import java.util.UUID;

public class GoogleDriveAPI {


    /**
     * Application name.
     */
    private static final String APPLICATION_NAME =
            "Drive API Java Quickstart";

    static String myJarPath = GoogleDriveAPI.class.getProtectionDomain().getCodeSource().getLocation().getPath();
    static String dirPath = new java.io.File(myJarPath).getAbsolutePath();

    private static final String CREDENTIALS_FILE_PATH = "/client_secret.json";

    /**
     * Directory to store user credentials for this application.
     */
    private static final java.io.File DATA_STORE_DIR = new java.io.File(dirPath);


    /**
     * Global instance of the {@link FileDataStoreFactory}.
     */
    private static FileDataStoreFactory dataStoreFactory;

    /**
     * Global instance of the JSON factory.
     */
    private static final JsonFactory JSON_FACTORY =
            JacksonFactory.getDefaultInstance();

    /**
     * Global instance of the HTTP transport.
     */
    private static NetHttpTransport httpTransport;

    /**
     * Global instance of the scopes required by this quickstart.
     * If modifying these scopes, delete your previously saved credentials
     * at ~/.credentials/drive-java-quickstart
     */
    private static final java.util.Collection<String> SCOPES =
            DriveScopes.all();

    static {
        try {
            httpTransport = GoogleNetHttpTransport.newTrustedTransport();
            dataStoreFactory = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * Creates an authorized Credential object.
     *
     * @return an authorized Credential object.
     * @throws IOException
     */
       public static Credential authorize() throws IOException {
            // Load client secrets.
            InputStream in =
                    com.smart_house.client.service.GoogleDriveAPI.class.getResourceAsStream("/client_secret.json");
            GoogleClientSecrets clientSecrets =
                    GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

            // Build flow and trigger user authorization request.
            GoogleAuthorizationCodeFlow flow =
                    new GoogleAuthorizationCodeFlow.Builder(
                            httpTransport, JSON_FACTORY, clientSecrets, SCOPES)
                            .setDataStoreFactory(dataStoreFactory)
                            .setAccessType("offline")
                            .build();
            Credential credential = new AuthorizationCodeInstalledApp(
                    flow, new LocalServerReceiver()).authorize("user");
            System.out.println(
                    "Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
            return credential;
        }

    /**
     * Creates an authorized Credential object.
     * @param HTTP_TRANSPORT The network HTTP Transport.
     * @return An authorized Credential object.
     * @throws IOException If the credentials.json file cannot be found.
     */
    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
        // Load client secrets.
        InputStream in = GoogleDriveAPI.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(DATA_STORE_DIR))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }


    public static String addFileToDrive(MultipartFile multipartFile) throws IOException {

        Drive driveService = new Drive.Builder(httpTransport, JSON_FACTORY, getCredentials(httpTransport))
                .setApplicationName(APPLICATION_NAME)
                .build();
        File fileMetadata = new File();
        String folderId = "1pZQr6MmHCwBUJeqJbaej-zUq91s0S4un"; // folder id at google drive
        fileMetadata.setParents(Collections.singletonList(folderId));
        fileMetadata.setName(UUID.randomUUID().toString());
        java.io.File imageFile = new java.io.File(multipartFile.getOriginalFilename());
        multipartFile.transferTo(imageFile);
        FileContent mediaContent = new FileContent("text/plain", imageFile);
        File file = driveService.files().create(fileMetadata, mediaContent)
                .setFields("id")
                .execute();
        System.out.println("File ID: " + file.getId());
        return file.getId();
    }

}


