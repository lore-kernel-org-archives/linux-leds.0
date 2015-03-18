From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH/RFC v13 10/13] Documentation: leds: Add description of
 v4l2-flash sub-device
Date: Wed, 18 Mar 2015 14:39:57 +0200
Message-ID: <20150318123957.GH11954@valkosipuli.retiisi.org.uk>
References: <1426175114-14876-1-git-send-email-j.anaszewski@samsung.com>
 <1426175114-14876-11-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426175114-14876-11-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Thu, Mar 12, 2015 at 04:45:11PM +0100, Jacek Anaszewski wrote:
> This patch extends LED Flash class documention by
> the description of interactions with v4l2-flash sub-device.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  Documentation/leds/leds-class-flash.txt |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class-flash.txt b/Documentation/leds/leds-class-flash.txt
> index 19bb673..8623413 100644
> --- a/Documentation/leds/leds-class-flash.txt
> +++ b/Documentation/leds/leds-class-flash.txt
> @@ -20,3 +20,16 @@ Following sysfs attributes are exposed for controlling flash LED devices:
>  	- max_flash_timeout
>  	- flash_strobe
>  	- flash_fault
> +
> +A LED subsystem driver can be controlled also from the level of VideoForLinux2
> +subsystem. In order to enable this CONFIG_V4L2_FLASH_LED_CLASS symbol has to
> +be defined in the kernel config. The driver must call the v4l2_flash_init
> +function to get registered in the V4L2 subsystem. On remove the
> +v4l2_flash_release function has to be called (see <media/v4l2-flash.h>).
> +
> +After proper initialization a V4L2 Flash sub-device is created. The sub-device
> +exposes a number of V4L2 controls, which allow for controlling a LED Flash class

Over 80 characters per line.

With this fixed,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +device with use of its internal kernel API.
> +Opening the V4L2 Flash sub-device makes the LED subsystem sysfs interface
> +unavailable. The interface is re-enabled after the V4L2 Flash sub-device
> +is closed.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
