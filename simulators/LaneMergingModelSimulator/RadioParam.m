classdef RadioParam
    properties
        tg
        id
        title
        perimeter_position
        panel
        overall_radio
        radio_title
        buttons
    end
    methods
        % varargins format: [button_name (str), value (int)]
       function obj = RadioParam(tg, path, name, title, perimeter_position, panel, varargin)
           if nargin > 0
               obj.tg = tg;
               obj.id = getparamid(obj.tg,path,name);
               obj.title = title;
               obj.panel = panel;
               obj.perimeter_position = perimeter_position;
               
               obj.overall_radio = uibuttongroup('Visible','off',...
                  'Position',perimeter_position,'Parent',obj.panel,...
                  'SelectionChangedFcn',@obj.change_fcn);
               
               switch nargin
                   case 8
                       num_buttons = 2;
                   case 9
                       num_buttons = 3;
                   case 10
                       num_buttons = 4;
                   case 11
                       num_buttons = 5;
               end
               
               obj.buttons = cell(1,2);
               
               for button_count = 1:num_buttons
                    button_info = varargin{button_count}; %list [name (str), val (int)] (third element for default one)
                    button_name = char(button_info(1));
                    obj.buttons{button_count} = uicontrol(obj.overall_radio,'Style',...
                          'radiobutton','UserData',button_info(2),...
                          'String',button_name,'Units','normalized',...
                          'Position',[.1 .5-(button_count-1)*.6/num_buttons .8 .6/num_buttons],...
                          'HandleVisibility','off');
               end
              
               obj.radio_title = uicontrol(obj.overall_radio,...
                'Style','text','String',title,'FontWeight','bold',...
                'Units','normalized','Position',[.1 .75 .8 .25]);

               obj.overall_radio.Visible = 'on';
           end
           
       end
        
        function change_fcn(obj,source,callbackdata)
              new_val = cell2mat(callbackdata.NewValue.UserData);
              setparam(obj.tg, obj.id, new_val)
        end 
    end 
end