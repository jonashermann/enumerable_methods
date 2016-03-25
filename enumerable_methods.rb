class Array 
     
     def my_each
       for i in 0..self.length-1
            yield self[i]
       end
        self	
     end

     def my_each_with_index
     	for i in 0..self.length-1
        yield i, self[i] 
     	end	
     	 self
     end

     def my_select
     	arr = []
     	for i in 0..self.length-1
     		s = yield self[i]
     		if s == true
          arr.push self[i]
        end 
     	end	
     	arr
     end

     def my_all?
     	ans = []
     	for i in 0..self.length-1
          res = yield self[i]
           ans.push res
     	end	
          if ans.my_include? false 
          	return false
          else
           return true	
          end 
     end

     def my_include?(el) 
     	j = 0
     	for i in 0..self.length-1
     		if el == self[i]
     			return true
     		else
     		    j += 1	
     		end
     	end	
     		if j == length
     		   return false
     		end       
     	
     end

     def my_any?
     	ans = []
     	for i in 0..self.length-1
          res = yield self[i]
          ans.push res
        end  
        if ans.my_include? true
        	return true
        else
            return false
        end     	
     end

     def my_none?
     	ans = []
     	for i in 0..self.length-1
              res = yield self[i]
              ans.push res  
        end 
          if !ans.my_include? true
          	 return true
          else
              return false
          end    	 
     end

     def my_count(el)
      number_occurence = 0 
       
          self.my_each do|e|   
               if e == el
                 number_occurence += 1
               end
          end
       
       number_occurence
     end


     def my_count_with_block
      res = []
       for i in 0..self.length-1
          v = yield self[i]
          res.push v
       end
         res.my_count(true)
     end

     def my_map(proc, &bloc)
      res = []
       if proc.nil?
        for i in 0..self.length-1
             r = yield self[i]
             res.push r
         end 
          return res
       end 

     unless block_given?
     for i in 0..self.length-1
       r = proc.call self[i]
       res.push r
     end
     return res
   else
       for i in 0..self.length-1
         a = proc.call self[i]
         b = yield self[i]
         res.push a
         res.push b 
       end  
       return res
    end   

     def my_inject
      res = 1
       for i in 0..self.length-1
        res = yield self[i], res
       end
       res
     end

    end 
end