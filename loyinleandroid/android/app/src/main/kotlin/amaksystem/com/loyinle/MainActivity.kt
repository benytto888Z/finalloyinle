package amaksystem.com.loyinle


import androidx.window.layout.DisplayFeature
import androidx.window.layout.FoldingFeature
import androidx.window.layout.WindowInfoTracker
import androidx.window.layout.WindowLayoutInfo
import androidx.window.layout.WindowMetricsCalculator
import android.view.WindowManager;
import android.app.KeyguardManager
import android.content.Context

import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.lang.reflect.Method
import android.os.PowerManager

class MainActivity: FlutterActivity() {


    private val channelName = "creamindloyinle";
    private val channelName2 = "creamindloyinle2";
    private val channelName3 = "creamindloyinle3";
    private val channelName4 = "creamindloyinle4";
    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine);

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName);
        var channel2 = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName2);
        var channel3 = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName3);
        var channel4 = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName4);

      //  val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager

        // Get Power Manager service
        val powerManager: PowerManager by lazy {
            getSystemService(POWER_SERVICE) as PowerManager
        }


        val wakeLock = powerManager.newWakeLock(PowerManager.SCREEN_DIM_WAKE_LOCK, "MyTag")
        val window = getWindow();
        // without argument
       /* channel.setMethodCallHandler {call, result ->

            if(call.method == "showToast"){
                Toast.makeText(this,"Holuwa Tobii . this from native side",Toast.LENGTH_LONG).show();
            }
        }*/

        // with argument

        channel.setMethodCallHandler {call, result ->

            var args = call.arguments as Map<String, String>;

            var message = args["message"];

            if(call.method == "showToast"){
                Toast.makeText(this,message,Toast.LENGTH_LONG).show();
            }
        }

        channel2.setMethodCallHandler {call, result ->

            if(call.method == "changeColor"){
                result.success("0xff60e950");
            }
        }

        channel3.setMethodCallHandler {call, result ->

            if(call.method == "goWakeUp"){
                Toast.makeText(this,"Tout est ok",Toast.LENGTH_LONG).show();
                Log.i("wakup device", " IIIIIIIIIIIIIIIIILIVE !!!!!.");

                // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD)
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED)
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)

                  val keyguardManager: KeyguardManager = getApplicationContext().getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
                    keyguardManager.requestDismissKeyguard(this, null)
                    setShowWhenLocked(true)
                    setTurnScreenOn(true)
                /* } else {
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN or
                            WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or
                            WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD or
                            WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                            WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
                }*/
                //wakeLock.acquire();

                /*   window.addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
                   window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);*/
             /*  if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                    setShowWhenLocked(true)
                    setTurnScreenOn(true)

                    val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
                    keyguardManager.requestDismissKeyguard(this, null)
                } else {
                    window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
                }*/
            }
        }



        channel4.setMethodCallHandler { call, result ->

            if (call.method == "goWakeUp2") {
                Toast.makeText(this, "Tout est ok", Toast.LENGTH_LONG).show();


                // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
                getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD)
                getWindow().addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED)
                getWindow().addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)

                val keyguardManager: KeyguardManager = getApplicationContext().getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
                 keyguardManager.requestDismissKeyguard(this, null)
                setShowWhenLocked(true)
                setTurnScreenOn(true)
                /* } else {
                    getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN or
                            WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or
                            WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD or
                            WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                            WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
                }*/
                //wakeLock.acquire();

                /*   window.addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
                   window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);*/
                /*  if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                       setShowWhenLocked(true)
                       setTurnScreenOn(true)

                       val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
                       keyguardManager.requestDismissKeyguard(this, null)
                   } else {
                       window.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
                   }*/
            }
        }
    }
}
