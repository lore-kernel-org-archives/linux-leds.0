From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 01/12] leds: core: Use EXPORT_SYMBOL_GPL consistently
Date: Thu, 8 Oct 2015 17:51:07 +0200
Message-ID: <20151008155107.GJ11776@xo-6d-61-c0.localdomain>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
 <1443445641-9529-2-git-send-email-j.anaszewski@samsung.com>
 <56095923.7090600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56095923.7090600@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

On Mon 2015-09-28 17:13:39, Jacek Anaszewski wrote:
> This patch isn't going to be applied since it can cause
> legal implications for existing users.
>

Are there any? Best do this ASAP :-).
							Pavel
 
> On 09/28/2015 03:07 PM, Jacek Anaszewski wrote:
> >LED core has a mixture of EXPORT_SYMBOL and EXPORT_SYMBOL_GPL macros.
> >This patch fixes this discrepancy and switches to using EXPORT_SYMBOL_GPL
> >for each exported function.
> >
> >Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> >---
> >  drivers/leds/led-core.c |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> >index 549de7e..c1dd545 100644
> >--- a/drivers/leds/led-core.c
> >+++ b/drivers/leds/led-core.c
> >@@ -83,7 +83,7 @@ void led_blink_set(struct led_classdev *led_cdev,
> >
> >  	led_blink_setup(led_cdev, delay_on, delay_off);
> >  }
> >-EXPORT_SYMBOL(led_blink_set);
> >+EXPORT_SYMBOL_GPL(led_blink_set);
> >
> >  void led_blink_set_oneshot(struct led_classdev *led_cdev,
> >  			   unsigned long *delay_on,
> >@@ -104,7 +104,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
> >
> >  	led_blink_setup(led_cdev, delay_on, delay_off);
> >  }
> >-EXPORT_SYMBOL(led_blink_set_oneshot);
> >+EXPORT_SYMBOL_GPL(led_blink_set_oneshot);
> >
> >  void led_stop_software_blink(struct led_classdev *led_cdev)
> >  {
> >@@ -139,7 +139,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
> >  		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
> >  			ret);
> >  }
> >-EXPORT_SYMBOL(led_set_brightness);
> >+EXPORT_SYMBOL_GPL(led_set_brightness);
> >
> >  int led_update_brightness(struct led_classdev *led_cdev)
> >  {
> >@@ -155,7 +155,7 @@ int led_update_brightness(struct led_classdev *led_cdev)
> >
> >  	return ret;
> >  }
> >-EXPORT_SYMBOL(led_update_brightness);
> >+EXPORT_SYMBOL_GPL(led_update_brightness);
> >
> >  /* Caller must ensure led_cdev->led_access held */
> >  void led_sysfs_disable(struct led_classdev *led_cdev)
> >
> 
> 
> -- 
> Best Regards,
> Jacek Anaszewski
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
