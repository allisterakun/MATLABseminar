classdef Flower
    properties
        petalWidth
        petalLength
        sepalWidth
        sepalLength
        species
    end
    methods
        function obj = Flower(pw, pl, sw, sl, s)
            obj.petalWidth = pw;
            obj.petalLength = pl;
            obj.sepalWidth = sw;
            obj.sepalLength = sl;
            obj. species = s;
        end
        
        function SLength = getSLength(obj)
            SLength = obj.sepalLength;
        end
       
        
        function report(obj)
            disp("The length and width of its sepal are "+ obj.sepalLength+" cm and "+obj.sepalWidth+" cm respectively, while the length and width of its petal are "+ obj.petalLength+ "cm and "+ obj.petalWidth+"cm respectively. It belongs to the "+obj.species+" species.");
        end
    end
end
