//1ユニットを1psに設定
`timescale 1ps/1ps

module count_tp;
reg		ck, res; //入力をreg宣言
wire	[3:0]	q;	 //出力をwire宣言

parameter STEP = 100000; //1周期　100ns

// テスト対象呼び出し
counter counter( ck, res, q );

//　クロック作成
always begin
	ck = 0; #(STEP/2);
	ck = 1; #(STEP/2);
end
//　テスト入力
initial begin
		res = 0;
	#STEP	res = 1;
	#STEP	res = 0;
	#(STEP*20) $finish;
end

//表示
initial begin 
	$monitor( $stime," ck=%b res=%b q=%h", ck, res, q);
	$dumpfile("counter_tp.vcd");
	$dumpvars( 0,counter_tp );
end

endmodule
