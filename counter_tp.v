//1���j�b�g��1ps�ɐݒ�
`timescale 1ps/1ps

module count_tp;
reg		ck, res; //���͂�reg�錾
wire	[3:0]	q;	 //�o�͂�wire�錾

parameter STEP = 100000; //1�����@100ns

// �e�X�g�ΏیĂяo��
counter counter( ck, res, q );

//�@�N���b�N�쐬
always begin
	ck = 0; #(STEP/2);
	ck = 1; #(STEP/2);
end
//�@�e�X�g����
initial begin
		res = 0;
	#STEP	res = 1;
	#STEP	res = 0;
	#(STEP*20) $finish;
end

//�\��
initial begin 
	$monitor( $stime," ck=%b res=%b q=%h", ck, res, q);
	$dumpfile("counter_tp.vcd");
	$dumpvars( 0,counter_tp );
end

endmodule
