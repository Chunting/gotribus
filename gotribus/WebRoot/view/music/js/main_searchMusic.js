// on page load


 $(document).ready(function() {

    // define api keys
    var apiKey = '1076961d68e87ca69bfb2ef6099f05fb';
    var apiSecret = 'fb0f2444f709e41434de4f3556f79108';
 
    // create a Cache object
    var cache = new LastFMCache();

    // create a LastFM object
    var lastfm = new LastFM({
        apiKey    : apiKey,
        apiSecret : apiSecret,
        cache     : cache
    });

   // var albumTitle=$('div.search_title h2:first-child').html();
   var albumTitle=${searchName};
	var length=albumTitle.length;
	albumTitle=albumTitle.substr(8,length-1);
	var html='';
	var html2='';

	
	 lastfm.album.search({album: albumTitle,limit:8,page:2}, {success: function(data){
		
		html2=$('#lastfmTemplateSearchResults').render(data.results.albummatches.album)+'<div class="clear"></div>';
		
		
		}
	});
	//***********************************************************************************
	 lastfm.album.search({album: albumTitle,limit:8,page:1}, {success: function(data){
		
		html=$('#lastfmTemplateSearchResults').render(data.results.albummatches.album)+'<div class="clear"></div>'
		alert('<div>'+html+'</div><div>'+html2+'</div>');
	    $('#gallery_book').html( 
		'<div>'+html+'</div><br><div>'+html2+'</div>'
		);
		
		}
	});
	
	
}




);