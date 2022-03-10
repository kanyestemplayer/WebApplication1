using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public double updateTotal()
        {
            double cost = 0;
            cost = double.Parse(RadioButtonList1.SelectedValue);
            cost += double.Parse(RadioButtonList2.SelectedValue);
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    cost += double.Parse(CheckBoxList1.Items[i].Value);
                }
            }
            return cost;
            
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = updateTotal().ToString();
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = updateTotal().ToString();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = updateTotal().ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Database1Entities boob = new Database1Entities();

            var orders = boob.orders;

            var NewOrDer = new order();
            NewOrDer.pizzaSize = byte.Parse(RadioButtonList1.SelectedValue);
            NewOrDer.crustType = byte.Parse(RadioButtonList1.SelectedIndex.ToString());
            NewOrDer.sausage = Convert.ToByte(CheckBoxList1.Items[0].Selected);
            NewOrDer.peperoni = Convert.ToByte(CheckBoxList1.Items[1].Selected);
            NewOrDer.onions = Convert.ToByte(CheckBoxList1.Items[2].Selected);
            NewOrDer.peppers = Convert.ToByte(CheckBoxList1.Items[3].Selected);
            NewOrDer.name = TextBox1.Text;
            NewOrDer.address1 = TextBox4.Text;
            NewOrDer.address2 = TextBox5.Text;
            NewOrDer.town = TextBox6.Text;
            NewOrDer.postcode = TextBox7.Text;
            NewOrDer.phone = TextBox8.Text;
            NewOrDer.extra = TextBox3.Text;
            NewOrDer.cost = Convert.ToDecimal(updateTotal());

            orders.Add(NewOrDer);
            boob.SaveChanges();
            GridView1.DataBind();




        }
    }
}