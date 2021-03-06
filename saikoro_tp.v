/* 電子サイコロ */

module saikoro_test;
reg		ck, reset, enable;
wire	[6:0]	lamp;

// 1周期1000ユニットに設定
parameter STEP = 1000;

// クロックの定義
always begin
	ck = 0; #(STEP/2);
	ck = 1; #(STEP/2);
end

// 電子サイコロ呼び出し
saikoro sai( ck, reset, enable, lamp );

// テスト入力
initial begin
		reset = 0; enable = 0;
	#STEP	reset = 1;
	#STEP	reset = 0;
	#STEP 	enable = 1;
	#(STEP*5)
		enable = 0; /* カウント値が6の時、enableを0にしてみる */
	#STEP	enable = 1;
	#(STEP*5)
		$finish;
end

// 表示
initial $monitor( $stime, " reset=%b enable=%b saikoro=%h lamp=%b", reset, enable, sai.cnt, lamp );

endmodule
