#A quick hack script to generate a site with as many cat pictures you want :)


@no_of_cats = 100 
@loremimgurl="http://lorempixel.com/300/200/cats/PG%20SG%20CDN%20Cats"
@directory="."


def get_images(no_of_cats)
   puts "Generating images"
   no_of_cats.times do |i|

     cmd = "time curl \"#{@loremimgurl}#{i}/\" > #{@directory}/images/cat_#{i}.jpg"
     system(cmd)
    
   end
end

get_images(@no_of_cats)


html_content=<<HERE
<HTML>
 <HEAD>
   <TITLE> Cat Site (#{Time.now})
   </TITLE>
 </HEAD>
 <BODY>

HERE

@img_tags = " "


 @no_of_cats.times do |i|
     img_tag = " <img src=\"images/cat_#{i}.jpg\" /> "
     @img_tags << img_tag
 end
 

html_content << @img_tags


html_content +=<<HERE
 </BODY>
 </HTML>

HERE


File.open("#{@directory}/index.htm", 'w') {|f| f.write(html_content) }
