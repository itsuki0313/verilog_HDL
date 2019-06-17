//1���j�b�g��1ps�ɐݒ�
`timescale 1ps/1ps

module adder_tp;
reg	[3:0]	a, b;
wire	[3:0]	q;

//1�N���b�N�ݒ�
parameter STEP = 100000;

//�e�X�g�ΏیĂяo��
adder adder( a, b, q );

//�e�X�g����
initial begin
	$dumpfile("adder_tp.vcd");
	$dumpvars(0,adder_tp);
		a = 4'h0;	b = 4'h0;
	#STEP	a = 4'h5;	b = 4'ha;
	#STEP	a = 4'h7;	b = 4'ha;
	#STEP	a = 4'h1;	b = 4'hf;
	#STEP	a = 4'hf;	b = 4'hf;
	#STEP	$finish;
end

//�\��
initial	$monitor( $stime, " a=%h b=%h q=%h ", a, b, q );

endmodule