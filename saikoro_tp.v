/* �d�q�T�C�R�� */

module saikoro_test;
reg		ck, reset, enable;
wire	[6:0]	lamp;

// 1����1000���j�b�g�ɐݒ�
parameter STEP = 1000;

// �N���b�N�̒�`
always begin
	ck = 0; #(STEP/2)
	ck = 1; #(STEP/2)
end

// �d�q�T�C�R���Ăяo��
saikoro sai( ck, reset, enable, lamp );

// �e�X�g����
initial begin
		reset = 0; enable = 0;
	#STEP	reset = 1;
	#STEP	reset = 0;
	#STEP 	enable = 1;
	#(STEP*5)
		enable = 0; /* �J�E���g�l��6�̎��Aenable��0�ɂ��Ă݂� */
	#STEP	enable = 1;
	#(STEP*5)
		$finish;
end

// �\��
initial $monitor( $stime, " reset=%b enable=%b saikoro=%h lamp=%b", reset, enable, sai.cnt, lamp );

endmodule