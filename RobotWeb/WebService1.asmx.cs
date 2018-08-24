using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client;

namespace RobotWeb
{
    /// <summary>
    ///WebService1 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {





     //   static string oradb = "Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.60.37)(PORT = 1521))" + "(CONNECT_DATA =" + "(SERVER = DEDICATED)" + "(SERVICE_NAME = robot)));" + "User Id=foxlinkrobot;Password=foxlink;";   //SERVICE_NAME(SID)
    //    static string oracleDASelect1 = "ACCOUNT_TEST";     //資料表名稱
        static string oracleDAstr = "";
        static string tableName = "";
        static string SQLcommand = "";

      





        [WebMethod(enableSession: true)]
        [ScriptMethod]
        public List<Customer> login(string id, string pwd)
        {
            List<Customer> customer_list = new List<Customer>();

            string s = "User Id=foxlinkrobot;Password=foxlink;Data Source=192.168.60.37:1521/robot";   //Data Source格式:IP/SID
            using (OracleConnection con = new OracleConnection())
            {
                con.ConnectionString = s;
                con.Open();


                using (OracleCommand cmd = new OracleCommand("SELECT * FROM ACCOUNT_TEST WHERE ID='"+id+"' AND PWD='"+pwd+"'", con))
                {
                    OracleDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {


                        customer_list.Add(new Customer
                        {

                            name = reader.GetString(0),
                            id = reader.GetString(1),
                            pwd = reader.GetString(2),
                            permission = reader.GetString(3),
                            sign_date = reader.GetValue(4).ToString()           //讀取 oracle timestamp格式
                            
                            

                        });
                        
                    }
                    
                }
                  



            }
      

          
            return customer_list;


        }



    /// <summary>
    /// ///////////////////////////////////////////////////////////////////////////
    /// </summary>



   



    public class Customer
    {
        public string name { get; set; }
        public string id { get; set; }
        public string pwd { get; set; }
        public string permission { get; set; }
        public string sign_date { get; set; }


   

        }



       










        [WebMethod(enableSession: true)]
        [ScriptMethod]
        public List<online_robot_data> get_online_robotData()
        {


            List<online_robot_data> online_robotData_list = new List<online_robot_data>();

            string s = "User Id=foxlinkrobot;Password=foxlink;Data Source=192.168.60.37:1521/robot";   //Data Source格式:IP/SID
            using (OracleConnection con = new OracleConnection())
            {
                con.ConnectionString = s;
                con.Open();


                using (OracleCommand cmd = new OracleCommand("SELECT * FROM ROBOT_INFOS", con))
                {
                    OracleDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {


                        online_robotData_list.Add(new online_robot_data
                        {

                            robot_sn = reader.GetString(0),
                            mac_adderss = reader.GetString(1),
                            bg_code = reader.GetString(2),
                            factory_locate = reader.GetString(3),
                            floor = reader.GetString(4),           //讀取 oracle timestamp格式
                            workshop = reader.GetString(5),
                            product = reader.GetString(6),
                            line_no = reader.GetString(7),
                            is_enable = reader.GetString(8),
                            update_time = reader.GetValue(9).ToString()//,
                        //    show_pic_no = reader.GetString(10)





                        });

                    }

                }




            }








            return online_robotData_list;
        }



        public class online_robot_data
        {
            public string robot_sn { set; get; }
            public string mac_adderss { set; get; }
            public string bg_code { set; get; }
            public string factory_locate { set; get; }
            public string floor { set; get; }
            public string workshop { set; get; }
            public string product { set; get; }
            public string line_no { set; get; }
            public string is_enable { set; get; }
            public string update_time { set; get; }
            public string show_pic_no { set; get; }

        }




        /// <summary>
        ////////////////////////////////////////////HISTROY_轉速//////////////////////////////////////
        /// </summary>
        [WebMethod(enableSession: true)]
        [ScriptMethod]
        public List<search_history_data> search_history(string select,int page,int pageLength)
        {
            int page_size = 10000;        //一次ajax讀取多少筆資料
            string getDataSizeSqlCmd = "";
            string getDataSqlCmd = "";

            if (select == "1")
            {
                getDataSizeSqlCmd = "SELECT COUNT(ROWNUM) FROM ROBOT_INFOS";
                getDataSqlCmd = "SELECT* FROM (SELECT A.*, ROWNUM RN FROM(SELECT * FROM ROBOT_INFOS ORDER BY ROWNUM) A ) WHERE RN BETWEEN ";

            }
            else if (select == "2")
            {
                getDataSizeSqlCmd = "SELECT COUNT(ROWNUM)FROM ROBOT_RPM_INFOS_HISTORY";
                getDataSqlCmd = "SELECT* FROM (SELECT A.*, ROWNUM RN FROM(SELECT * FROM ROBOT_RPM_INFOS_HISTORY ORDER BY ROWNUM) A ) WHERE RN BETWEEN ";
            }
            else if (select == "3")
            {
                getDataSizeSqlCmd = "SELECT * FROM ROBOT_TORQUE_INFOS_HISTORY";
            }
            else if (select == "4")
            {
                getDataSizeSqlCmd = "SELECT * FROM ROBOT_TEMPATURE_INFOS_HISTORY";
            }






            List<search_history_data> sch_data_list = new List<search_history_data>();


            //  string s = "User Id=foxlinkrobot;Password=foxlink;Data Source=192.168.60.37:1521/robot";   //Data Source格式:IP/SID
            connect_sql connect1 = new connect_sql();
            sch_data_list.Clear();
            connect1.get_HistoryData("foxlinkrobot", "foxlink", "192.168.60.37:1521/robot", getDataSizeSqlCmd,getDataSqlCmd, select, page, page_size, pageLength, sch_data_list);



            
            /////////////////////////LinQ//////////////////////////
            //var r = from lt in sch_list where Convert.ToInt64(lt.j1_rpm) > 0 && Convert.ToInt64(lt.j2_rpm) > 0 orderby lt.j1_rpm select lt;
            //  var r = from lt in sch_list orderby lt.j1_rpm select lt;
            //     return r.ToList<search_history_data_buf>();
            return sch_data_list;
        }


        /// <summary>/////////////////////////////////////////////////////////////
        //////////////////////////////在線(Online)手臂資料////////////////////////
        /// </summary>////////////////////////////////////////////////////////////
        /// <param name="select">選:1=在線手臂資料</param>
        /// <param name="page">當下頁數index</param>
        /// <param name="pageLength">一頁顯示多少資料</param>
        /// <returns></returns>
        [WebMethod(enableSession: true)]
        [ScriptMethod]
        public List<online_datas> online_data(string select, int page, int pageLength)
        {
            int page_size = 10000;        //一次ajax讀取多少筆資料
            string getDataSizeSqlCmd = "";
            string getDataSqlCmd = "";
            getDataSizeSqlCmd = "SELECT COUNT(ROWNUM) FROM ROBOT_INFOS";
            getDataSqlCmd = "SELECT* FROM (SELECT A.*, ROWNUM RN FROM(SELECT * FROM ROBOT_INFOS ORDER BY ROWNUM) A ) WHERE RN BETWEEN ";


            List<search_history_data> list1 = new List<search_history_data>();


            //  string s = "User Id=foxlinkrobot;Password=foxlink;Data Source=192.168.60.37:1521/robot";   //Data Source格式:IP/SID
            connect_sql connect1 = new connect_sql();
            list1.Clear();
            list1=connect1.get_HistoryData("foxlinkrobot", "foxlink", "192.168.60.37:1521/robot", getDataSizeSqlCmd, getDataSqlCmd, "1", page, page_size, pageLength, list1);




            /////////////////////////LinQ//////////////////////////
            //  var r = from lt in sch_list orderby lt.j1_rpm select lt;


            List<online_datas> list_online = new List<online_datas>();

            if (select == "1")      //依BG顯示手臂數量
            {
                var r1 = from lt in list1
                            //                       where Convert.ToInt64(lt.j1_rpm) > 0 && Convert.ToInt64(lt.j2_rpm) > 0
                        group lt by lt.bg_code into _lt
                        select new
                        {
                            bg=_lt.Key,
                            qty=_lt.Count()
                        };
                foreach (var l in r1)
                {
                    list_online.Add(new online_datas
                    {
                        _bg=l.bg,
                        _bg_qty=l.qty.ToString(),
                    });
                }
            }
            else if(select == "2")      //依廠區顯示手臂數量
            {
                var r1 = from lt in list1
                             //                       where Convert.ToInt64(lt.j1_rpm) > 0 && Convert.ToInt64(lt.j2_rpm) > 0
                         group lt by lt.factory_locate into _lt
                         select new
                         {
                             factory_locate = _lt.Key,
                             qty = _lt.Count()
                         };
                foreach (var l in r1)
                {
                    list_online.Add(new online_datas
                    {
                        _factory_locate = l.factory_locate,
                        _factory_locate_qty = l.qty.ToString(),
                    });
                }
            }
            else if (select == "3")     //依產品顯示手臂數量
            {
                var r1 = from lt in list1
                             //                       where Convert.ToInt64(lt.j1_rpm) > 0 && Convert.ToInt64(lt.j2_rpm) > 0
                         group lt by lt.product into _lt
                         select new
                         {
                             product = _lt.Key,
                             qty = _lt.Count()
                         };
                foreach (var l in r1)
                {
                    list_online.Add(new online_datas
                    {
                        _product = l.product,
                        _product_qty = l.qty.ToString(),
                    });
                }
            }
            else if (select == "4")     //依廠區樓層顯示手臂數量
            {
                var r1 = from lt in list1
                             //                       where Convert.ToInt64(lt.j1_rpm) > 0 && Convert.ToInt64(lt.j2_rpm) > 0
                         group lt by new { lt.factory_locate,lt.floor} into _lt
                         select new
                         {
                             
                             factory_locate_floor = _lt.Key.factory_locate+"/"+_lt.Key.floor+"樓",
                             qty = _lt.Count()
                         };
                foreach (var l in r1)
                {
                    
                    list_online.Add(new online_datas
                    {
                        _factory_locate_floor = l.factory_locate_floor,
                        _factory_locate_floor_qty = l.qty.ToString()
                       
                        
                        
                    });
                }
            }


            /////  return r.ToList<search_history_data_buf>();


            return list_online;
        }


        public class online_datas
        {
            public string _bg { get; set; }
            public string _bg_qty { get; set; }
            public string _factory_locate { get; set; }
            public string _factory_locate_qty { get; set; }
            public string _product { get; set; }
            public string _product_qty { get; set; }
            public string _factory_locate_floor { get; set; }
            public string _factory_locate_floor_qty { get; set; }
        }

            public class search_history_data
        {
            public string robot_sn { set; get; }
            public string mac_address { set; get; }
            public string create_time { set; get; }
            public string bg_code { set; get; }
            public string factory_locate { set; get; }
            public string floor { set; get; }
            public string workshop { set; get; }
            public string product { set; get; }
            public string line_no { set; get; }
            public string is_enable { set; get; }
            public string update_time { set; get; }
            public string j1_load { set; get; }
            public string j2_load { set; get; }
            public string j3_load { set; get; }
            public string j4_load { set; get; }
            public string j5_load { set; get; }
            public string j6_load { set; get; }
            public string j1_rpm { set; get; }
            public string j2_rpm { set; get; }
            public string j3_rpm { set; get; }
            public string j4_rpm { set; get; }
            public string j5_rpm { set; get; }
            public string j6_rpm { set; get; }
            public string j1_torque { set; get; }
            public string j2_torque { set; get; }
            public string j3_torque { set; get; }
            public string j4_torque { set; get; }
            public string j5_torque { set; get; }
            public string j6_torque { set; get; }
            public string j1_temperature { set; get; }
            public string j2_temperature { set; get; }
            public string j3_temperature { set; get; }
            public string j4_temperature { set; get; }
            public string j5_temperature { set; get; }
            public string j6_temperature { set; get; }

            public string RN { set; get; }
        }








        static int data_size=0;

        public class connect_sql
        {

            


            public List<search_history_data> get_HistoryData(string sql_id,string sql_pwd,string sql_ip,string getDataSizeSqlCmd,string getDataSqlCmd, string select,int _page,int _page_size,int pageLength, List<search_history_data> sch_data_list)
            {
                //  string s = "User Id=foxlinkrobot;Password=foxlink;Data Source=192.168.60.37:1521/robot";   //Data Source格式:IP/SID
                string s = "User Id="+ sql_id+"; Password="+sql_pwd+";Data Source="+sql_ip;   //Data Source格式:IP/SID


                using (OracleConnection con = new OracleConnection())
                {
                    con.ConnectionString = s;
                    con.Open();
                    
                    //////////////先獲取總資料的大小
                    using (OracleCommand cmd = new OracleCommand(getDataSizeSqlCmd, con))      //
                    {
                        data_size = 0;
                      //  OracleDataReader reader = cmd.ExecuteReader();
                        data_size =int.Parse( cmd.ExecuteScalar().ToString());
                        cmd.Dispose();
                    }






                    history_page_dataget history_page_dataget1 = new history_page_dataget();
                    history_page_dataget1.set_data(_page, _page_size, data_size, pageLength);
                    
                 


                    if (_page < history_page_dataget1._total_page || history_page_dataget1._total_page==1)
                    {
                        using (OracleCommand cmd = new OracleCommand(getDataSqlCmd + history_page_dataget1._page_range_start.ToString() + " AND " + history_page_dataget1._page_range_end.ToString(), con))
                        {
                            sch_data_list.Clear();
                            OracleDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {

                                if (select == "1")
                                {
                                    sch_data_list.Add(new search_history_data
                                    {
                                        
                                        robot_sn = reader.GetString(0),
                                        mac_address = reader.GetString(1),
                                        bg_code = reader.GetString(2),
                                        factory_locate = reader.GetString(3),
                                        floor = reader.GetString(4),           //讀取 oracle timestamp格式
                                        workshop = reader.GetString(5),
                                        product = reader.GetString(6),
                                        line_no = reader.GetString(7),
                                        is_enable = reader.GetString(8),
                                        update_time = reader.GetValue(9).ToString()
                                        
                                        /*
                                        ,

                                        j1_load = reader.GetValue(10).ToString(),
                                        j2_load = reader.GetValue(11).ToString(),
                                        j3_load = reader.GetValue(12).ToString(),
                                        j4_load = reader.GetValue(13).ToString(),
                                        j5_load = reader.GetValue(14).ToString(),
                                        j6_load = reader.GetValue(15).ToString(),
                                        j1_rpm = reader.GetValue(16).ToString(),
                                        j2_rpm = reader.GetValue(17).ToString(),
                                        j3_rpm = reader.GetValue(18).ToString(),
                                        j4_rpm = reader.GetValue(19).ToString(),
                                        j5_rpm = reader.GetValue(20).ToString(),
                                        j6_rpm = reader.GetValue(21).ToString(),
                                        j1_torque = reader.GetValue(22).ToString(),
                                        j2_torque = reader.GetValue(23).ToString(),
                                        j3_torque = reader.GetValue(24).ToString(),
                                        j4_torque = reader.GetValue(25).ToString(),
                                        j5_torque = reader.GetValue(26).ToString(),
                                        j6_torque = reader.GetValue(27).ToString()
                                        */
                                    });
                                }

                                if (select == "2")
                                {
                                    sch_data_list.Add(new search_history_data
                                    {
                                        robot_sn = reader.GetString(0),
                                        create_time = reader.GetValue(1).ToString(),
                                        j1_rpm = reader.GetValue(2).ToString(),
                                        j2_rpm = reader.GetValue(3).ToString(),
                                        j3_rpm = reader.GetValue(4).ToString(),
                                        j4_rpm = reader.GetValue(5).ToString(),
                                        j5_rpm = reader.GetValue(6).ToString(),
                                        j6_rpm = reader.GetValue(7).ToString(),
                                        RN = reader.GetValue(8).ToString()
                                    });
                                }


                                if (select == "3")
                                {
                                    sch_data_list.Add(new search_history_data
                                    {
                                        robot_sn = reader.GetString(0),
                                        create_time = reader.GetString(1),
                                        j1_torque = reader.GetValue(2).ToString(),
                                        j2_torque = reader.GetValue(3).ToString(),
                                        j3_torque = reader.GetValue(4).ToString(),
                                        j4_torque = reader.GetValue(5).ToString(),
                                        j5_torque = reader.GetValue(6).ToString(),
                                        j6_torque = reader.GetValue(7).ToString()

                                    });
                                }




                                if (select == "4")
                                {
                                    sch_data_list.Add(new search_history_data
                                    {
                                        robot_sn = reader.GetString(0),
                                        create_time = reader.GetString(1),
                                        j1_temperature = reader.GetValue(2).ToString(),
                                        j2_temperature = reader.GetValue(3).ToString(),
                                        j3_temperature = reader.GetValue(4).ToString(),
                                        j4_temperature = reader.GetValue(5).ToString(),
                                        j5_temperature = reader.GetValue(6).ToString(),
                                        j6_temperature = reader.GetValue(7).ToString()
                                    });
                                }
                            }
                        }
                    }
                }
                return sch_data_list;
            } 


        }




       

        public abstract class history_obj
        {
            
            protected int page_index = 1;
            protected int page_size = 5;
            protected int total_page = 0;
            protected int page_range_start;
            protected int page_range_end;
            protected int total_data_size;


            public int _page_index { get { return page_index; } set { page_index = value; } }
            public int _page_size { get { return page_size; } set { page_size = value; } }
            public int _total_page { get { return total_page; } set { total_page = value; } }
            public int _page_range_start { get { return page_range_start; } set { page_range_start = page_range_end - page_size; } }
            public int _page_range_end { get { return page_range_end; } set { page_range_end = page_index * page_size; } }
            public int _total_data_size { get { return total_data_size; } set { total_data_size=value; } }

            public abstract int proccess_Previous(int page_index);
            public abstract int proccess_Next(int page_index);

        }

        public class history_page_dataget:history_obj
        {
            public void set_data(int input_page_index, int input_page_size, int input_total_data_size, int input_pageLength)
            {
                this._page_index = input_page_index;
                this._page_size = input_page_size;
                this.total_data_size = input_total_data_size;
                this._total_page = this.total_data_size % this._page_size > 0 ? (this.total_data_size / input_pageLength) + 1 : (this.total_data_size / input_pageLength);

                if (this._page_index == this._total_page / (Math.Ceiling((double)this._page_size / (double)input_pageLength)) * (this._page_size / input_pageLength) - (this._page_size / input_pageLength)) { this.page_range_end = this.total_data_size; }
                else { this.page_range_end = ((this._page_index / (this._page_size / input_pageLength)) + 1) * this._page_size; }

                if (this._page_index == 1) { this.page_range_start = 1; this.page_range_end = this._page_size; }
                else { this.page_range_start = ((this.page_range_end - this._page_size) + 1); }
            }

            public override int proccess_Previous(int input_page_index)
            {
                _page_index--;
                return _page_index;
            }
            public override int proccess_Next(int input_page_index)
            {
                _page_index++;
                return _page_index;
            }
            
        }










    }
}























