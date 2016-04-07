classdef SignalArray
    properties
        tg
        path
        nums
        ids
        values
    end
    methods
       function obj = SignalArray(tg, path, nums)
           if nargin > 0
               obj.tg = tg;
               obj.path = path;
               obj.nums = nums;
               
               for signal_number = 1:length(obj.nums)
                   obj.ids(signal_number) = getsignalid(obj.tg,strcat(obj.path,'/s',num2str(obj.nums(signal_number))));
               end
               
               for signal_number = 1:length(obj.nums)
                    obj.values(signal_number) = getsignal(obj.tg,obj.ids(signal_number));
               end
           end
       end
       function obj = update_array(obj)
               for signal_number = 1:length(obj.nums)
                   obj.values(signal_number) = getsignal(obj.tg,obj.ids(signal_number));
               end
       end
    end
end