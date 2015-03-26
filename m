From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Fri, 27 Mar 2015 01:30:25 +0200
Message-ID: <20150326233025.GR18321@valkosipuli.retiisi.org.uk>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ricardo,

On Sat, Mar 14, 2015 at 12:05:39AM +0100, Ricardo Ribalda Delgado wrote:
> @@ -219,12 +239,19 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>   */
>  int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  {
> +	char name[64];
> +	int ret;
> +
> +	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>  	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
> -					led_cdev, led_cdev->groups,
> -					"%s", led_cdev->name);
> +					led_cdev, led_cdev->groups, name);

I just realised there was another issue --- the name is now interpreted as
format string. Bad things will happen if there's e.g. %s in the name itself
--- perhaps unlikely, but possible.

Now that I was about to submit a patch, I'll submit one for this one as
well. :-)

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
