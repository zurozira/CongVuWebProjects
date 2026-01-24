using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApps.Assets.Pages.projects.COMP235.L1_2
{
    public partial class ShippingCalc : System.Web.UI.Page
    {
        // const stands for constant, it cannot be changed in code
        const double shippingCost = 0.35;
        double shippingTypeFee = 0;
        int quantity = 0;
        int distance = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // if the page is loaded for the first time, NOT A POST BACK
            if (!Page.IsPostBack)
            {
                //
            }
            
            // Reset the label anytime the page load
            lblError.Text = string.Empty;
        }

        protected void DropdownShippingType(object sender, EventArgs e)
        {
            switch (ddnShippingType.SelectedValue)
            {
                case "Ground":
                    lblShippingTypeFee.Text = "$0.00/unit";
                    break;
                case "Priority Ground":
                    lblShippingTypeFee.Text = "$0.05/unit";
                    shippingTypeFee = 0.05;
                    break;
                case "Air":
                    lblShippingTypeFee.Text = "$0.1/unit";
                    shippingTypeFee = 0.1;
                    break;
                default:
                    lblShippingTypeFee.Text = null;
                    break;
            }
        }

        private int CheckInputFormat()
        {
            if (string.IsNullOrEmpty(txtDistance.Text) || string.IsNullOrEmpty(txtQuantity.Text))
            {
                return 1;
            }
            
            try
            {
                quantity = Int32.Parse(txtQuantity.Text);
                distance = Int32.Parse(txtDistance.Text);
            }
            catch (FormatException)
            {
                return 2;
            }

            return 0;
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            lblCostResult.Text = null;
            
            if (CheckInputFormat() == 1)
            {
                lblError.Text = "Please input required fields";
            }
            else if (CheckInputFormat() == 2)
            {
                lblError.Text = "Please input correct data type";
            }
            else if (CheckInputFormat() == 0 && (quantity <= 0 || distance <= 0))
            {
                lblError.Text = "Input fields must be positive";
            }
            else if (string.IsNullOrEmpty(ddnShippingType.SelectedValue))
            {
                lblError.Text = "Please select shipping type";
            }
            else
            {
                
                decimal costToShip = (decimal)(distance * shippingCost + shippingTypeFee) * quantity;
                
                lblCostResult.Text = string.Format("{0:C2}", costToShip);
                lblError.Text = null;
                
                //decimal costToShip = (decimal)(distance * shippingCost) * quantity + quantity * shippingTypeFee;
                // lblCost.Text = string.Format("{0:F2}", costToShip); // 2 Decimal
                //Response.Redirect("Exercise6ShippingCalc.aspx");
                //Response.Write("<script>alert('Distance and Quantity are number only');window.location.href='Exercise6ShippingCalc.aspx'</script>");
            }
        }
    }
}