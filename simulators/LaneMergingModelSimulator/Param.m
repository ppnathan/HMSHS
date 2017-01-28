classdef Param
    properties
        tg
        id
        name
        path
        sl_name
        name_pos
        edit_pos
        hstatic
        hset
        panel
        instances
    end
    methods
       function obj = Param(tg, path, sl_name, name, name_pos, edit_pos, panel)
           if nargin > 0
               obj.tg = tg;
               obj.path = path;
               obj.sl_name = sl_name;
               obj.id = getparamid(obj.tg,obj.path,obj.sl_name);
               obj.name = name;
               obj.name_pos = name_pos;
               obj.edit_pos = edit_pos;
               obj.panel = panel;
               obj.hstatic = uicontrol('Style','text',...
                  'HorizontalAlignment','Right','Parent',obj.panel,...
                  'Units','normalized','String',obj.name,...
                  'Position',name_pos);
               obj.hset = uicontrol('Style','edit',...
                  'Units','normalized','String',num2str(getparam(obj.tg, obj.id)),...
                  'Position',edit_pos,'Parent',obj.panel,...
                  'Callback',@obj.callback_func);
              
              persistent num
              if isempty(num)
                num = 1;
              else
                num = num + 1;
              end
                obj.instances = num;
              end
       end
       function callback_func(obj,source,eventdata)
       % Change parameter
          val = str2double(source.String);
          
          if isnan(val)
            val = 0;
          end
          setparam(obj.tg, obj.id, val)
          %obj.hcurrent.String = ['Current: ' num2str(getparam(obj.tg, obj.id))];
          obj.hset.String = num2str(getparam(obj.tg, obj.id));
       end
    end
end