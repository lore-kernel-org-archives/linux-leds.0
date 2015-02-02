From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Reading /sys with side effects (was Re: [PATCH 1/2]
 Documentation: leds: Add description of LED Flash class extension)
Date: Mon, 2 Feb 2015 14:51:03 +0100
Message-ID: <20150202135103.GB26985@amd>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <20150127221958.GA18993@amd>
 <54C8A130.8000807@samsung.com>
 <20150129211420.GA21140@amd>
 <54CB4702.1090508@samsung.com>
 <20150130164027.GA25830@kroah.com>
 <54CF3E36.9000108@samsung.com>
 <20150202094435.GA6686@amd>
 <54CF65CB.3060207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54CF65CB.3060207@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Greg KH <greg@kroah.com>, kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

Hi!

> >[Actually, you could _always_ do two reads on those devices, discard
> >first result, and return the second. But I'm not sure how hardware
> >will like that.]
> 
> This would be the most sensible option.
> 
> 
> However, let's analyze the typical use cases for flash strobing:
> 
> 
> -------------------------------------------------------------
> 
> 
> >>>>>>>> Version without faults caching:
> 
> ============
> Driver side:
> ============
> 
> read_faults()
> 	faults = read_i2c(); //read faults
> 	if faults
> 		write_i2c(); //clear faults, only for some devices
> 		faults = read_i2c(); //read faults
> 	return faults
> 
> ================
> User space side:
> ================
> 
> 1. faults = `cat flash_faults` //read_faults()
> 2. if faults then
> 	print "Unable to strobe the flash LED due to faults"
>    else
> 	echo 1 > flash_strobe
> 
> 
> >>>>>>>> Version with faults caching:
> 
> ============
> Driver side:
> ============
> 
> read_faults()
> 	faults |= read_i2c(); //read faults
> 
> clear_faults()
> 	write_i2c(); //clear faults
> 	faults = 0;
> 
> 
> ================
> User space side:
> ================
> 
> 1. faults = `cat flash_faults` //read_faults()
> 2. if faults then
> 	echo 0 > flash_faults  //clear_faults()
> 	faults = `cat flash_faults` //read_faults()
> 3, if !faults
> 	echo 1 > flash_strobe
>    else
> 	print "Unable to strobe the flash LED due to faults"
> 
> 
> -------------------------------------------------------------
> 
> From the above it seems that version with clearing faults on read
> results in the simpler flash strobing procedure on userspace side,
> by the cost of additional bus access on the driver side.

I like caching version more (as it will allow by-hand debugging of
"why did not flash fire? Aha, lets see in the file, there was fault),
but both should be acceptable.

> we don't need additional attribute, just writing the flash_faults
> attribute can do the clearing.

Yes, writing flash_faults to clear is acceptable.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
