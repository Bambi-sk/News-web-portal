package kz.csse.db;

import java.sql.*;
import java.time.ZoneId;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/task4?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC","root","");

        }
        catch (Exception e ){
            e.printStackTrace();

        }
    }
    public static boolean addPublication(Publication publication){
        int rows=0;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "INSERT INTO publications(publ_id,publ_name , publ_descr , rating ) "+
                    "VALUES (NULL ,?,?,?)"+ "");
            statement.setString(1,publication.getName());
            statement.setString(2,publication.getDescription());
            statement.setDouble(3,publication.getRating());
            rows=statement.executeUpdate();
            statement.close();


        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows>0;
    }
    public static News  getNews(Long id )throws Exception{
        String query = "select * from news where n_id = ?";
        try{
            PreparedStatement prt = connection.prepareStatement(query);
            News news=null;
            prt.setLong(1, id);
            ResultSet resultSet = prt.executeQuery();

            while (resultSet.next()){
                news=new News(
                        resultSet.getLong("n_id"),
                        resultSet.getString("n_title"),
                        resultSet.getString("n_scontent"),
                        resultSet.getString("n_content"),
                        resultSet.getDate("post_date"),
                        resultSet.getString("picture_url"),
                        getLanguage(resultSet.getLong("lan_id")),
                        getPublication(resultSet.getLong("publ_id")));
            }

            return news;

        }catch (Exception e){
            throw e;
        }
    }
    public static ArrayList<Publication> getAllPublication(){
        ArrayList<Publication> publications=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT publ_id, publ_name, publ_descr, rating "+
                    "FROM publications"+"");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                publications.add(new Publication(resultSet.getLong("publ_id"),
                        resultSet.getString("publ_name"),
                        resultSet.getString("publ_descr"),
                        resultSet.getByte("rating")));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return publications;
    }
    public static ArrayList<Language> getAllLanguage(){
        ArrayList<Language> languages=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT lan_id, lan_name, lan_code  "+
                    "FROM languages "+"");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                languages.add(new Language(resultSet.getLong("lan_id"),
                        resultSet.getString("lan_name"),
                        resultSet.getString("lan_code")));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return languages;
    }
    public static Language getLanguage(Long id){
        Language language=null;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT lan_id, lan_name, lan_code   "+
                    "FROM languages where lan_id=? "+"");
            statement.setLong(1,id);
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                language=new Language(resultSet.getLong("lan_id"),
                        resultSet.getString("lan_name"),
                        resultSet.getString("lan_code"));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return language;
    }
    public static Publication getPublication(Long id){
        Publication publication=null;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT publ_id, publ_name, publ_descr, rating " +
                    "FROM publications where publ_id=? "+"");
            statement.setLong(1,id);
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                publication=new Publication(resultSet.getLong("publ_id"),
                        resultSet.getString("publ_name"),
                        resultSet.getString("publ_descr"),
                        resultSet.getDouble("rating"));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return publication;
    }
    public  static boolean addLanguages(Language language){
        int rows=0;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "INSERT INTO languages(lan_id, lan_name , lan_code ) "+
                    "VALUES (NULL ,?,?)"+ "");
            statement.setString(1,language.getName());
            statement.setString(2,language.getCode());
            rows=statement.executeUpdate();
            statement.close();


        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows>0;
    }
    public static User getUser(Long id){
        User user=null;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT user_id, email, password_user , user_name " +
                    "FROM admin_user where user_id=? "+"");
            statement.setLong(1,id);
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                user=new User(resultSet.getLong("user_id"),
                        resultSet.getString("email"),
                        resultSet.getString("password_user"),
                        resultSet.getString("user_name"));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return user;

    }
    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users=new ArrayList<>();
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "SELECT user_id, email, password_user,user_name  "+
                    "FROM admin_user "+"");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                users.add(new User(resultSet.getLong("user_id"),
                        resultSet.getString("email"),
                        resultSet.getString("password_user"),
                        resultSet.getString("user_name")));

            }
            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }
    public static ArrayList<News> getAllNews(){
        ArrayList<News> news = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.n_id, n.n_title, n.n_scontent, n.n_content, n.post_date, n.picture_url, n.lan_id as languageId , l.lan_name as languageName, l.lan_code as languageCode , n.publ_id as publicationId , p.publ_name as publicationName, p.publ_descr as publicationDescription, p.rating as publicationRating " +
                    "FROM News n " +
                    "INNER JOIN Languages l ON n.lan_id = l.lan_id " +
                    "INNER JOIN Publications p ON n.publ_id = p.publ_id " +
                    " order BY n.post_date DESC");



            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                news.add(new News(
                        resultSet.getLong("n_id"),
                        resultSet.getString("n_title"),
                        resultSet.getString("n_scontent"),
                        resultSet.getString("n_content"),
                        resultSet.getDate("post_date"),
                        resultSet.getString("picture_url"),
                        new Language(
                                resultSet.getLong("languageId"),
                                resultSet.getString("languageName"),
                                resultSet.getString("languageCode")
                        ),
                        new Publication(
                                resultSet.getLong("publicationId"),
                                resultSet.getString("publicationName"),
                                resultSet.getString("publicationDescription"),
                                resultSet.getDouble("publicationRating")
                        )


                ));

            }
            statement.close();

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return news;

    }
    public static void deletePublication(Long id){
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "DELETE FROM publications WHERE publ_id = ? "+"");
            statement.setLong(1,id);
            statement.executeUpdate();

            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }

    }
    public  static void deleteLanguage(Long id){
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "DELETE FROM languages WHERE lan_id = ? "+"");
            statement.setLong(1,id);
            statement.executeUpdate();

            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
    }
    public static boolean saveNews(News news){
        int affectedRows = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE news "+
                    "SET n_title= ?, "+
                    "n_scontent= ?, " +
                    "n_content= ?, " +
                    "picture_url= ?, " +
                    "lan_id= ?," +
                    "publ_id= ? " +
                    " where n_id= ?");

            statement.setString(1,news.getTitle());
            statement.setString(2, news.getShort_content());
            statement.setString(3,news.getContent());
            statement.setString(4,news.getPicture_url());
            statement.setLong(5,news.getLanguage().getId());
            statement.setLong(6,news.getPublication().getId());
            statement.setLong(7,news.getId());

            affectedRows = statement.executeUpdate();

            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return affectedRows>0;
    }
    public static ArrayList<News>  getNewsbyLan(Long id )throws Exception{
        String query = "select * from news where lan_id = ?";
        try{
            PreparedStatement prt = connection.prepareStatement(query);
            ArrayList<News> news = new ArrayList<>();
            prt.setLong(1, id);
            ResultSet resultSet = prt.executeQuery();

            while (resultSet.next()){
                news.add(new News(
                        resultSet.getLong("n_id"),
                        resultSet.getString("n_title"),
                        resultSet.getString("n_scontent"),
                        resultSet.getString("n_content"),
                        resultSet.getDate("post_date"),
                        resultSet.getString("picture_url"),
                        getLanguage(resultSet.getLong("lan_id")),
                        getPublication(resultSet.getLong("publ_id"))));
            }

            return news;

        }catch (Exception e){
            throw e;
        }
    }

    public static boolean authentificate(String username, String password) throws Exception{
        String query = "select * from admin_user where email = ? and password_user = ?";
        try{
            PreparedStatement prt = connection.prepareStatement(query);
            prt.setString(1, username);
            prt.setString(2, password);
            ResultSet resultSet = prt.executeQuery();
            resultSet.next();
            if(resultSet.getRow()!=0){
                return true;
            }
            return false;
        }catch (Exception e){
            throw e;
        }
    }
    public static void deleteNew(Long id) {
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "DELETE FROM news WHERE n_id = ? "+"");
            statement.setLong(1,id);
            statement.executeUpdate();

            statement.close();
        }

        catch (Exception e){
            e.printStackTrace();
        }
    }
    public static boolean addNews(News news){
        int rows=0;
        try {
            PreparedStatement statement=connection.prepareStatement(""+
                    "INSERT INTO news(n_id,n_title,n_scontent,n_content ,post_date,picture_url,lan_id, publ_id) "+
                    "VALUES (NULL ,?,?,?,DEFAULT,?,?,?)"+ "");

            statement.setString(1,news.getTitle());
            statement.setString(2,news.getShort_content());
            statement.setString(3,news.getContent());
            statement.setString(4,news.getPicture_url());
            statement.setLong(5,news.getLanguage().getId());
            statement.setLong(6,news.getPublication().getId());
            rows=statement.executeUpdate();
            statement.close();


        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows>0;
    }

    public static boolean UpdatePublication(Publication publication){
        int affectedRows = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE publications  "+
                    "SET publ_name= ?, "+
                    "publ_descr= ?, "+
                    "rating = ?  "+
                    "WHERE publ_id= ?");



            statement.setString(1,publication.getName());
            statement.setString(2, publication.getDescription());
            statement.setDouble(3, publication.getRating());
            statement.setLong(4,publication.getId());

            affectedRows = statement.executeUpdate();

            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("ID: " + publication.getId());
        System.out.println("UPDATED ROWS :" +affectedRows);

        return affectedRows>0;
    }
    public static boolean UpdateLanguage(Language language){
        int affectedRows = 0;
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE languages "+
                    "SET lan_name= ?, "+
                    "lan_code = ? "+
                    "WHERE lan_id = ?");



            statement.setString(1,language.getName());
            statement.setString(2, language.getCode());
            statement.setLong(3, language.getId());


            affectedRows = statement.executeUpdate();

            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("ID: " + language.getId());
        System.out.println("UPDATED ROWS :" +affectedRows);

        return affectedRows>0;
    }








}
