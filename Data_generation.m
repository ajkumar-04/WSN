n=54
for i=1:n
    tx=2; 
    eta=2;
     
    f=2.4*10^9;
    gt=1;
    gr=1;
    c=3*10^8;
    
    x=randi([0 100],1,n);
    xi(i,:)=x;
    y=randi([0 100],1,n);
    yi(i,:)=y;

    z1=randperm(n);
    z=z1(1:10);

    d=squareform(pdist([x' y']));
    
    for i=1:n
        for k=1:n
            pr(i,k)=((tx*gt*gr*(c^2))/((4*pi*d(i,k)*f)^2));
            if(pr(i,k)== inf)
                 pr(i,k)=0;
            end
   
        end
         
    end
    

      
    for i=1:n
        for k=1:n
            RSSI(i,k)=10*log(pr(i,k)/(1*10^-3));
            if(RSSI(i,k)== -inf)
                 RSSI(i,k)=0;
            end
   
        end
    end
    
  
    for i=1:10   
        for k=1:n 
     
            if(z(i)~=k)
            RSSI(z(i),k)=-90.00; 
            end    
        end   
    for k=1:n 
     
        if(z(i)~=k)
            RSSI(k,z(i))=-90.00; 
        end    
    end
    end   
        RSSIshape=reshape(RSSI,1,[])
    RSSII(i,:)=RSSIshape;  

    
    for i=1:n
            for k=1:n
            if(RSSI(i,k)<=-89.9779&&i~=k)
            fp(i)=1; 
            end   
        if(RSSI(i,k)>=-89.9779&&i~=k)
             fp(i)=0;
        end
            end
        for k=1:n
            if(RSSI(k,i)<=-89.9779&&i~=k)
            fp(i)=1;
            end 
            if(RSSI(k,i)>=-89.9779&&i~=k)
                fp(i)=0;
            end    
        end
   
    fp1=transpose(fp);

    

    end
end



