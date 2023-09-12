package graph;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author saulc
 */
public class general {
    public static void barras(
      String Titulo,
      String TituloX,
      String TituloY,
      Object valores[],
      Object ejex[]
    ) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < valores.length; i++) {
            Double val = Double.valueOf(valores[i].toString());
            dataset.addValue(val, "", ejex[i].toString());
        }
        JFreeChart grafica = ChartFactory.createBarChart(
        Titulo,
        TituloX, TituloY,
        dataset,
        PlotOrientation.VERTICAL,
        true, true, true
        );

        ChartFrame frame = new ChartFrame("Ejemplo", grafica);
        frame.pack();
        frame.setVisible(true);
    }

    public static void linea(
      String Titulo,
      String TituloX,
      String TituloY,
      double valores[],
      String ejex[]
    ) {
        //Ingreso de datos
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (int i = 0; i < 5; i++) {
            dataset.addValue(valores[i], "Valor", ejex[i]);
        }

        // Creación de gráfica
        JFreeChart grafica
          = ChartFactory.createLineChart(
            Titulo,
            TituloX,
            TituloY,
            dataset);

        // Mostrar
        ChartFrame frame = new ChartFrame("Ejemplo", grafica);
        frame.pack();
        frame.setVisible(true);
    }

    public static void pie(
      String Titulo,
      Object valores[],
      Object ejex[]
    ) {
        //Ingreso de datos
        DefaultPieDataset dataset = new DefaultPieDataset();

        for (int i = 0; i < valores.length; i++) {
            Double val = Double.valueOf(valores[i].toString());
            dataset.setValue(ejex[i].toString(), val);
        }
        // Creación de gráfica
        JFreeChart grafica
          = ChartFactory.createPieChart(Titulo, dataset);

        // Mostrar
        ChartFrame frame = new ChartFrame("Ejemplo", grafica);
        frame.pack();
        frame.setVisible(true);
    }
}
