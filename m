From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: as3645a flash userland interface
Date: Tue, 12 Sep 2017 20:53:33 +0200
Message-ID: <7b679cb3-ce58-e1d1-60bf-995896bf46eb@gmail.com>
References: <20170912084236.1154-1-sakari.ailus@linux.intel.com>
 <20170912084236.1154-25-sakari.ailus@linux.intel.com>
 <20170912103628.GB27117@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912103628.GB27117@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 09/12/2017 12:36 PM, Pavel Machek wrote:
> Hi!
> 
> There were some changes to as3645a flash controller. Before we have
> stable interface we have to keep forever I want to ask:

Note that we have already two LED flash class drivers - leds-max77693
and leds-aat1290. They have been present in mainline for over two years
now.

> What directory are the flash controls in?
> 
> /sys/class/leds/led-controller:flash ?
> 
> Could we arrange for something less generic, like
> 
> /sys/class/leds/main-camera:flash ?

I'd rather avoid overcomplicating this. LED class device name pattern
is well defined to devicename:colour:function
(see Documentation/leds/leds-class.txt, "LED Device Naming" section).

In this case "flash" in place of the "function" segment makes the
things clear enough I suppose.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
