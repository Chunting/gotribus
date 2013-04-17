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

    var albumTitle=$('div#music_title h2:first-child').html();
	var artistName= $('ul.kings_list li:last-child').html();
	var length=artistName.length;
	artistName=artistName.substr(8,length-1);
	albumTitle=albumTitle.replace(/&amp;/g,'');
	artistName=artistName.replace(/&amp;/g,'');
	
	
	var albumSummary='We have no description for this album yet';
	
	
	//***********************************************************************************
	 lastfm.album.getInfo({album: albumTitle,artist:artistName,autocorrect:1}, {success: function(data){
	    
		var date=data.album.releasedate;
		length=date.length;
		date=date.substr(0,length-7);
		if (date!=""){
        $('ul.kings_list li:first-child').html( 
			//$('#lastfmTemplateTracksinfo').render(data.album)
			'Release Date: '+date
		);
		}
		
		
		if(data.album.wiki){
			albumSummary=data.album.wiki.summary;
		}
		$('div.brief_content p').html(albumSummary);
		
		}
	});
	
	/**
	 lastfm.track.getInfo({track: 'Best in Show',artist:'Jackyl'}, {success: function(data){
	 
	    
        $('ul.kings_list').html( 
		  $('#lastfmTemplateTracksinfo').render(data.track)
        );
		albumId=data.track.album.mbid;
		alert(albumId);
			
	
      
		 }
	});
		**/
	
	

	
	//*********************************************************************************
}




);