classdef Signal
    properties
        tg
        path
        id
        name
        name_pos
        val_pos
        hstatic
        hcurrent
        panel
        instances
    end
    methods
       function obj = Signal(tg, path, name, name_pos, val_pos, panel)
           if nargin > 0
               obj.tg = tg;
               obj.path = path;
               obj.id = getsignalid(obj.tg,obj.path);
               obj.name = name;
               obj.name_pos = name_pos;
               obj.val_pos = val_pos;
               obj.panel = panel;
               obj.hstatic = uicontrol('Style','text',...
                  'HorizontalAlignment','Right','Parent',obj.panel,...
                  'Units','normalized','String',obj.name,'HorizontalAlignment','center',...
                  'Position',obj.name_pos);
               obj.hcurrent = uicontrol('Style','text',...
                  'Units','normalized','String',num2str(getsignal(obj.tg, obj.id)),...
                  'Position',obj.val_pos,'HorizontalAlignment','center',...
                  'Parent',obj.panel);
              
              persistent num
              if isempty(num)
                num = 1;
              else
                num = num + 1;
              end
                obj.instances = num;
           end
       end
       function update(obj)
           obj.hcurrent.String = num2str(getsignal(obj.tg, obj.id));
       end
    end
end