/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.util;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import vnpt.media.efinder.model.CustomerInfo;
import vnpt.media.efinder.model.ResponseInfo;

/**
 *
 * @author vnpt2
 */
public class Utils {

    // Thông tin hang
    public static List<CustomerInfo> getCustomerListInSession(HttpServletRequest request) {
        // Thông tin khach hang
        List<CustomerInfo> listCustomers = (List<CustomerInfo>) request.getSession().getAttribute("customerInfo");
        // Tao moi thogn tin khach hang
        if (listCustomers == null) {
            listCustomers = new ArrayList<>();
            // Và lưu vào trong session.
            request.getSession().setAttribute("customerInfo", listCustomers);
        }

        return listCustomers;
    }

    public static void removeCustomerListInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("customerInfo");
    }

    public static String readUrl(String urlString) {
        InputStreamReader isr = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(urlString);
            isr = new InputStreamReader(url.openStream(),
                    "UTF-8");
            reader = new BufferedReader(isr);
            StringBuffer buffer = new StringBuffer();
            int read;
            char[] chars = new char[1024];
            while ((read = reader.read(chars)) != -1) {
                buffer.append(chars, 0, read);
            }
            return buffer.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
                if (isr != null) {
                    isr.close();
                }
            } catch (Exception e) {
            }
        }
    }

    public static <T> List<T> stringToArray(String s, Class<T[]> clazz) {
        JsonObject root = new Gson().fromJson(s, JsonObject.class);
        JsonElement data = root.get("data");
        T[] arr = new Gson().fromJson(data.toString(), clazz);
        return Arrays.asList(arr);
    }

    public static ResponseInfo stringToObjectResponse(String s) {
        Gson gson = new Gson();
        JsonObject root = gson.fromJson(s, JsonObject.class);
        String errorCode = root.get("errorCode").toString();
        String message = root.get("message").toString();
        JsonElement data = root.get("data");

        ResponseInfo responseInfo = new ResponseInfo();
        responseInfo.setData(data.toString());
        responseInfo.setErrorCode(errorCode);
        responseInfo.setMessage(message);
        return responseInfo;
    }

    public static String readUrlPOST(String url, String urlParameters) throws Exception {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setConnectTimeout(20000);

        //add reuqest header
        con.setRequestMethod("POST");
        //con.setRequestProperty("User-Agent", USER_AGENT);
        con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

        // Send post request
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + urlParameters);
        System.out.println("Response Code : " + responseCode);

        Reader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

        StringBuilder sb = new StringBuilder();
        for (int c; (c = in.read()) >= 0;) {
            sb.append((char) c);
        }

        return sb.toString();
    }
    public static void main(String[] args) throws Exception {
        System.out.println(readUrlPOST("http://10.1.36.17:8080/ApiBase/api/info/employee/update?employeeId=29", "name=Trần Hoàng Long&phone=03213&department=fdsf&description=fsd&address=sdfsd&email=tranlongbkhn@gmail.com"));
    }
}
