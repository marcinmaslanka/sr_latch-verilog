module sr (
    output q,        // Ausgang Q
    output qbar,     // Komplementärer Ausgang Qbar
    input  s,        // Set-Eingang
    input  r         // Reset-Eingang
);

// SR-Latch auf Basis von zwei wechselseitig verbundenen NAND-Gattern
// Dieses Design nutzt rekursive kontinuierliche Zuweisungen (assign), 
// wodurch ein Speicherverhalten entsteht.
//
// Funktionsweise (logisch gesehen):
//  - s = 1, r = 0 → Set (Q=1, Qbar=0)
//  - s = 0, r = 1 → Reset (Q=0, Qbar=1)
//  - s = 1, r = 1 → Haltezustand (vorheriger Zustand bleibt erhalten)
//  - s = 0, r = 0 → Ungültiger Zustand (beide Ausgänge auf 1 → nicht erlaubt!)

    assign q    = ~(r & qbar);  // NOR-Gatter als NAND mit Invertierung
    assign qbar = ~(s & q);     // Rekursive Definition erzeugt bistabiles Verhalten

endmodule
