%Menu
disp('1- calculate friction factor')
disp('2- graph friction factor vs conduit diameter')
disp('3- graph friction factor vs pipe roughness')
disp('4- graph friction factor vs fluid density')
disp('5- graph friction factor vs dynamic viscosity')
disp('press other number to exit menu')
x=true; 
while(x==true) %to loop menu
    choice = input('enter choice 1, 2, 3, 4 or 5 ');
    switch choice

        case 1
            % determine friction factor given parameters 
            % display numerical and analytical
           
            dens = input('enter fluid density (Kg/m^3) ');  %density

            while (dens<0.5 || dens>2000) %validating user input for dens
                dens = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end

            vel = input('enter fluid velocity (m/s) '); %velocity

            visc = input('enter fluid dynamic viscosity (N s/m^2) '); %viscosity

            while (visc<0.000001 || visc>300)  %validating user input for visc
                visc = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end

            diam = input('enter conduit diameter (m) '); %diameter

            rough = input('enter roughness (mm)  '); %roughness

            while (rough<0.0001 || rough>3)  %validating user input for rough
                rough = input('Incorrect value, roughness (mm) '); 
            end

            Ren = Re(dens, vel, diam, visc); %calculating reynolds number 

            if(Ren< 4000) %validating Re
                disp('Inputs are incorrect, calculated Reynolds number is< 4000') 
            end
            fana= f(diam, Ren, rough); %calculating friction factor analytically
            fnumeric= fnum(diam,Ren,rough); %calculating frcition factor numerically

            fprintf("friction factor calculated analytically: %f \n",fana); %printing both friction factors
            fprintf("friction factor calculated numerically: %f \n",fnumeric);
        case 2
            %friction factor vs conduit diameter
            %user provides lower value L and upper value H 
            %plot graph both analytical and numeric on same plot
            %save graph as .png image

            dens = input('enter fluid density (Kg/m^3) ');
            while (dens<0.5 || dens>2000) %validation
                dens = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end

            vel = input('enter fluid velocity (m/s) ');

            visc = input('enter fluid dynamic viscosity (N s/m^2) ');

            while (visc<0.000001 || visc>300) %validation
                visc = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end

            rough = input('enter roughness (mm)  ');

            while (rough<0.0001 || rough>3) %validation
                rough = input('Incorrect value, roughness (mm) ');
            end


            step =0.1; %step size for graph
            diam1 = input('enter starting conduit diameter (m)'); %lower bound of diameter
            diam2 = input('enter ending conduit diameter (m)'); %upper bound of diameter
            c=(diam2-diam1)/step; % finding the number of points that will be plotted
            numericalValues = zeros(1,c); %creating an array that will store all the calculated friction factors numerically
            analytical=zeros(1,c); %creating an array that will store all the calculated friction factors analytically
            xtemp = zeros(1, c); %creating an array that will store all the x values 
            for i= 1:1:c %loop to go through each value of the diameter and calculate friction factor for each
                cdiam = diam1 + (step*i); %variable that stores the current diameter in the loop
                xtemp(i) = cdiam; %assigning the current diameter to the current x value

                Ren= Re(dens, vel, cdiam, visc); %calculating Re

                if(Ren< 4000) %validating Re
                    disp('Inputs are incorrect, calculated Reynolds number is< 4000')
                    
                end

                numericalValues(i)= fnum(cdiam,Ren,rough); %calculating numerically for current diameter
                analytical(i)=f(cdiam,Ren,rough);% calculating analytic for current diameter
            end
            plot(xtemp,analytical,'-g') %plotting analytical graph
            hold on
            plot(xtemp,numericalValues,'-r') %plotting numeric graph
            hold off
            legend('analyical method','numerical method','Location','NorthEastOutside')
            title('friction factor vs conduit diameter')
            xlabel('conduit diameter (m)')
            ylabel('friction factor')
            saveas(gcf,'conduit_diameter.png')

        case 3
            %friction factor vs pipe roughness
            %user provides lower value L and upper value H 
            %plot graph both analytical and numeric on same plot
            %save graph as .png image
            dens = input('enter fluid density (Kg/m^3) ');

            while (dens<0.5 || dens>2000) %validation
                dens = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end

            diam = input('enter conduit diameter (m)');

            vel = input('enter fluid velocity (m/s) ');

            visc = input('enter fluid dynamic viscosity (N s/m^2) ');

            while (visc<0.000001 || visc>300) %validation
                visc = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end

            Ren= Re(dens, vel, diam, visc);
            if(Ren< 4000) %validation
                disp('Inputs are incorrect, calculated Reynolds number is< 4000')

            end

            step =(0.0001); %step size of x-axis
            rough1 = input('enter starting roughness (mm) ');
            while (rough1<(0.0001) || rough1>(3)) %validation
                rough1 = input('Incorrect value, roughness (mm) ');
            end
            rough2 = input('enter ending roughness (mm) ');
            while (rough2<(0.0001) || rough2>(3)) %validation
                rough2 = input('Incorrect value, roughness (mm) ');
            end
            c=((rough2)-(rough1))/step; %calculating the number of points plotted
            numericalValues = zeros(1,c); %making an array for all the values calculated numerically
            analytical=zeros(1,c); %array for all values calculated analytically 
            xtemp = zeros(1, c); %array storing all roughness values
            for i= 1:1:c %loop to go through all the values of roughness and calculate friction factor
                crough = (rough1) + (step*i); % variable to store current roughness
                xtemp(i) = crough; %variable to store the current roughness as the current x-coordinate
                numericalValues(i)= fnum(diam,Ren,crough);  %calculating friction numerically for current roughness 
                analytical(i)=f(diam,Ren,crough); %calculating friction factor analytically fro current roughness
            end

            plot(xtemp,numericalValues,'-r') %plotting numerical 
            hold on
            plot(xtemp,analytical,'-g') %plotting analytical
            hold off
            legend('analytical method','numerical method','Location','NorthEastOutside')
             title('friction factor vs pipe roughness')
            xlabel('pipe roughness (mm)')
            ylabel('friction factor')
            saveas(gcf,'pipe_roughness.png')


        case 4
            %friction factor vs fluid density
            %user provides lower value L and upper value H 
            %plot graph both analytical and numeric on same plot
            %save graph as .png image

            diam = input('enter conduit diameter (m)');

            vel = input('enter fluid velocity (m/s) ');

            visc = input('enter fluid dynamic viscosity (N s/m^2) ');

            while (visc<0.000001 || visc>300) %validation
                visc = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end

            rough = input('enter roughness (mm)  ');

            while (rough<0.0001 || rough>3) %validation
                rough = input('Incorrect value, roughness (mm) ');
            end


            step =0.1; %step size for x-axis
            dens1 = input('enter lower value for fluid density (Kg/m^3) '); %lower value for density 

            while (dens1<0.5 || dens1>2000) %validation
                dens1 = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end
            dens2 = input('enter upper value for fluid density (Kg/m^3) '); %upper value for density

            while (dens2<0.5 || dens2>2000) %validation
                dens2 = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end

            c=(dens2-dens1)/step; %calculating the number of points plotted
            numericalValues = zeros(1,c); %making an array for all the values calculated numerically
            analytical=zeros(1,c); %making an array for all the values calculated analytically
            xtemp = zeros(1, c); %making an array for all the values of x-coordinate
            for i= 1:1:c %loop to go through all the values of density and calculate friction factor
                cdens = dens1 + (step*i); %current density
                xtemp(i) = cdens; 

                Ren= Re(cdens, vel, diam, visc); %calculating Re for each value of density

                if(Ren< 4000) %validation
                    disp('Inputs are incorrect, calculated Reynolds number is< 4000')
                    
                end

                numericalValues(i)= fnum(diam,Ren,rough); %calculating friction numerically for each value of density 
                analytical(i)=f(diam,Ren,rough); %calculating friction analytically for each value of density
            end
            plot(xtemp,analytical,'-g')
            hold on
            plot(xtemp,numericalValues,'-r')
            hold off
            legend('analyical method','numerical method','Location','NorthEastOutside')
            title('friction factor vs fluid density')
            xlabel('fluid density (Kg/m^3)')
            ylabel('friction factor')
            saveas(gcf,'fluid density.png')


        case 5
            %friction factor vs dynamic viscosity
            %user provides lower value L and upper value H 
            %plot graph both analytical and numeric on same plot
            %save graph as .png image

             dens = input('enter fluid density (Kg/m^3) ');

            while (dens<0.5 || dens>2000)
                dens = input('Incorrect value, enter fluid density (Kg/m^3) ');
            end

            diam = input('enter conduit diameter (m)');

            vel = input('enter fluid velocity (m/s) ');
             
            rough = input('enter roughness (mm)  ');

            while (rough<0.0001 || rough>3)
                rough = input('Incorrect value, roughness (mm) ');
            end

            visc1 = input('enter lower value for fluid dynamic viscosity (N s/m^2) '); %lower value of viscosity

            while (visc1<0.000001 || visc1>300)
                visc1 = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end
             visc2 = input('enter upper value for fluid dynamic viscosity (N s/m^2) '); %upper value fo viscosity

            while (visc2<0.000001 || visc2>300)
                visc2 = input('Incorrect value,enter fluid dynamic viscosity (N s/m^2) ');
            end


            step =0.1;
           
            c=(visc2-visc1)/step;
            numericalValues = zeros(1,c);
            analytical=zeros(1,c);
            xtemp = zeros(1, c);
            for i= 1:1:c %loop to go through all the values of viscosity and calculate friction factor
                cvisc = visc1 + (step*i);
                xtemp(i) = cvisc;

                Ren= Re(dens, vel, diam, cvisc); %calculating reyolds number for each value of viscosity

                if(Ren< 4000)
                    disp('Inputs are incorrect, calculated Reynolds number is< 4000')
                   
                end

                numericalValues(i)= fnum(diam,Ren,rough);
                analytical(i)=f(diam,Ren,rough);
            end
            plot(xtemp,analytical,'-g')
            hold on
            plot(xtemp,numericalValues,'-r')
            hold off
            legend('analyical method','numerical method','Location','NorthEastOutside')
            title('friction factor vs dynamic viscosity')
            xlabel('dynamic viscosity (N s/m^2)')
            ylabel('friction factor')
            saveas(gcf,'dynamic_viscosity.png')

        otherwise
            %exit menu 
            disp('exit')
            x=false; %end menu loop
    end
end