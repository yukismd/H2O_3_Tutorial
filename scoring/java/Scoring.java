import java.io.*;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;
import hex.genmodel.MojoModel;


public class Scoring {
    public static void main(String[] args) throws Exception {
    
        EasyPredictModelWrapper model = new EasyPredictModelWrapper(MojoModel.load("../mojo_model/gbm_6f3364e8_bbbb_4130_ad11_f2cd44e0a106.zip"));

        RowData row = new RowData();
        row.put("LIMIT_BAL", "20000");
        row.put("SEX", "M");
        row.put("EDUCATION", "university");
        row.put("MARRIAGE", "married");
        row.put("AGE", "24");
        row.put("PAY_1", "2");
        row.put("PAY_2", "2");
        row.put("PAY_3", "-1");
        row.put("PAY_4", "-1");
        row.put("PAY_5", "-2");
        row.put("PAY_6", "-2");
        row.put("BILL_AMT1", "3913");
        row.put("BILL_AMT2", "3102");
        row.put("BILL_AMT3", "689");
        row.put("BILL_AMT4", "0");
        row.put("BILL_AMT5", "0");
        row.put("BILL_AMT6", "0");
        row.put("PAY_AMT1", "0");
        row.put("PAY_AMT2", "689");
        row.put("PAY_AMT3", "0");
        row.put("PAY_AMT4", "0");
        row.put("PAY_AMT5", "0");
        row.put("PAY_AMT6", "0");

        BinomialModelPrediction p = model.predictBinomial(row);
        System.out.println("default_payment_next_month (1=yes; 0=no): " + p.label);
        System.out.print("default_payment_next_month class probabilities: ");
        for (int i = 0; i < p.classProbabilities.length; i++) {
            if (i > 0) {
        System.out.print(",");
            }
            System.out.print(p.classProbabilities[i]);
        }
        System.out.println("");
    }
  }
  