From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: Re: [PATCH 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sun, 24 Sep 2017 09:30:37 +0900
Message-ID: <4164e198-dd03-e61d-ab67-2b429c908b2f@mizrahi.com.ve>
References: <20170917033529.GA12375@olympus.mizrahi.com.ve>
 <5803b209-f857-d339-a98b-6e3d6b1dca6c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:41587 "EHLO
        mail03.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdIXAdb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 23 Sep 2017 20:33:31 -0400
In-Reply-To: <5803b209-f857-d339-a98b-6e3d6b1dca6c@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

On 2017-09-22 05:46, Jacek Anaszewski wrote:
> Hi Alan,
> 
> Thanks for the patch. I have some comments in the code below,
> please take a look.

Thanks for your comments.  I'll make the necessary changes and also
rename the LEDs to include "green", as suggested by Pavel.

> On 09/17/2017 05:35 AM, Alan Mizrahi wrote:
>> +};
>> +
>> +struct apu_led_pdata {
>> +	struct platform_device *pdev;
>> +	struct apu_led_priv *pled;
>> +	struct apu_led_profile *profile;
>> +	enum apu_led_platform_types platform;
>> +	int num_led_instances;
>> +	int iosize; /* for devm_ioremap() */
>> +	spinlock_t lock;
>> +};
>> +
>> +static struct apu_led_pdata *apu_led;
>> +
>> +static struct apu_led_profile apu1_led_profile[] = {
>> +	{ "apu:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
>> +	{ "apu:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
>> +	{ "apu:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
>> +};
> 
> Is brightness property needed at all in the struct apu_led_profile?
> It is always initialized to LED_OFF.

Not all of them, the first one is on by default.

>> +
>> +static struct apu_led_profile apu2_led_profile[] = {
>> +	{ "apu2:1", 1,       APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
>> +	{ "apu2:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
>> +	{ "apu2:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
>> +};
>> +
>> +static struct dmi_system_id apu_led_dmi_table[] __initdata = {
>> +	{
>> +		.ident = "apu",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
>> +		}
>> +	},
>> +	{
>> +		.ident = "apu2",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
>> +			DMI_MATCH(DMI_BOARD_NAME, "APU2")
>> +		}
>> +	},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> 
> You're currently not using this array anywhere. It is required when
> dmi_check_system() is used in the driver.

Without it the module information won't be written to modules.alias, and
won't be loaded automatically at boot time.

>> +
>> +static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
>> +{
>> +	int i;
>> +	int err;
>> +
>> +	apu_led->pled = devm_kzalloc(dev, sizeof(struct apu_led_priv) * apu_led->num_led_instances, GFP_KERNEL);
>> +
>> +	if (!apu_led->pled)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < apu_led->num_led_instances; i++) {
>> +		apu_led->pled[i].cdev.name = apu_led->profile[i].name;
> 
> It would improve readability if you used intermediary variables like:
> 
> struct apu_led_priv *pled = &apu_led->pled[i];
> struct led_classdev *led_cdev = &pled->led_cdev;
> 
> led_cdev->name = apu_led->profile[i].name
> 
> and so on...

I tried that but it ends up being harder, I think this is subjective.

>> +		apu_led->pled[i].cdev.brightness = apu_led->profile[i].brightness;
>> +		apu_led->pled[i].cdev.max_brightness = 1;
>> +		if (apu_led->platform == LED_PLATFORM_APU1) {
>> +			apu_led->pled[i].cdev.brightness_set = apu1_led_brightness_set;
>> +			/* apu_led->pled[i].cdev.blink_set   = apu1_led_blink_set; */
> 
> Why are you leaving this unimplemented actually? Is hw blinking feature
> documented but doesn't work as advertised or so?

After contacting the makers of these boards it looks like there is no
way to do this, so I'll remove it.


Best regards,

Alan Mizrahi
