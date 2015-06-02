From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v9 2/8] media: Add registration helpers for V4L2 flash
 sub-devices
Date: Tue, 2 Jun 2015 18:32:35 +0300
Message-ID: <20150602153234.GL25595@valkosipuli.retiisi.org.uk>
References: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
 <1432566843-6391-3-git-send-email-j.anaszewski@samsung.com>
 <20150601205921.GH25595@valkosipuli.retiisi.org.uk>
 <556D73D2.20600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556D73D2.20600-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi, Jacek!

On Tue, Jun 02, 2015 at 11:13:54AM +0200, Jacek Anaszewski wrote:
> Hi Sakari,
> 
> On 06/01/2015 10:59 PM, Sakari Ailus wrote:
> >Hi Jacek,
> >
> >On Mon, May 25, 2015 at 05:13:57PM +0200, Jacek Anaszewski wrote:
> >>This patch adds helper functions for registering/unregistering
> >>LED Flash class devices as V4L2 sub-devices. The functions should
> >>be called from the LED subsystem device driver. In case the
> >>support for V4L2 Flash sub-devices is disabled in the kernel
> >>config the functions' empty versions will be used.
> >>
> >>Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >>Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> >>Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> >
> >Thanks for adding indicator support!
> >
> >Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >
> 
> I missed one thing - sysfs interface of the indicator LED class
> also has to be disabled/enabled of v4l2_flash_open/close.

Good catch.

> 
> I am planning to reimplement the functions as follows,
> please let me know if you see any issues here:
> 
> static int v4l2_flash_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh
> *fh)
> {
>         struct v4l2_flash *v4l2_flash = v4l2_subdev_to_v4l2_flash(sd);
> 
>         struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> 
>         struct led_classdev *led_cdev = &fled_cdev->led_cdev;
>         struct led_classdev_flash *iled_cdev = v4l2_flash->iled_cdev;
> 
>         struct led_classdev *led_cdev_ind;
> 
>         int ret = 0;

I think you could spare some newlines above (and below as well).

> 
> 
>         mutex_lock(&led_cdev->led_access);
> 
> 
>         if (!v4l2_fh_is_singular(&fh->vfh))
> 
>                 goto unlock;
> 
> 
>         led_sysfs_disable(led_cdev);
>         led_trigger_remove(led_cdev);
> 
> 
>         if (iled_cdev) {
>                 led_cdev_ind = &iled_cdev->led_cdev;

You can also declare led_cdev_ind here as you don't need it outside the
basic block.

> 
> 
>                 mutex_lock(&led_cdev_ind->led_access);
> 
> 
>                 led_sysfs_disable(led_cdev_ind);
>                 led_trigger_remove(led_cdev_ind);
> 
> 
>                 mutex_unlock(&led_cdev_ind->led_access);

Please don't acquire the indicator mutex while holding the flash mutex. I
don't think there's a need to do so, thus creating a dependency between the
two. Just remember to check for v4l2_fh_is_singular() in both cases.

> 
>         }
> 
> 
>         ret = __sync_device_with_v4l2_controls(v4l2_flash);

If ret is < 0 here, you end up disabling the sysfs interface while open()
fails (and v4l2_flash_close() will not be run). Shouldn't you handle that?

> 
> 
> unlock:
>         mutex_unlock(&led_cdev->led_access);
> 
>         return ret;
> 
> }
> 
> 
> static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh
> *fh)
> {
>         struct v4l2_flash *v4l2_flash = v4l2_subdev_to_v4l2_flash(sd);
> 
>         struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> 
>         struct led_classdev *led_cdev = &fled_cdev->led_cdev;
>         struct led_classdev_flash *iled_cdev = v4l2_flash->iled_cdev;
> 
>         struct led_classdev *led_cdev_ind;
> 
>         int ret = 0;
> 
> 
>         mutex_lock(&led_cdev->led_access);
> 
> 
>         if (v4l2_fh_is_singular(&fh->vfh)) {
>                 if (v4l2_flash->ctrls[STROBE_SOURCE])
>                         ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[STROBE_SV4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> 
>                 led_sysfs_enable(led_cdev);
> 
> 
>                 if (iled_cdev) {
>                         led_cdev_ind = &iled_cdev->led_cdev;
> 
> 
>                         mutex_lock(&led_cdev_ind->led_access);

Ditto.

> 
> 
>                         led_sysfs_enable(led_cdev_ind);
> 
> 
>                         mutex_unlock(&led_cdev_ind->led_access);
> 
>                 }
> 
> 
>         }
> 
> 
>         mutex_unlock(&led_cdev->led_access);
> 
> 
>         return ret;
> 
> }
> 
> 

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
