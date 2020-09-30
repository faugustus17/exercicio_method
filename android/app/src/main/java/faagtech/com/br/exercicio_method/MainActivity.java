package faagtech.com.br.exercicio_method;

import android.os.Bundle;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "JavaChannel";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (MethodCall call, MethodChannel.Result result) -> {
                    /*Map<String, Object> params = call.arguments();
                    if (call.method.equals("getData")){
                        String fromParam = params.get("from").toString();
                        int a = Integer.parseInt(params.get("a").toString());
                        int b = Integer.parseInt(params.get("b").toString());
                        int x = a + b;
                        result.success(getData()+ " Back to "+ fromParam + x);
                    }else{
                        result.notImplemented();
                    }*/
                    switch (call.method){
                        case "exe1001":
                            int a = call.argument("valorA");
                            int b = call.argument("valorB");
                            result.success(getExe1001(a, b));
                            break;
                        /*case "exe1009":
                            result.success(getExe1009(salario, vendas));
                            break;
                        case "exe1018":
                            result.success(getExe1018(valorNota));
                            break;
                        case "exe2344":
                            result.success(getExe2344());
                            break;
                        case "exe3040":
                            result.success(getExe3040());
                            break;*/
                        default:
                            result.notImplemented();
                    }
                }
        );
    }

    private int getExe1001(int a, int b){
        int x = 0;
        return x = a + b;
    }

    private double getExe1009(double salario, double vendas){
        double total;
        return total = salario + (vendas * 0.15);

    }

    private ArrayList<String> getExe1018(int valorNota){
        ArrayList<String> qtdNotas = new ArrayList<>();
        qtdNotas.add(valorNota / 100 + "notas(s) de R$ 100,00");
        valorNota %= 100;
        qtdNotas.add(valorNota / 50 + "notas(s) de R$ 50,00");
        valorNota %= 50;
        qtdNotas.add(valorNota / 20 + "notas(s) de R$ 20,00");
        valorNota %= 20;
        qtdNotas.add(valorNota / 10 + "notas(s) de R$ 10,00");
        valorNota %= 10;
        qtdNotas.add(valorNota / 5 + "notas(s) de R$ 5,00");
        valorNota %= 5;
        qtdNotas.add(valorNota / 2 + "notas(s) de R$ 2,00");
        valorNota %= 2;
        qtdNotas.add(valorNota / 1 + "notas(s) de R$ 1,00");

        return qtdNotas;
    }

    private String getExe2344(int nota){
        if (nota == 0) {
            return "E";
        }else if (nota >= 1 && nota <= 35) {
            return "D";
        }else if(nota >=36 && nota <=60) {
            return "C";
        }else if(nota >=61 && nota <= 85) {
            return "B";
        }else if(nota >= 86 && nota <= 100) {
            return "A";
        }else {
            return "Nota inválida";
        }
    }

    private String getExe3040(int n, int h, int d, int g){
        for (int i=0; i < n; i++){
            if (h >= 200 && h <= 300 && d >= 50 && g >= 150){
                return "Sim";
            }else{
                return "Não";
            }
        }
        return null;
    }
}
