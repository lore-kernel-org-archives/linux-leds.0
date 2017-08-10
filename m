From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/3] staging: greybus: light: fix memory leak in v4l2
 register
Date: Thu, 10 Aug 2017 15:02:46 +0200
Message-ID: <cec7fc27-25eb-8769-6795-c377307c5f57@xs4all.nl>
References: <20170809111555.30147-1-sakari.ailus@linux.intel.com>
 <20170809111555.30147-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170809111555.30147-2-sakari.ailus@linux.intel.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, jacek.anaszewski@gmail.com, viresh.kumar@linaro.org, linux-leds@vger.kernel.org, laurent.pinchart@ideasonboard.com
List-Id: linux-leds@vger.kernel.org

On 09/08/17 13:15, Sakari Ailus wrote:
> From: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> We are allocating memory for the v4l2 flash configuration structure and
> leak it in the normal path. Just use the stack for this as we do not
> use it outside of this function.

I'm not sure why this is part of this patch series. This is a greybus
bug fix, right? And independent from the other two patches.

> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/staging/greybus/light.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 129ceed39829..0771db418f84 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -534,25 +534,20 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>  {
>  	struct gb_connection *connection = get_conn_from_light(light);
>  	struct device *dev = &connection->bundle->dev;
> -	struct v4l2_flash_config *sd_cfg;
> +	struct v4l2_flash_config sd_cfg = { {0} };

Just use '= {};'

>  	struct led_classdev_flash *fled;
>  	struct led_classdev *iled = NULL;
>  	struct gb_channel *channel_torch, *channel_ind, *channel_flash;
> -	int ret = 0;
> -
> -	sd_cfg = kcalloc(1, sizeof(*sd_cfg), GFP_KERNEL);
> -	if (!sd_cfg)
> -		return -ENOMEM;
>  
>  	channel_torch = get_channel_from_mode(light, GB_CHANNEL_MODE_TORCH);
>  	if (channel_torch)
>  		__gb_lights_channel_v4l2_config(&channel_torch->intensity_uA,
> -						&sd_cfg->torch_intensity);
> +						&sd_cfg.torch_intensity);
>  
>  	channel_ind = get_channel_from_mode(light, GB_CHANNEL_MODE_INDICATOR);
>  	if (channel_ind) {
>  		__gb_lights_channel_v4l2_config(&channel_ind->intensity_uA,
> -						&sd_cfg->indicator_intensity);
> +						&sd_cfg.indicator_intensity);
>  		iled = &channel_ind->fled.led_cdev;
>  	}
>  
> @@ -561,27 +556,21 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>  
>  	fled = &channel_flash->fled;
>  
> -	snprintf(sd_cfg->dev_name, sizeof(sd_cfg->dev_name), "%s", light->name);
> +	snprintf(sd_cfg.dev_name, sizeof(sd_cfg.dev_name), "%s", light->name);
>  
>  	/* Set the possible values to faults, in our case all faults */
> -	sd_cfg->flash_faults = LED_FAULT_OVER_VOLTAGE | LED_FAULT_TIMEOUT |
> +	sd_cfg.flash_faults = LED_FAULT_OVER_VOLTAGE | LED_FAULT_TIMEOUT |
>  		LED_FAULT_OVER_TEMPERATURE | LED_FAULT_SHORT_CIRCUIT |
>  		LED_FAULT_OVER_CURRENT | LED_FAULT_INDICATOR |
>  		LED_FAULT_UNDER_VOLTAGE | LED_FAULT_INPUT_VOLTAGE |
>  		LED_FAULT_LED_OVER_TEMPERATURE;
>  
>  	light->v4l2_flash = v4l2_flash_init(dev, NULL, fled, iled,
> -					    &v4l2_flash_ops, sd_cfg);
> -	if (IS_ERR_OR_NULL(light->v4l2_flash)) {
> -		ret = PTR_ERR(light->v4l2_flash);
> -		goto out_free;
> -	}
> +					    &v4l2_flash_ops, &sd_cfg);
> +	if (IS_ERR_OR_NULL(light->v4l2_flash))

Just IS_ERR since v4l2_flash_init() never returns NULL.

> +		return PTR_ERR(light->v4l2_flash);
>  
> -	return ret;
> -
> -out_free:
> -	kfree(sd_cfg);
> -	return ret;
> +	return 0;
>  }
>  
>  static void gb_lights_light_v4l2_unregister(struct gb_light *light)
> 

After those two changes:

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans
