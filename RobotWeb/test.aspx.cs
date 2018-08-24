using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RobotWeb
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            int[] a =new int[] { 1, 2, 3, 4, 5, 6 };
            var r = from ass in a where ass > 6 select ass;
            Console.Write(r);
            */


            List<person> p_list = new List<person>();

            p_list.Add(new personal("a1", 10));
            p_list.Add(new personal("a2", 12));
            p_list.Add(new personal("a3", 17));
            p_list.Add(new personal("a4", 19));
            p_list.Add(new personal("a5", 21));
            p_list.Add(new personal("a6", 12));
            p_list.Add(new personal("a7", 18));


            var r = from pt in p_list where pt._age>15 select pt;


            Console.Write(r);


        }


        public class person
        {
            
            private string id;
            private int age;
            public string _id { get { return id;} set { id = value; } }
            public int _age { get { return age; } set { age = value; } }
            public person(string i_id,int i_age) { this._id = i_id;this._age = i_age; }
        }

        public class personal:person
        {
            public personal(string i_id,int i_age) : base(i_id, i_age) { }

        }





    }
}