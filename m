From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/4] leds: core: add color LED sysfs extension
Date: Tue, 29 Mar 2016 12:03:47 +0200
Message-ID: <20160329100347.GB24964@amd>
References: <56D60960.1020504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56D60960.1020504@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue 2016-03-01 22:28:00, Heiner Kallweit wrote:
> Extend brightness sysfs property handling to deal with monochrome
> and color mode as well.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - split from patch 1
> v3:
> - moved one change (led_is_off) to patch 1
> v4:
> - changed printf format string to %#.6x
> v5:
> - no changes
> ---
>  drivers/leds/led-class.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 007a5b3..8a3748a 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -32,7 +32,10 @@ static ssize_t brightness_show(struct device *dev,
>  	/* no lock needed for this */
>  	led_update_brightness(led_cdev);
>  
> -	return sprintf(buf, "%u\n", led_cdev->brightness);
> +	if (led_cdev->brightness > LED_FULL)
> +		return sprintf(buf, "%#.6x\n", led_cdev->brightness);
> +	else
> +		return sprintf(buf, "%u\n", led_cdev->brightness);
>  }
>  
>  static ssize_t brightness_store(struct device *dev,

No... I don't think you should change interface for existing file like
this.

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
