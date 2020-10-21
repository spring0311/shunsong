package com.shunsong.util.excel;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.shunsong.util.Const;
import com.shunsong.util.PageData;
import com.shunsong.util.PathUtil;
import com.shunsong.util.StringUtil;
import com.shunsong.util.Tools;
/**
* 导入到EXCEL
* 类名称：ObjectExcelView.java
* @author FH Q313596790
* @version 1.0
 */
public class OrderExportExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String dirPath =  PathUtil.getClasspath() + Const.TEMPLETFILEPATH;
		
		//取模板文件
		String fileName="OrderExportTemplate.xls";
		String strTemplateType = (String)model.get("TemplateFile");
		if(StringUtil.isNotNullParam(strTemplateType)){
			fileName = strTemplateType + "OrderExportTemplate.xls"; 
		}
        
        FileInputStream inStream = new FileInputStream(new File(dirPath+fileName));
        //读取excel模板 
        workbook = new HSSFWorkbook(inStream);    //读取excel模板  
        
        //取表头数据
      		
        List<PageData> varList = (List<PageData>) model.get("varList");
		
		PageData pdHead = varList.get(0);		
        
        Date date = new Date();			
		String filename_new = "attachment;filename=" + pdHead.getString("CUSTOMER_ALT") + "报价单" + Tools.date2Str(date, "yyyyMMddHHmmss") + ".xls";
		
		OutputStream out = response.getOutputStream();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition",  new String(filename_new.getBytes("gbk"),"ISO-8859-1"));
					
		//读取了模板内所有sheet内容 
        HSSFSheet sheet = workbook.getSheetAt(0); 
        HSSFCell cell = null;
        		
		
		
		workbook.write(out);
		inStream.close();
        out.flush();
        out.close();
		
	}
		
	

}
