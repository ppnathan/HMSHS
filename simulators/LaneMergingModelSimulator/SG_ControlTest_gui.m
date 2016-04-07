function varargout = SG_ControlTest_gui(varargin)
    % Speedgoat Controller GUI
    
    %% Defining Parameters and Signals
    sl_model = 'LaneMergingSim_ControllerWithVirtualHuman';
    
   % add parameters in this cell array: {Path, Simulink Name, Name in GUI}
    c_params = {...
        'Enable','Value','Enable';...
        'Controller/x_ori','Value','x_ori';...
        'Controller/y_ori','Value','y_ori';...
        'Controller/theta_ori','Value','theta_ori'...
%         'Reference Generator/reference path planner/des_lane','Value','Desired Lane';...
%         'Reference Generator/reference path planner/reference_speed','Value','Des Velocity (m/s)';...
%         'Controller/Tuning parameters/w_x', 'w_x', 'w_x';...
%         'Controller/Tuning parameters/w_y', 'w_y', 'w_y';...
%         'Controller/Tuning parameters/w_phi', 'w_phi', 'w_phi';...
%         'Controller/Tuning parameters/w_delta', 'w_delta', 'w_delta';...
%         'Controller/Tuning parameters/w_a', 'w_a', 'w_a';...
%         'Controller/Tuning parameters/w_delta_rate', 'w_delta_rate', 'w_delta_rate';...
%         'Controller/Tuning parameters/w_a_rate', 'w_a_rate', 'w_a_rate';...
%         'Controller/Tuning parameters/w_obstacles', 'w_obstacles', 'w_obstacles';...
%         'Controller/Tuning parameters/w_obstacles_dist', 'w_obstacles_dist', 'w_obstacles_dist';...
%         'Controller/Tuning parameters/extra_obst_dist', 'extra_obst_dist', 'extra_obst_dist';...
%         'CheckLCStatus/safe_forward','safe_forward','Forward Safety Dist (m)';...
%         'CheckLCStatus/safe_backward','safe_backward','Backward Safety Dist (m)';...
%         'Virtual Obstacle Generation/enableTarget', 'Value', 'Enable Target'...
        };
    
       % add signals in this cell array: {Path, Signal Name, Name in GUI}
       status_signals = {...
           'Controller/MATLAB Function2','u','u';...
           'AutonomousVehicleSimulator/MATLAB Function3','x_g','x_r';...
           'AutonomousVehicleSimulator/MATLAB Function3','y_g','y_r';...
           'AutonomousVehicleSimulator/MATLAB Function3','theta_g','theta_r';...
           'AutonomousVehicleSimulator/MATLAB Function3','v_g','v_r'...
%            'Localization/gain3','LocalX','GPS X Position';...
%        'InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1','ACK_TCS','Steering Angle (check signal path)';...
%        'InputProcessing/For Iterator Subsystem1/GPS_Signals/VelocityLevel','VelForward','Velocity (check signal path)';...
%        'InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude','PosLat','PosLat';...
%        'InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude','PosLong','PosLong';...
%        'InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll','AngleHeading','GPS Psi (check signal path)';...
%        'Localization/gain4','LocalY','GPS Y Position';...
%        'Localization/gain5','INSHeading','Heading Angle';...
%        'Gain','delta_f [rad]','CONTROLLER: delta_f';...
%        'Gain1','ax [m/s2]','CONTROLLER: a_x';...
%        'Reference Generator/reference path planner/Gain2','Gain2','a_0';...
%        'Reference Generator/reference path planner/find_coeffs_center_multi_lanes','curr_lane','CurrLane'...
       %'CheckLCStatus/LeftFeas','LeftFeas','LeftFeas';...
       %'CheckLCStatus/RightFeas','RightFeas','RightFeas'...
       };
        
   
    % Check signal names and parameter blocks (but not parameter names)
    check_model(c_params, status_signals);
    
    %% Speedgoat Initialization
    tg = SimulinkRealTime.target;
    if(~strcmp(ping(tg),'success'))
        error('Target computer not connected. Program aborted.')
    end
    
    load_sl = load(tg,sl_model);
    
    % If this is on, will show all the signals and block names in the
    % simulink model. Typically want it off unless you're grabbing signals
    % for future measurements
    tg.ShowSignals = 'off'
    tg.ShowParameters = 'off'
    
    slrt;
    tg.StopTime = inf;
    tg.SampleTime = 0.001;

    [f, enablePanel, statusPanel, controllerPanel, hstart, hconnect,...
        hexec_time_static, hexec_time, hstatic_sample_time, hsample_time,...
        hstatic_stop_time, hstop_time] = initialize();

    %% Parameters
    
    % Radio Button Parameters
%     acc_state_radio = RadioParam(tg, 'OutputProcessing/ACC_Interface/state', 'Value',...    
%         'ACC State', [.05 .4 .3 .2], enablePanel, {'0 - Disable', 0}, {'1 - Standby', 1},...
%         {'2 - Control', 2}, {'3 - Stop', 3});
%     
%     manual_a_req_radio = RadioParam(tg, 'OutputProcessing/enableManAx', 'Value',...
%         'Manual A-Req', [.4 .48 .3 .12], enablePanel, {'Off', 0}, {'On', 1});
% 
%     enable_mpc_radio = RadioParam(tg, 'EnableController', 'Value', 'Enable MPC',...
%         [.05 .25 .3 .12], enablePanel, {'Off', 0}, {'On', 1});
% 
%     active_flag_steering_radio = RadioParam(tg, 'OutputProcessing/VehicleCanProcessing/Active Flag',...
%         'Value', 'Active Flag', [.4 .33 .3 .12], enablePanel, {'Off', 0}, {'On', 1});
%         
%     gear_on_radio = RadioParam(tg, 'GearOn', 'Value', 'Gear On',...
%         [.05 .1 .3 .12], enablePanel, {'Off', 0}, {'On', 1});
%     
%     driver_override_radio = RadioParam(tg, 'DriverOverride/DriverOverrideReset', 'Value', 'OverRide Reset',...
%         [.05 .1 .3 .12], enablePanel, {'Off', 0}, {'On', 1});
%     
%     gear_choice_radio = RadioParam(tg, 'GearValue', 'Value', 'Gear',...
%         [.4 .1 .3 .2], enablePanel, {'Park', 0}, {'Reverse', 7},...
%         {'Neutral', 6}, {'Drive', 5'});
        
    % Non-radio Parameters
       
%     manual_a_val_param = Param(tg, 'OutputProcessing/Manual_aReq',...
%         'Value', 'Manual a-val', [.7 .55 .25 .05], [.725 .5 .25 .05], enablePanel);
%     
%     req_steering_angle_param = Param(tg, 'OutputProcessing/VehicleCanProcessing/Req Steering Angle [deg]',...
%         'Value', 'Req Steer Ang', [.7 .4 .25 .05], [.725 .35 .25 .05], enablePanel);
    
    hadd_param = uicontrol('Style','pushbutton','String','Add',...
              'Units','normalized','Parent',statusPanel,'Position',[.75 .925 .1 .05],...
              'Callback',@add_param_Callback);
    
    cp_loc_y = .88;
    cp_sep = .05;

    function c_pars = display_c_params(c_params)
        for i = 1:length(c_params(:,1))
            c_pars(i) = Param(tg, char(c_params(i,1)), char(c_params(i,2)), char(c_params(i,3)),...
                [.05 cp_loc_y-i*cp_sep .35 cp_sep-.01], [.45 cp_loc_y-i*cp_sep .2 cp_sep-.01], controllerPanel);
        end
    end

    c_pars = display_c_params(c_params);
    
    %% Signals
    
    hstatus_title = uicontrol('Style','text',...
      'String','Status','FontSize',16,'Parent',statusPanel,...
      'Units','normalized','Position',[.2 .88 .6 .1]);
  
    hcontroller_title = uicontrol('Style','text',...
      'String','Controller','FontSize',16,'Parent',controllerPanel,...
      'Units','normalized','Position',[.2 .88 .6 .1]);
  
    hadd_signal = uicontrol('Style','pushbutton','String','Add',...
          'Units','normalized','Parent',statusPanel,'Position',[.75 .925 .1 .05],...
          'Callback',@add_signal_Callback);
  
     ss_loc_y = .85; % starting height of list of status signals
     ss_sep = .03;

    function status_sigs = display_status_signals(status_signals)
        for i = 1:length(status_signals(:,1))

            
            full_path = strcat(sl_model, '/', status_signals(i,1)); % proper path
            hblock = get_param(char(full_path),'PortHandles'); % block object
            output_names = get_param(hblock.Outport,'Name'); % block output ports
            
            if size(output_names,1) == 1
                path = char(status_signals(i,1));
            else
                for row = 1:size(output_names,1)
                    if strcmp(char(status_signals(i,2)), char(output_names(row,:)))
                        path = strcat(char(status_signals(i,1)),'/p',num2str(row));
                    end
                end
            end
            
            status_sigs(i) = Signal(tg, path,...
                char(status_signals(i,3)), [.1 ss_loc_y-i*ss_sep, .6, ss_sep],...
                [.7 ss_loc_y-i*ss_sep .2 ss_sep ], statusPanel);
        end
    end

	status_sigs = display_status_signals(status_signals);
     
    %% Map/Visualization
%     f_map = figure('Visible','off','Units','characters','Position',[30 30 100 30],...
%             'HandleVisibility','callback','IntegerHandle','off','Name','Live Map','Renderer','painters',...
%             'Toolbar','figure','NumberTitle','off');
%     hmap = axes('Units','normalized','Position',[.1,.1,.8,.8],'Parent',f_map,...
%         'NextPlot','replacechildren'); 
%     movegui(f_map,'center')
%     x_ol = SignalArray(tg,'Controller/S-Function: MPC Controller/p5',1:8);
%     y_ol = SignalArray(tg,'Controller/S-Function: MPC Controller/p6',1:8);
%     x_traj = SignalArray(tg,'Reference Generator/adjust heading',5:4:33);
%     y_traj = SignalArray(tg,'Reference Generator/adjust heading',6:4:34);
%     plot(hmap,x_ol.values,y_ol.values)
%     
%     % make gui visible after all visual components are made
%     f_map.Visible = 'on';
    f.Visible = 'on';
    
 
    %% Callback Functions

   function connect_Callback(source,eventdata)
   % Connect to speedgoat
        tg = SimulinkRealTime.target;
        load_sl;
        slrt;
        hconnect.String = 'Disconnect';
        hconnect.Callback = @disconnect_Callback;
   end

   function disconnect_Callback(source,eventdata)
   % Disconnect from speedogoat
            stop(tg);
            hstart.String = 'Start';
            close(tg);
            hconnect.String = 'Connect';
            hconnect.Callback = @connect_Callback;
   end

   function start_Callback(source,eventdata)
   % Start application in real time
            start(tg)
            hconnect.String = 'Disconnect';
            hstart.String = 'Stop';
            hstart.Callback = @save_figure_Callback;
            while(strcmp(tg.Status,'running'))
                for x = 1:length(status_sigs)
                    update(status_sigs(x));
                end
                
%                 update_array(x_ol);
%                 update_array(y_ol);
                %plot(tg.TimeLog, tg.TETLog)
                %plot(hmap,x_ol.values,y_ol.values,'sk','MarkerFaceColor','k')
                
                disp(tg.TimeLog)
                hexec_time.String = num2str(round(tg.ExecTime,1));
                pause(tg.SampleTime)
            end
   end

   function stop_Callback(source,eventdata)
   % Start application in real time
            stop(tg);
            plot(hmap, tg.TimeLog, tg.TETLog)
            hstart.String = 'Start';
            hstart.Callback = @save_figure_Callback;
   end

   function sampletime_Callback(source,eventdata)
   % Change sample time
      tg.SampleTime = str2double(source.String);
   end

   function stoptime_Callback(source,eventdata)
   % Change stop time
      stoptime = str2double(source.String);
      tg.StopTime = str2double(source.String);
   end

   function add_param_Callback(source,eventdata)
        f_add_param = figure('Visible','on','Units','characters','Position',[30 30 80 15],'ResizeFcn',@figResize,...
            'HandleVisibility','callback','IntegerHandle','off','Name','Add Parameter','Renderer','painters',...
            'Toolbar','figure','NumberTitle','off');
        movegui(f_add_param,'center')
        
        hnew_param_title = uicontrol('Style','text',...
              'Units','normalized','String','New Parameter','Parent',f_add_param,...
              'FontSize',14,'Position',[.2 .77 .6 .2]);
      
        hsave_param = uicontrol('Style','pushbutton','String','Save',...
          'Units','normalized','Parent',f_add_param,'Position',[.5 .1 .2 .15],...
          'Callback',@save_param_Callback);
        hcancel_param = uicontrol('Style','pushbutton','String','Cancel',...
          'Units','normalized','Parent',f_add_param,'Position',[.75 .1 .2 .15],...
          'Callback',@cancel_Callback);
      
        hnew_param_path_static = uicontrol('Style','text',...
              'Units','normalized','String','Simulink Path','Parent',f_add_param,...
              'Position',[.1 .67 .3 .1]);
        hnew_param_path = uicontrol('Style','edit',...
              'String','','Parent',f_add_param,...
              'Units','normalized','Position',[.4 .7 .4 .1]);
          
        hnew_param_name_static = uicontrol('Style','text',...
              'Units','normalized','String','Simulink Name','Parent',f_add_param,...
              'Position',[.1 .47 .3 .1]);
        hnew_param_name = uicontrol('Style','edit',...
              'String','','Parent',f_add_param,...
              'Units','normalized','Position',[.4 .50 .4 .1]);

        hnew_param_display_static = uicontrol('Style','text',...
              'Units','normalized','String','Name in GUI','Parent',f_add_param,...
              'Position',[.1 .3 .3 .1]);
        hnew_param_display = uicontrol('Style','edit',...
              'String','','Parent',f_add_param,...
              'Units','normalized','Position',[.4 .33 .4 .1]);
          
        function save_param_Callback(source,eventdata)
            make_param(hnew_param_path.String, hnew_param_name.String,hnew_param_display.String);
        end
    end

   function make_param(sl_path,sl_name,disp_name)
        old_param_count = length(params(:,1));
        params{old_param_count+1,1} = sl_path;
        params{old_param_count+1,2} = sl_name;
        params{old_param_count+1,3} = disp_name;
        display_params(params);
        close
    end

   function add_signal_Callback(source,eventdata)
        f_add_signal = figure('Visible','on','Units','characters','Position',[30 30 80 15],...
            'HandleVisibility','callback','IntegerHandle','off','Name','Add Signal','Renderer','painters',...
            'Toolbar','figure','NumberTitle','off');
        movegui(f_add_signal,'center')
        
        hnew_signal_title = uicontrol('Style','text',...
              'Units','normalized','String','New Signal','Parent',f_add_signal,...
              'FontSize',14,'Position',[.2 .77 .6 .2]);
      
        hsave_signal = uicontrol('Style','pushbutton','String','Save',...
          'Units','normalized','Parent',f_add_signal,'Position',[.5 .1 .2 .15],...
          'Callback',@save_signal_Callback);
        hcancel_signal = uicontrol('Style','pushbutton','String','Cancel',...
          'Units','normalized','Parent',f_add_signal,'Position',[.75 .1 .2 .15],...
          'Callback',@cancel_Callback);
      
        hnew_signal_path_static = uicontrol('Style','text',...
              'Units','normalized','String','Simulink Path/Name','Parent',f_add_signal,...
              'Position',[.1 .67 .3 .1]);
        hnew_signal_path = uicontrol('Style','edit',...
              'String','','Parent',f_add_signal,...
              'Units','normalized','Position',[.4 .7 .4 .1]);

        hnew_signal_display_static = uicontrol('Style','text',...
              'Units','normalized','String','Name in GUI','Parent',f_add_signal,...
              'Position',[.1 .5 .3 .1]);
        hnew_signal_display = uicontrol('Style','edit',...
              'String','','Parent',f_add_signal,...
              'Units','normalized','Position',[.4 .53 .4 .1]);
          
        function save_signal_Callback(source,eventdata)
            make_signal(hnew_signal_path.String, hnew_signal_display.String);
        end
 end

   function make_signal(sl_path,disp_name)
        old_signal_count = length(signals(:,1));
        signals{old_signal_count+1,1} = sl_path;
        signals{old_signal_count+1,2} = disp_name;
        display_signals(signals);
        close
    end

   function cancel_Callback(source,eventdata)
        close
    end

   function [f, enablePanel, statusPanel, controllerPanel, hstart, hconnect,...
            hexec_time_static, hexec_time, hstatic_sample_time, hsample_time,...
            hstatic_stop_time, hstop_time] = initialize(varargin)
        %  Initialization tasks
        f = figure('Visible','off','Units','characters','Position',[30 30 200 40],'ResizeFcn',@figResize,...
            'HandleVisibility','callback','IntegerHandle','off','Name','CPG GUI','Renderer','painters',...
            'Toolbar','figure','NumberTitle','off');
        panelColor = get(0,'DefaultUicontrolBackgroundColor');
        movegui(f,'center')

        enablePanel = uipanel('borderType','etchedin',...
            'BackgroundColor',panelColor,...
            'Units','characters',...
            'Position',[1/20 1/20 30 10],...
            'Parent',f);

        statusPanel = uipanel('bordertype','etchedin',...
            'BackgroundColor',panelColor,...
            'Units','characters',...
            'Position',[88 1/20 32 35],...
            'Parent',f);

        controllerPanel = uipanel('bordertype','etchedin',...
            'BackgroundColor',panelColor,...
            'Units','characters',...
            'Position',[88 1/20 32 35],...
            'Parent',f);
        
        hstart = uicontrol('Style','pushbutton','String','Start',...
              'Units','normalized','Parent',enablePanel,'Position',[.15 .92 .25 .05],...
              'Callback',@start_Callback);
        hconnect = uicontrol('Style','pushbutton','String','Disconnect',...
              'Units','normalized','Position',[.5 .92 .25 .05],'Parent',enablePanel,...
              'Callback',@disconnect_Callback);
          
        hexec_time_static = uicontrol('Style','text',...
              'String','Exec. Time:','HorizontalAlignment','center','Parent',enablePanel,...
              'Units','normalized','Position',[.5 .85 .3 .05]);
        hexec_time = uicontrol('Style','text',...
              'String','0','FontSize',18,'HorizontalAlignment','center','Parent',enablePanel,...
              'Units','normalized','Position',[.5 .75 .3 .1]);
          
        hstatic_sample_time = uicontrol('Style','text',...
              'Units','normalized','String','Sample Time','Parent',enablePanel,...
              'Position',[.1 .85 .3 .05]);
        hsample_time = uicontrol('Style','edit',...
              'String',tg.SampleTime,'Parent',enablePanel,...
              'Units','normalized','Position',[.1 .82 .3 .05],...
              'Callback',@sampletime_Callback);
          
        hstatic_stop_time = uicontrol('Style','text',...
              'String','Stop Time','Parent',enablePanel,...
              'Units','normalized','Position',[.1 .75 .3 .05]);
        hstop_time = uicontrol('Style','edit',...
              'String',tg.StopTime,...
              'Units','normalized','Position',[.1 .72 .3 .05],'Parent',enablePanel,...
              'Callback',@stoptime_Callback);
          
   end

    % checks if signals and parameters are valid (doesn't need SLRT)
    function check_model(params, signals)
        load_system(sl_model);
        
        disp('Checking signal names:')
        for counter = 1:size(signals,1)
            full_path = strcat(sl_model, '/', signals(counter,1)); % proper path
            hblock = get_param(char(full_path),'PortHandles'); % block object
            output_names = get_param(hblock.Outport,'Name'); % block output ports
            signal_valid = false;
            
            for i = 1:size(output_names,1)
                if strcmp(signals(counter,2), char(output_names(i,:)))
                    signal_valid = true;
                end
            end
            
            if signal_valid == true
                disp(strcat(signals(counter,3), '...good'));
            else
                err_msg = strcat('Invalid Signal...', signals(counter,1),'...',signals(counter,2));
                error(char(err_msg));
            end
        end
        
        disp('Checking blocks of parameters (but not parameter names):')
        for counter = 1:size(params,1)
            full_path = strcat(sl_model, '/', params(counter,1));
            get_param(full_path,'Value');
            disp(strcat(params(counter,3), '...good'));
        end
        
    end

    function save_figure_Callback(src,evt)
        stop(tg);
        hstart.String = 'Start';
        hstart.Callback = @start_Callback;
        
        f_save_data = figure('Visible','off','Units','characters','Position',[30 30 80 15],'ResizeFcn',@figResize,...
            'HandleVisibility','callback','IntegerHandle','off','Name','Save Data','Renderer','painters',...
            'Toolbar','figure','NumberTitle','off');
        movegui(f_save_data,'center')
        
        hsave_data_title = uicontrol('Style','text',...
              'Units','normalized','String','Save Data File','Parent',f_save_data,...
              'FontSize',14,'Position',[.2 .77 .6 .2]);
      
        hsave_button = uicontrol('Style','pushbutton','String','Save',...
          'Units','normalized','Parent',f_save_data,'Position',[.5 .1 .2 .15],...
          'Callback',@save_data_Callback);
        hcancel_button = uicontrol('Style','pushbutton','String','Cancel',...
          'Units','normalized','Parent',f_save_data,'Position',[.75 .1 .2 .15],...
          'Callback',@cancel_Callback);
          
        hfile_name_static = uicontrol('Style','text',...
              'Units','normalized','String','File Name','Parent',f_save_data,...
              'Position',[.1 .47 .3 .1]);
        hfile_name = uicontrol('Style','edit',...
              'String','','Parent',f_save_data,...
              'Units','normalized','Position',[.4 .50 .4 .1]);
          
        f_save_data.Visible = 'on';
        
        function save_data_Callback(source,eventdata)
%             scopes = {'States','Traj','Inputs','targetOn','Z_ol','U_ol'};
            scopes = {'belief','u_out'};
            
            belief = struct;
            x_sim = struct;
            u_out = struct;
%             Traj = struct;
%             Inputs = struct;
%             targetOn = struct;
%             Z_ol = struct;
%             U_ol = struct;
            
            fs = SimulinkRealTime.fileSystem;
            for i = 1:length(scopes)
                h = fopen(fs,strcat(char(scopes(i)),'.dat'));
                trial_data = fread(fs,h);
                fs.fclose(h);
                eval(sprintf('%s = SimulinkRealTime.utils.getFileScopeData(trial_data)', char(scopes(i))));
                if i == 1
                    save(hfile_name.String, char(scopes(1)));
                else
                    save(hfile_name.String, char(scopes(i)), '-append');
                end
%                 save(char(scopes(i)), char(scopes(i)));
            end
            close(f_save_data)
        end
        
    end
        
    % Figure resize function
   function figResize(src,evt)
        fpos = get(f,'Position');
        set(enablePanel,'Position',...
            [1/20 1/20 fpos(3)*1/3 fpos(4)])
        set(statusPanel,'Position',...
            [fpos(3)*1/3 1/20 fpos(3)*1/3 fpos(4)])
        set(controllerPanel,'Position',...
            [fpos(3)*2/3 1/20 fpos(3)*1/3 fpos(4)])
    end

end