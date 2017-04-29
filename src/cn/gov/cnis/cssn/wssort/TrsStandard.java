package cn.gov.cnis.cssn.wssort;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;


public class TrsStandard
	implements Serializable {
	
    private String id;     // ���
    private String a000;   // ��¼״̬
	private String a001;   // ��¼��ʶ��
	private String a003;   // ��¼����
	private String a010;   // ISBN����ͳһ���
	private String a011;   // ISSN����ͳһ�ڿ�
	private String a100;   // ���׺�
	private String a101;   // �������������
	private String a102;   // ��������浥λ
	private String a103;   // �汾
	private String a200;   // ����״̬
	private String a203;   // ���÷�Χ
	private String a205;   // ʵʩ����������
	private String a206;   // ��ֹ����
	private String a207;   // ȷ������
	private String a208;   // ԭ�����
	private String a209;   // ����������
	private String a210;   // ��ֹ����
	private String a298;   // ��������
	private String a300;   // ��������
	private String a301;   // ԭ������
	private String a302;   // Ӣ������
	private String a305;   // ������̬
	private String a309;   // ����
	private String a310;   // �۸�
	private String a311;   // ��������
	private String a330;   // ��ժ
	private String a404;   // ʮ�����෨�����
	private String a409;   // ��ע
	private String a448;   // ���׳���
	private String a461;   // ��������
	private String a462;   // ����������
	private String a502;   // ��������
	private String a505;   // �йط���
	private String a800;   // ���ù�ϵ
	private String a805;   // �ڶ����׺�
	private String a820;   // �޸ļ�
	private String a821;   // ���޸ļ�
	private String a823;   // �����
	private String a824;   // �������
	private String a825;   // �й���׼�����
    private String a835;   // ���ʱ�׼�����
	private String a836;   // ���������
	private String a837;   // Ӣ�������
	private String a838;   // ԭ�������
	private String a842;   // �������
	private String a845;   // ��ȡ��
	private String a846;   // �ݲر�־
	private String a847;   // ������
	private String a850;   // ��׼����
	private String a855;   // ��׼ˮƽ
	private String a860;   // ��������
	private String a861;   // ���ں�
	private String a863;   // ���״���
	private String a864;   // ��������
	private String a885;   // ����
	private String hasElec;   // �Ƿ��е����ĵ�(��:1)
	
	private String pagenum;   // ASTMҳ��
	private String filename;   // �����ĵ���
	private String C001;   //ͨѶ��ʾ
	private String C005; //�ļ���
	private String C006; //����
	private String language;  //����
	private int C004;     //�ļ���С
	private String updateType; //��������
	private String C002;         //����
	private Date updateTime;   //����ʱ��
	private Float C003;   //����
	
	
	
	
	
	
	private ElecInfo[] eleclist;
	
	

	public TrsStandard() {
	}


	private void readObject(ObjectInputStream ois) throws IOException,
		ClassNotFoundException {
		ois.defaultReadObject();
	}

	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.defaultWriteObject();
	}

	public void setA000(String a000) {
		this.a000 = a000;
	}

	public void setA001(String a001) {
		this.a001 = a001;
	}

	public void setA003(String a003) {
		this.a003 = a003;
	}

	public void setA010(String a010) {
		this.a010 = a010;
	}

	public void setA011(String a011) {
		this.a011 = a011;
	}

	public void setA100(String a100) {
		this.a100 = a100;
	}

	public void setA101(String a101) {
		this.a101 = a101;
	}

	public void setA102(String a102) {
		this.a102 = a102;
	}

	public void setA103(String a103) {
		this.a103 = a103;
	}

	public void setA200(String a200) {
		this.a200 = a200;
	}

	public void setA203(String a203) {
		this.a203 = a203;
	}

	public void setA205(String a205) {
		this.a205 = a205;
	}

	public void setA206(String a206) {
		this.a206 = a206;
	}

	public void setA207(String a207) {
		this.a207 = a207;
	}

	public void setA208(String a208) {
		this.a208 = a208;
	}

	public void setA209(String a209) {
		this.a209 = a209;
	}

	public void setA210(String a210) {
		this.a210 = a210;
	}

	public void setA298(String a298) {
		this.a298 = a298;
	}

	public void setA300(String a300) {
		this.a300 = a300;
	}

	public void setA301(String a301) {
		this.a301 = a301;
	}

	public void setA302(String a302) {
		this.a302 = a302;
	}

	public void setA305(String a305) {
		this.a305 = a305;
	}

	public void setA309(String a309) {
		this.a309 = a309;
	}

	public void setA310(String a310) {
		this.a310 = a310;
	}

	public void setA311(String a311) {
		this.a311 = a311;
	}

	public void setA330(String a330) {
		this.a330 = a330;
	}

	public void setA404(String a404) {
		this.a404 = a404;
	}

	public void setA409(String a409) {
		this.a409 = a409;
	}

	public void setA448(String a448) {
		this.a448 = a448;
	}

	public void setA461(String a461) {
		this.a461 = a461;
	}

	public void setA462(String a462) {
		this.a462 = a462;
	}

	public void setA502(String a502) {
		this.a502 = a502;
	}

	public void setA505(String a505) {
		this.a505 = a505;
	}

	public void setA800(String a800) {
		this.a800 = a800;
	}

	public void setA805(String a805) {
		this.a805 = a805;
	}

	public void setA820(String a820) {
		this.a820 = a820;
	}

	public void setA821(String a821) {
		this.a821 = a821;
	}

	public void setA823(String a823) {
		this.a823 = a823;
	}

	public void setA824(String a824) {
		this.a824 = a824;
	}

	public void setA825(String a825) {
		this.a825 = a825;
	}

	public void setA836(String a836) {
		this.a836 = a836;
	}

	public void setA837(String a837) {
		this.a837 = a837;
	}

	public void setA838(String a838) {
		this.a838 = a838;
	}

	public void setA842(String a842) {
		this.a842 = a842;
	}

	public void setA845(String a845) {
		this.a845 = a845;
	}

	public void setA846(String a846) {
		this.a846 = a846;
	}

	public void setA847(String a847) {
		this.a847 = a847;
	}

	public void setA850(String a850) {
		this.a850 = a850;
	}

	public void setA855(String a855) {
		this.a855 = a855;
	}

	public void setA860(String a860) {
		this.a860 = a860;
	}

	public void setA861(String a861) {
		this.a861 = a861;
	}

	public void setA863(String a863) {
		this.a863 = a863;
	}

	public void setA864(String a864) {
		this.a864 = a864;
	}

	public void setA835(String a835) {
		this.a835 = a835;
	}

	public void setA885(String a885) {
		this.a885 = a885;
	}

	public void setHasElec(String hasElec) {
		this.hasElec = hasElec;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getA000() {
		return a000;
	}

	public String getA001() {
		return a001;
	}

	public String getA003() {
		return a003;
	}

	public String getA010() {
		return a010;
	}

	public String getA011() {
		return a011;
	}

	public String getA100() {
		return a100;
	}

	public String getA101() {
		return a101;
	}

	public String getA102() {
		return a102;
	}

	public String getA103() {
		return a103;
	}

	public String getA200() {
		return a200;
	}

	public String getA203() {
		return a203;
	}

	public String getA205() {
		return a205;
	}

	public String getA206() {
		return a206;
	}

	public String getA207() {
		return a207;
	}

	public String getA208() {
		return a208;
	}

	public String getA209() {
		return a209;
	}

	public String getA210() {
		return a210;
	}

	public String getA298() {
		return a298;
	}

	public String getA300() {
		return a300;
	}

	public String getA301() {
		return a301;
	}

	public String getA302() {
		return a302;
	}

	public String getA305() {
		return a305;
	}

	public String getA309() {
		return a309;
	}

	public String getA310() {
		return a310;
	}

	public String getA311() {
		return a311;
	}

	public String getA330() {
		return a330;
	}

	public String getA404() {
		return a404;
	}

	public String getA409() {
		return a409;
	}

	public String getA448() {
		return a448;
	}

	public String getA461() {
		return a461;
	}

	public String getA462() {
		return a462;
	}

	public String getA502() {
		return a502;
	}

	public String getA505() {
		return a505;
	}

	public String getA800() {
		return a800;
	}

	public String getA805() {
		return a805;
	}

	public String getA820() {
		return a820;
	}

	public String getA821() {
		return a821;
	}

	public String getA823() {
		return a823;
	}

	public String getA824() {
		return a824;
	}

	public String getA825() {
		return a825;
	}

	public String getA836() {
		return a836;
	}

	public String getA837() {
		return a837;
	}

	public String getA838() {
		return a838;
	}

	public String getA842() {
		return a842;
	}

	public String getA845() {
		return a845;
	}

	public String getA846() {
		return a846;
	}

	public String getA847() {
		return a847;
	}

	public String getA850() {
		return a850;
	}

	public String getA855() {
		return a855;
	}

	public String getA860() {
		return a860;
	}

	public String getA861() {
		return a861;
	}

	public String getA863() {
		return a863;
	}

	public String getA864() {
		return a864;
	}

	public String getA835() {
		return a835;
	}

	public String getA885() {
		return a885;
	}

	public String getHasElec() {
		return hasElec;
	}

	public String getId() {
		return id;
	}
	
	public ElecInfo[] getEleclist() {
		return eleclist;
	}

	public void setEleclist(ElecInfo[] eleclist) { 
		this.eleclist = eleclist;
	}


	public String getPagenum() {
		return pagenum;
	}


	public void setPagenum(String pagenum) {
		this.pagenum = pagenum;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getC001() {
		return C001;
	}


	public void setC001(String c001) {
		C001 = c001;
	}


	

	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}



	public String getUpdateType() {
		return updateType;
	}


	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}


	public String getC005() {
		return C005;
	}


	public void setC005(String c005) {
		C005 = c005;
	}


	public String getC006() {
		return C006;
	}


	public void setC006(String c006) {
		C006 = c006;
	}


	public int getC004() {
		return C004;
	}


	public void setC004(int c004) {
		C004 = c004;
	}


	public String getC002() {
		return C002;
	}


	public void setC002(String c002) {
		C002 = c002;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Float getC003() {
		return C003;
	}


	public void setC003(Float c003) {
		C003 = c003;
	}


	

}
