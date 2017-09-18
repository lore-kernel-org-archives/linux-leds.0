From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: as3645a flash userland interface
Date: Mon, 18 Sep 2017 12:12:04 +0300
Message-ID: <20170918091204.245dewmyruxtfhyb@valkosipuli.retiisi.org.uk>
References: <20170912084236.1154-1-sakari.ailus@linux.intel.com>
 <20170912084236.1154-25-sakari.ailus@linux.intel.com>
 <20170912103628.GB27117@amd>
 <7b679cb3-ce58-e1d1-60bf-995896bf46eb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7b679cb3-ce58-e1d1-60bf-995896bf46eb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Tue, Sep 12, 2017 at 08:53:33PM +0200, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 09/12/2017 12:36 PM, Pavel Machek wrote:
> > Hi!
> > 
> > There were some changes to as3645a flash controller. Before we have
> > stable interface we have to keep forever I want to ask:
> 
> Note that we have already two LED flash class drivers - leds-max77693
> and leds-aat1290. They have been present in mainline for over two years
> now.
> 
> > What directory are the flash controls in?
> > 
> > /sys/class/leds/led-controller:flash ?
> > 
> > Could we arrange for something less generic, like
> > 
> > /sys/class/leds/main-camera:flash ?
> 
> I'd rather avoid overcomplicating this. LED class device name pattern
> is well defined to devicename:colour:function
> (see Documentation/leds/leds-class.txt, "LED Device Naming" section).
> 
> In this case "flash" in place of the "function" segment makes the
> things clear enough I suppose.

Oh. I have to admit I've completely missed this. :-o

I'll address this in v2 of the as3645a fixes, plus submit related V4L2
flash class documentation fixes a little later.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
