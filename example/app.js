
// This is a single context application with mutliple windows in a stack
(function() {
	
	var win = Ti.UI.createWindow({backgroundColor: '#fff'});
	var hflip = require('com.hflip');
	
    var orig_image = Ti.UI.createImageView({ image: '/images/test.png', top:0});
    
    win.add(orig_image);
	
    Ti.API.info("module is => " + hflip);

    hflip.addEventListener('flipped',function(ev) {
        Ti.API.info(JSON.stringify(ev));
       var my_image = Ti.UI.createImageView({ image: ev.image, bottom: 0});
       win.add(my_image);
    });
    
    
	win.open();
	
	hflip.flipthis(orig_image.toImage());
	
})();
