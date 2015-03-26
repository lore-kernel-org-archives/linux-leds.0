From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 3/3] leds: Add ktd2692 flash LED driver
Date: Thu, 26 Mar 2015 11:54:15 +0200
Message-ID: <20150326095414.GQ18321@valkosipuli.retiisi.org.uk>
References: <1427247044-3748-1-git-send-email-ingi2.kim@samsung.com>
 <1427247044-3748-4-git-send-email-ingi2.kim@samsung.com>
 <20150325135336.GM18321@valkosipuli.retiisi.org.uk>
 <55139187.4000301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55139187.4000301@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ingi,

On Thu, Mar 26, 2015 at 01:56:39PM +0900, Ingi Kim wrote:
...
> >> +	depends on LEDS_CLASS_FLASH && GPIOLIB
> >> +	help
> >> +	  This option enables support for the KTD2692 connected through
> >> +	  ExpressWire Interface. Say Y to enabled these.
> >> +	  It depends on LEDS_CLASS_FLASH for using flash led (strobe) and
> >> +	  GPIOLIB for using gpio pin to control Expresswire interface
> > 
> > The dependencies are shown by make *config, I would drop them from here.
> > 
> 
> Did you mean help message about dependencies? or config (LEDS_CLASS_FLASH, GPIOLIB)
> if you mean latter, I don't know exactly what you say.
> if it wasn't, I should drop superfluous help message

Just the dependencies in the help message, please. The rest of the help
message is fine IMO.

> >> +
> >>  comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
> >>  
> >>  config LEDS_BLINKM

...

> >> +static void ktd2692_led_regulator_enable(struct ktd2692_context *led)
> >> +{
> >> +	struct led_classdev_flash *fled_cdev = &led->fled_cdev;
> >> +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
> >> +	int ret;
> >> +
> >> +	if (regulator_is_enabled(led->regulator) > 0)
> >> +		return;
> > 
> > What's the purpose of this? Why not to just call regulator_enable() instead?
> > 
> > This way you could easily mess up with other users of the same regulator.
> > 
> 
> I want to harmonize all APIs in here...
> 
> but I'd better simplify code if it would make a mess

What is now possible:

1. driver x: regulator_enable(), which turns on the regulator

2. ktd2692 sees the regulator is enabled and will not increase the use count

3. ktd2692: regulator_disable()

4. driver x still needs needs the regulator, but it was disabled by ktd2692

So, you must call regulator_enable() and regulator_disable()
unconditionally. I'd put this where ktd2692_led_regulator_enable() and
ktd2692_led_regulator_disable() are called now.

> 
> >> +
> >> +	ret = regulator_enable(led->regulator);
> >> +	if (ret)
> >> +		dev_err(led_cdev->dev, "Failed to enable vin:%d\n", ret);
> >> +}
> >> +
> >> +static void ktd2692_led_regulator_disable(struct ktd2692_context *led)
> >> +{
> >> +	struct led_classdev_flash *fled_cdev = &led->fled_cdev;
> >> +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
> >> +	int ret;
> >> +
> >> +	if (!regulator_is_enabled(led->regulator))
> >> +		return;
> >> +
> >> +	ret = regulator_disable(led->regulator);
> >> +	if (ret)
> >> +		dev_err(led_cdev->dev, "Failed to disable vin:%d\n", ret);
> >> +}

...

> >> +static int ktd2692_probe(struct platform_device *pdev)
> >> +{
> >> +	struct ktd2692_context *led;
> >> +	struct led_classdev *led_cdev;
> >> +	struct led_classdev_flash *fled_cdev;
> >> +	struct led_flash_setting flash_timeout;
> >> +	u32 flash_timeout_us;
> >> +	int ret;
> >> +
> >> +	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> >> +	if (!led)
> >> +		return -ENOMEM;
> >> +
> >> +	if (!pdev->dev.of_node)
> >> +		return -ENXIO;
> >> +
> >> +	fled_cdev = &led->fled_cdev;
> >> +	led_cdev = &fled_cdev->led_cdev;
> >> +
> >> +	ret = ktd2692_parse_dt(led, &pdev->dev, &flash_timeout_us);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	led->regulator = devm_regulator_get(&pdev->dev, "vin");
> >> +	if (IS_ERR(led->regulator)) {
> >> +		dev_err(&pdev->dev, "regulator get failed\n");
> >> +		return PTR_ERR(led->regulator);
> >> +	}
> >> +
> >> +	ktd2692_init_flash_timeout(flash_timeout_us, &flash_timeout);
> >> +
> >> +	fled_cdev->timeout = flash_timeout;
> >> +	fled_cdev->ops = &flash_ops;
> >> +
> >> +	led_cdev->name = KTD2692_DEFAULT_NAME;
> >> +	led_cdev->brightness_set = ktd2692_led_brightness_set;
> >> +	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
> >> +	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
> >> +	led_cdev->flags |= LED_DEV_CAP_FLASH;
> > 
> > You could unify the above two lines.
> > 
> 
> Is it better to unify code than separate?

I'd think so.

> 
> >> +
> >> +	mutex_init(&led->lock);
> >> +	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
> >> +
> >> +	platform_set_drvdata(pdev, led);
> >> +
> >> +	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
> >> +	if (ret) {
> >> +		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
> > 
> > You should do mutex_destroy() here.
> > 
> 
> Right. I should do
> Thanks
> 
> >> +		cancel_work_sync(&led->work_brightness_set);
> >> +		return ret;
> >> +	}
> >> +
> > 
> > This is a LED flash device. Do you intend to add support for the V4L2 flash
> > API as well?
> > 
> 
> I hope :-)
> maybe I would support extend version later

Another patch later is fine IMO.

> 
> >> +	ktd2692_setup(led);
> >> +	ktd2692_led_regulator_enable(led);
> > 
> > Hmm. I guess the regulator was already enabled, assuming you have tested
> > this. :-)
> > 
> 
> Oh, I'll check.
> Isn't it necessary to use this API if the regulator was enabled?

It is. Because you use the ktd2692 chip before enabling the regulator, the
regulator must have been enabled previously by something else than ktd2692
driver.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
