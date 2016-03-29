From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 4/4] leds: core: add support for RGB LED's
Date: Tue, 29 Mar 2016 12:05:35 +0200
Message-ID: <20160329100535.GC24964@amd>
References: <56D60B4C.5000506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56D60B4C.5000506-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tue 2016-03-01 22:36:12, Heiner Kallweit wrote:
> Export a function to convert HSV color values to RGB.
> It's intended to be called by drivers for RGB LEDs.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2:
> - move hsv -> rgb conversion to separate file
> - remove flag LED_DEV_CAP_RGB
> v3:
> - call led_hsv_to_rgb only if LED_DEV_CAP_HSV is set
>   This is needed in cases when we have monochrome and color LEDs
>   as well in a system.
> v4:
> - Export led_hsv_to_rgb and let the device driver call it instead
>   of doing the conversion in the core
> v5:
> - don't ignore led_cdev->brightness_get silently if LED_DEV_CAP_RGB
>   is set but warn
> ---
>  drivers/leds/led-class.c    |  7 +++++++
>  drivers/leds/led-rgb-core.c | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h        |  8 ++++++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 8a3748a..a4b144e 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -193,6 +193,13 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  	char name[64];
>  	int ret;
>  
> +	/*
> +	 * for now reading back the color is not supported as multiple
> +	 * HSV -> RGB -> HSV conversions may distort the color due to
> +	 * rounding issues in the conversion algorithm
> +	 */
> +	WARN_ON(led_cdev->flags & LED_DEV_CAP_RGB && led_cdev->brightness_get);
> +

Backtrace is useless here, you may want to add some ()s and you don't
really want user to be causing messages in syslog this easily.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
