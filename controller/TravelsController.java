package com.toyota.project.controller;

import com.toyota.project.dao.ITravelsDao;
import com.toyota.project.data.Travels;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.text.*;
import java.util.List;

import com.toyota.project.config.TravelsAppConfig;


public class TravelsController {
    private AnnotationConfigApplicationContext ctx;

    public void saveTravel(String username, String placeTravel, String purposeGoing, String projectCode, String travelStart, String travelFinish) throws ParseException {
        ctx = new AnnotationConfigApplicationContext();
        ctx.register(TravelsAppConfig.class);
        ctx.refresh();
        ITravelsDao tdao=ctx.getBean(ITravelsDao.class);
        Travels travels=new Travels();
        travels.setUsername(username);
        travels.setPurpose(purposeGoing);
        travels.setStart(travelStart);
        travels.setFinish(travelFinish);
        travels.setProjectCode(projectCode);
        travels.setTravelPlace(placeTravel);
        travels.setCost(0);
        tdao.save(travels);

    }
    public List<Travels> Get(String username){
        ctx = new AnnotationConfigApplicationContext();
        ctx.register(TravelsAppConfig.class);
        ctx.refresh();
        ITravelsDao tdao=ctx.getBean(ITravelsDao.class);
        return tdao.findTravels(username);
    }
    public List<Travels>GetDate(String username, String start, String finish){
        List<Travels> dateList=Get(username);
        List<Travels> dateTable = null;
        for(Travels trv:dateList){
            if(trv.getStart().equals(start)&& trv.getFinish().equals(finish)){
                dateTable.add(trv);
            }
        }
        return dateTable;
    }
    public List<Travels> Get(){
        ctx = new AnnotationConfigApplicationContext();
        ctx.register(TravelsAppConfig.class);
        ctx.refresh();
        ITravelsDao tdao=ctx.getBean(ITravelsDao.class);
        return tdao.findAllTravels();
    }
    public void Delete(String username, int index){
        ctx = new AnnotationConfigApplicationContext();
        ctx.register(TravelsAppConfig.class);
        ctx.refresh();
        ITravelsDao tdao=ctx.getBean(ITravelsDao.class);
        List<Travels> list=tdao.findTravels(username);
        tdao.delete(list.get(index));
    }
    public void Delete(int index){
        ctx = new AnnotationConfigApplicationContext();
        ctx.register(TravelsAppConfig.class);
        ctx.refresh();
        ITravelsDao tdao=ctx.getBean(ITravelsDao.class);
        List<Travels> list=tdao.findAllTravels();
        tdao.delete(list.get(index));
    }
}

