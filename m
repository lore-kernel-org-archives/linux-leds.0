From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 5/8] v4l2-flash: Flash ops aren't mandatory
Date: Thu, 15 Jun 2017 00:19:40 +0300
Message-ID: <20170614211939.GR12407@valkosipuli.retiisi.org.uk>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-6-git-send-email-sakari.ailus@linux.intel.com>
 <3e0a8823-a8b4-3f78-25e0-22d8cb8ad090@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3e0a8823-a8b4-3f78-25e0-22d8cb8ad090-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Wed, Jun 14, 2017 at 11:14:13PM +0200, Jacek Anaszewski wrote:
> Hi Sakari,
> 
> On 06/14/2017 11:47 AM, Sakari Ailus wrote:
> > None of the flash operations are not mandatory and therefore there should
> > be no need for the flash ops structure either. Accept NULL.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 6d69119..fdb79da 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -18,7 +18,7 @@
> >  #include <media/v4l2-flash-led-class.h>
> >  
> >  #define has_flash_op(v4l2_flash, op)				\
> > -	(v4l2_flash && v4l2_flash->ops->op)
> > +	(v4l2_flash && v4l2_flash->ops && v4l2_flash->ops->op)
> 
> This change doesn't seem to be related to the patch subject.

Yes, it is: if there's a chance that ops is NULL, then you have to test here
you actually have the ops struct around. The test is no longer in
v4l2_flash_init().

> 
> >  #define call_flash_op(v4l2_flash, op, arg)			\
> >  		(has_flash_op(v4l2_flash, op) ?			\
> > @@ -618,7 +618,7 @@ struct v4l2_flash *v4l2_flash_init(
> >  	struct v4l2_subdev *sd;
> >  	int ret;
> >  
> > -	if (!fled_cdev || !ops || !config)
> > +	if (!fled_cdev || !config)
> >  		return ERR_PTR(-EINVAL);
> >  
> >  	led_cdev = &fled_cdev->led_cdev;
> > 

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
