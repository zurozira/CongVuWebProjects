using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApps.Assets.Pages.projects.COMP235.L1_2
{
    public partial class PaymentCalc : System.Web.UI.Page
    {
        private double price;
        private double downPayment;
        private double interestRate;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbxMonthlyPayment.Rows = 1;
        }

        private int CheckInputFormat()
        {
            if (string.IsNullOrEmpty(txtPrice.Text) || string.IsNullOrEmpty(txtDownPayment.Text) ||
                string.IsNullOrEmpty(txtInterestRate.Text))
            {
                return 1;
            }

            try
            {
                price = double.Parse(txtPrice.Text);
                downPayment = double.Parse(txtDownPayment.Text);
                interestRate = double.Parse(txtInterestRate.Text);
            }
            catch (FormatException formatException)
            {
                return 2;
            }

            if (price <= 0 || downPayment <= 0 || interestRate <= 0)
            {
                return 3;
            }

            return 0;
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (CheckInputFormat() == 1)
            {
                lblError.Text = "Missing required fields";
            }
            else if (CheckInputFormat() == 2)
            {
                lblError.Text = "Wrong input format (number only)";
            }
            else if (CheckInputFormat() == 3)
            {
                lblError.Text = "Input fields must be positive";
            }
            else
            {
                lblError.Text = null;
                int loanLength = 2;
                
                lbxMonthlyPayment.Rows = 5;
                
                lbxMonthlyPayment.Items.Clear();
                lbxMonthlyPayment.Items.Add("Months    Monthly Payment");

                interestRate /= 100;

                double loanAmount = price - downPayment;

                double monthlyRate = interestRate / 12;

                for (int i = 2; i <= 5; i++)
                {
                    int loanLengthByMonth = i * 12;
                    
                    double monthlyPayment = loanAmount * monthlyRate *
                                            Math.Pow(1 + monthlyRate, loanLengthByMonth) /
                                            (Math.Pow(1 + monthlyRate, loanLengthByMonth) - 1);
                    
                    lbxMonthlyPayment.Items.Add(string.Format("{0}...............{1:C2}", 12 * i, monthlyPayment));
                }
            }
        }
    }
}