package com.util;


import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JsonUtil {

    public static String bean2json(Object bean) {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
                //.serializeNulls().setPrettyPrinting()
                .create();
        return gson.toJson(bean);
    }

    @SuppressWarnings("unchecked")
    public static <T> T json2bean(String json, Type type) {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        return (T) gson.fromJson(json, type);
    }

    public static String getJsonValue(String jsonText, String jsonKey) {
        JsonElement jsonElement = new JsonParser().parse(jsonText);
        JsonObject jsonObject = jsonElement.getAsJsonObject();
        return jsonObject.get(jsonKey).getAsString();
    }

    public static void main(String[] args) {
        List<Long> categoryIds = new ArrayList<Long>();
        categoryIds.add(1000000000L);
        categoryIds.add(1000000001L);
        String json = JsonUtil.bean2json(categoryIds);
        System.out.println("json--->: " + json);
        System.out.println("---------------------------------");
    }
}
