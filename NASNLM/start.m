clear;
clc;

t=3;
f=1;
sig=0.5;
h=50*sig;
img=imread('couple256.bmp'); 
noise_img=imnoise(img,'salt & pepper',sig);

tic;
denoised_img1=medfilt2(noise_img,[7 7]); 
toc;
t1=toc;
tic;
denoised_img2=ACWMF(noise_img);
toc;
t2=toc;
tic;
denoised_img3=DBA(noise_img);
toc;
t3=toc;
tic;
denoised_img4=NAFSM(noise_img);
toc;
t4=toc;
tic;
denoised_img5=NASEPF(noise_img);
toc;
t5=toc;
tic;
denoised_img6=NASNLM(noise_img,t,f,h);
toc;
t6=toc;

figure(1); 
subplot(331);imshow(uint8(img));title('原始图');
subplot(332);imshow(uint8(noise_img));title('噪声图');
subplot(333);imshow(uint8(denoised_img1));title('MF方法');
subplot(334);imshow(uint8(denoised_img2));title('ACMF方法');
subplot(335);imshow(uint8(denoised_img3));title('DBA方法');
subplot(336);imshow(uint8(denoised_img4));title('NAFSM方法');
subplot(337);imshow(uint8(denoised_img5));title('NASEPF方法');
subplot(338);imshow(uint8(denoised_img6));title('NASNLM方法');

imwrite(uint8(img),'./output/0.bmp');
imwrite(uint8(noise_img),'./output/1.bmp');
imwrite(uint8(denoised_img1),'./output/1_MF.bmp');
imwrite(uint8(denoised_img2),'./output/2_ACWMF.bmp');
imwrite(uint8(denoised_img3),'./output/3_DBA.bmp');
imwrite(uint8(denoised_img4),'./output/4_NAFSM.bmp');
imwrite(uint8(denoised_img5),'./output/5_NASEPF.bmp');
imwrite(uint8(denoised_img6),'./output/6_NASNLM.bmp');

psnr1=PSNR(img, denoised_img1);
[mssim1 ssim_map]=ssim_index(img, denoised_img1);
mse1=MSE(img, denoised_img1);
mae1=MAE(img, denoised_img1);
psnr2=PSNR(img, denoised_img2);
[mssim2 ssim_map]=ssim_index(img, denoised_img2);
mse2=MSE(img, denoised_img2);
mae2=MAE(img, denoised_img2);
psnr3=PSNR(img, denoised_img3);
[mssim3 ssim_map]=ssim_index(img, denoised_img3);
mse3=MSE(img, denoised_img3);
mae3=MAE(img, denoised_img3);
psnr4=PSNR(img, denoised_img4);
[mssim4 ssim_map]=ssim_index(img, denoised_img4);
mse4=MSE(img, denoised_img4);
mae4=MAE(img, denoised_img4);
psnr5=PSNR(img, denoised_img5);
[mssim5 ssim_map]=ssim_index(img, denoised_img5);
mse5=MSE(img, denoised_img5);
mae5=MAE(img, denoised_img5);
psnr6=PSNR(img, denoised_img6);
[mssim6 ssim_map]=ssim_index(img, denoised_img6);
mse6=MSE(img, denoised_img6);
mae6=MAE(img, denoised_img6);

fprintf('PSNR1=%f\n',psnr1);
fprintf('MSSIM1=%f\n',mssim1);
fprintf('MSE1=%f\n',mse1);
fprintf('MAE1=%f\n',mae1);
fprintf('TIME1=%f\n',t1);
fprintf('PSNR2=%f\n',psnr2);
fprintf('MSSIM1=%f\n',mssim2);
fprintf('MSE2=%f\n',mse2);
fprintf('MAE2=%f\n',mae2);
fprintf('TIME2=%f\n',t2);
fprintf('PSNR3=%f\n',psnr3);
fprintf('MSSIM3=%f\n',mssim3);
fprintf('MSE3=%f\n',mse3);
fprintf('MAE3=%f\n',mae3);
fprintf('TIME3=%f\n',t3);
fprintf('PSNR4=%f\n',psnr4);
fprintf('MSSIM4=%f\n',mssim4);
fprintf('MSE4=%f\n',mse4);
fprintf('MAE4=%f\n',mae4);
fprintf('TIME4=%f\n',t4);
fprintf('PSNR5=%f\n',psnr5);
fprintf('MSSIM5=%f\n',mssim5);
fprintf('MSE5=%f\n',mse5);
fprintf('MAE5=%f\n',mae5);
fprintf('TIME5=%f\n',t5);
fprintf('PSNR6=%f\n',psnr6);
fprintf('MSSIM6=%f\n',mssim6);
fprintf('MSE6=%f\n',mse6);
fprintf('MAE6=%f\n',mae6);
fprintf('TIME6=%f\n',t6);

result=[psnr1,mssim1,mae1,mse1,t1;
        psnr2,mssim2,mae2,mse2,t2;
        psnr3,mssim3,mae3,mse3,t3;
        psnr4,mssim4,mae4,mse4,t4;
        psnr5,mssim5,mae5,mse5,t5;
        psnr6,mssim6,mae6,mse6,t6];
xlswrite('./output/result.xls',result);