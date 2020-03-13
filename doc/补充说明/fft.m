xr=[1,0,1,0,3,2,1,2,1,2,1,0,1,1,1,1];
xi=[0,0,0,0,0,4,8,2,0,4,0,0,0,0,0,0];
x=xr+i.*xi
X=fft(x,16);
R_X=real(X);
I_X=imag(X);
q = quantizer([17,8]);
R_X_bin = num2bin(q,R_X);
I_X_bin = num2bin(q,I_X);


 