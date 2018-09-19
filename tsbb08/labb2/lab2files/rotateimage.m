function RotateIm = rotateimage(Im, theta, intpol)

T = [cos(theta) sin(theta); -sin(theta) cos(theta)];
[rows, cols] = size(Im);
RotateIm = zeros(rows,cols);

for xg = 1:cols	
  for yg = 1:rows
    xyff = inv(T)*([xg; yg]-[cols/2; rows/2])+[cols/2; rows/2];
    xff  = xyff(1);
    yff  = xyff(2);

    switch intpol
       case 'nearest'
        % rotation code with nearest neighbor interpolation
        if (xff<=cols && yff<=rows && xff>=1 && yff>=1)
            xf = round(xff);
            yf = round(yff);
            RotateIm(yg,xg) = Im(yf,xf);
        end
        case 'bilinear'
        % rotation code with bilinear interpolation
        if (xff<=cols && yff<=rows && xff>=1 && yff>=1)
            xf = floor(xff);
            yf = floor(yff);
            xe = xff-xf;
            ye = yff-yf;
            RotateIm(yg,xg) = Im(yf,xf)*(1-xe)*(1-ye) + ...
                              Im(yf,xf+1)*xe*(1-ye) + ...
                              Im(yf+1,xf)*(1-xe)*ye + ...
                              Im(yf+1,xf+1)*xe*ye;
        end
       case 'bicubic'
        % rotation code with bicubic interpolation
        if (xff<=cols && yff<=rows && xff>=1 && yff>=1)
            xf = floor(xff);
            yf = floor(yff);
            xe = xff-xf;
            ye = yff-yf;
            RotateIm(yg,xg) = Im(yf,xf)*bicubic4(xe)*bicubic4(ye) + ...
                              Im(yf,xf+1)*bicubic4(1-xe)*bicubic4(ye) + ...
                              Im(yf+1,xf)*bicubic4(xe)*bicubic4(1-ye) + ...
                              Im(yf+1,xf+1)*bicubic4(1-xe)*bicubic4(1-ye);
        end
       case 'bicubic16'
        if (xff<cols-1 & yff<rows-1 & xff>2 & yff>2)
          yf=floor(yff);
          xf=floor(xff);

          dxf=xff-xf;
          dxff=dxf+1;
          dxc=1-dxf;
          dxcc=1+dxc;

          dyf=yff-yf;
          dyff=dyf+1;                    
          dyc=1-dyf;                    
          dycc=dyc+1;

          firstRow =  bicubic16(dxff)*bicubic16(dyff)*Im(yf-1,xf-1)+...
          bicubic16(dxff)*bicubic16(dyf)* Im(yf,xf-1)+...
          bicubic16(dxff)*bicubic16(dyc)* Im(yf+1,xf-1)+...
          bicubic16(dxff)*bicubic16(dycc)*Im(yf+2,xf-1);

          secondRow = bicubic16(dxf)*bicubic16(dyff)* Im(yf-1,xf)+...
          bicubic16(dxf)*bicubic16(dyf)*  Im(yf,xf)+...
          bicubic16(dxf)*bicubic16(dyc)*  Im(yf+1,xf)+...
          bicubic16(dxf)*bicubic16(dycc)* Im(yf+2,xf);

          thirdRow =  bicubic16(dxc)*bicubic16(dyff)* Im(yf-1,xf+1)+...
          bicubic16(dxc)*bicubic16(dyf)*  Im(yf,xf+1)+...
          bicubic16(dxc)*bicubic16(dyc)*  Im(yf+1,xf+1)+...
          bicubic16(dxc)*bicubic16(dycc)* Im(yf+2,xf+1);

          fourthRow = bicubic16(dxcc)*bicubic16(dyff)*Im(yf-1,xf+2)+...
          bicubic16(dxcc)*bicubic16(dyf)* Im(yf,xf+2)+...
          bicubic16(dxcc)*bicubic16(dyc)* Im(yf+1,xf+2)+...
          bicubic16(dxcc)*bicubic16(dycc)*Im(yf+2,xf+2);

          RotateIm(yg,xg) = firstRow+secondRow+thirdRow+fourthRow;
          
        elseif (xff<cols & yff<rows & xff>1 & yff>1)
            xf = floor(xff);
            yf = floor(yff);
            xe = xff-xf;
            ye = yff-yf;
            RotateIm(yg,xg) = Im(yf,xf)*bicubic4(xe)*bicubic4(ye) + ...
                              Im(yf,xf+1)*bicubic4(1-xe)*bicubic4(ye) + ...
                              Im(yf+1,xf)*bicubic4(xe)*bicubic4(1-ye) + ...
                              Im(yf+1,xf+1)*bicubic4(1-xe)*bicubic4(1-ye);

        end
       otherwise
        error('Unknown interpolation method');
    end
  end
end 
