From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 5/8] v4l2-flash: Flash ops aren't mandatory
Date: Wed, 14 Jun 2017 23:14:13 +0200
Message-ID: <3e0a8823-a8b4-3f78-25e0-22d8cb8ad090@gmail.com>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-6-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1497433639-13101-6-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, sebastian.reichel@collabora.co.uk, robh@kernel.org, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

Hi Sakari,

On 06/14/2017 11:47 AM, Sakari Ailus wrote:
> None of the flash operations are not mandatory and therefore there should
> be no need for the flash ops structure either. Accept NULL.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-flash-led-class.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> index 6d69119..fdb79da 100644
> --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> @@ -18,7 +18,7 @@
>  #include <media/v4l2-flash-led-class.h>
>  
>  #define has_flash_op(v4l2_flash, op)				\
> -	(v4l2_flash && v4l2_flash->ops->op)
> +	(v4l2_flash && v4l2_flash->ops && v4l2_flash->ops->op)

This change doesn't seem to be related to the patch subject.

>  #define call_flash_op(v4l2_flash, op, arg)			\
>  		(has_flash_op(v4l2_flash, op) ?			\
> @@ -618,7 +618,7 @@ struct v4l2_flash *v4l2_flash_init(
>  	struct v4l2_subdev *sd;
>  	int ret;
>  
> -	if (!fled_cdev || !ops || !config)
> +	if (!fled_cdev || !config)
>  		return ERR_PTR(-EINVAL);
>  
>  	led_cdev = &fled_cdev->led_cdev;
> 

-- 
Best regards,
Jacek Anaszewski
