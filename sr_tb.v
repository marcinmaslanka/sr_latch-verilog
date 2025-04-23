module sr_tb;
    reg s, r;          // Eingangssignale: Set (s) und Reset (r)
    wire q, qbar;      // Ausgangssignale: q und qbar

    // Instanziierung des Device Under Test (DUT): SR-Latch-Modul
    sr dut (q, qbar, s, r);

    initial begin
        // 🔧 Vorbereitung für die Simulation mit GTKWave
        $dumpfile("sr_tb.vcd");   // Ausgabedatei für Wellenform (VCD = Value Change Dump)
        $dumpvars(0, sr_tb);      // Erfasse alle Signale dieser Testbench-Instanz

        // 🖥 Laufzeit-Monitor: zeigt bei jeder Änderung Signalwerte in der Konsole an
        $monitor($time, " s=%b, r=%b, q=%b, qbar=%b", s, r, q, qbar);

        // 🧪 Stimuli – Testfälle zur Ansteuerung des SR-Latch
        s = 1'b0; r = 1'b1;   // Zustand 1: Reset (q=0, qbar=1 erwartet)
        #5 s = 1'b1; r = 1'b1; // Zustand 2: Haltezustand (Zustand bleibt erhalten)
        #5 s = 1'b1; r = 1'b0; // Zustand 3: Set (q=1, qbar=0 erwartet)
        #5 s = 1'b1; r = 1'b1; // Zustand 4: Haltezustand
        #5 s = 1'b0; r = 1'b0; // ❌ Zustand 5: Verbotener Zustand – beide Ausgänge könnten 1 werden (undefiniert!)
        #5 s = 1'b1; r = 1'b1; // Zustand 6: Haltezustand (Erholung vom undefinierten Zustand)

        // Beende die Simulation nach allen Tests
        #5 $finish;
    end
endmodule
