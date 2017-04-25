function interpolationfarzi (name,n)
    close all
    im=imread(name);
    im=rgb2gray(im);
    imshow(im);
    [r,c]=size(im);
    % NEAREST NEIGHBOUR
    x=zeros(r*n,c*n);
    for i=1:r
        for j=1:c
            x(i*n-n+1:i*n,j*n-n+1:j*n)=repmat(im(i,j),n,n);
        end
    end
    figure
    subplot (1 ,2 ,1)
    imshow(mat2gray(x));
    title('Nearest Neighbour');
    % BILINEAR
    im = im2double(im);
    [r,c]=size(im);
    y=zeros(r*n-n+1,c*n-n+1);
    % COPY THE ORIGINAL VALUES
    for i=1:r
        for j=1:c
            y(i*n-n+1,j*n-n+1)=im(i,j);            
        end
    end         
    % INTERPOLATE IN X-DIRECTION
    [row,col]=size(y);
    for i=1:n:row
        for j=1:col
            m=mod(j,n);
            if(m==0)
                m=n;
            end
            if(m~=1)
                y(i,j)=((m-1)*y(i,j-(m-1)+n) + (n-(m-1))*y(i,j-(m-1)))/n;
            end
        end
    end      
    % INTERPOLATE IN Y-DIRECTION
    for i=1:row
        for j=1:col
            m=mod(i,n);
            if(m==0)
                m=n;
            end            
            if(m~=1)
                y(i,j)=((m-1)*y(i-(m-1)+n,j) + (n-(m-1))*y(i-(m-1),j))/n;
            end
        end
    end
    subplot (1 ,2 ,2)
    imshow(y);
    title('Bilinear');
end
