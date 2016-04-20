From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] drivers: led: is31fl319x: 6/9-channel light effect led
 driver
Date: Wed, 20 Apr 2016 23:04:11 +0200
Message-ID: <5717EECB.8010401@gmail.com>
References: <cover.1461004995.git.hns@goldelico.com>
 <75127f4bf2bb11343bdff5bfb1129a092e668c61.1461004995.git.hns@goldelico.com>
 <20160418212504.29d67592.drivshin.allworx@gmail.com>
 <80A3B3D8-2309-4A41-91F9-4A2EE6DDF975@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32904 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbcDTVEm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 Apr 2016 17:04:42 -0400
In-Reply-To: <80A3B3D8-2309-4A41-91F9-4A2EE6DDF975@goldelico.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>, "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org

Hi Nikolaus,

On 04/19/2016 07:21 PM, H. Nikolaus Schaller wrote:
> Hi David,
>
>
>> Am 19.04.2016 um 03:25 schrieb David Rivshin (Allworx) <drivshin.allworx@gmail.com>:
[...]
>>> +struct is31fl319x_chip {
>>> +	struct i2c_client	*client;
>>> +	struct work_struct	work;
>>> +	bool			work_scheduled;
>>> +	spinlock_t		lock;
>>> +	u8			reg_file[IS31FL319X_REG_CNT];
>>
>> I would suggest using the regmap infrastructure if you need
>> to cache the register values. It also helpfully exports a
>> debugfs interface.
>
> There was an issue with regmap I don't exactly remember.
>
> Maybe it was because it is impossible to read (initial) values from the
> chip.
 >
> Only write new ones. And check for chip presence can also only be
> done by checking if it responds or fails to a write command. So we would
> have to use tricks to make regmap work as intended.

Wouldn't it be enough to write Reset Register, to check
the device presence? You would hit two birds with one stone,
by having registers reset to a known default state, according
to the documentation.

> And it may introduce overhead in initialization and does
> not save memory.
>
>>
>>> +
>>> +	struct is31fl319x_led {
>>> +		struct is31fl319x_chip	*chip;
>>> +		struct led_classdev	led_cdev;
>>> +	} leds[NUM_LEDS];
>>> +};
>>> +
>>> +static const struct i2c_device_id is31fl319x_id[] = {
>>> +	{ "is31fl3196", 6 },
>>> +	{ "is31fl3196", 9 },
>
> ^^^there is also a bug using is31fl3196 twice
>
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, is31fl319x_id);
>>> +
>>> +
>>> +static int is31fl319x_write(struct is31fl319x_chip *is31, u8 reg, u8 byte)
>>> +{
>>> +	struct i2c_client *cl = is31->client;
>>> +
>>> +	if (reg >= IS31FL319X_REG_CNT)
>>> +		return -EIO;
>>> +	is31->reg_file[reg] = byte;	/* save in cache */
>>> +	dev_dbg(&is31->client->dev, "write %02x to reg %02x\n", byte, reg);
>>> +	return i2c_smbus_write_byte_data(cl, reg, byte);
>>> +}
>>> +
>>> +static int is31fl319x_read(struct is31fl319x_chip *is31, u8 reg)
>>> +{
>>> +	if (reg >= IS31FL319X_REG_CNT)
>>> +		return -EIO;
>>> +	return is31->reg_file[reg];	/* read crom cache (can't read chip) */
>>> +}
>>> +
>>> +static void is31fl319x_work(struct work_struct *work)
>>> +{
>>> +	struct is31fl319x_chip *is31 = container_of(work,
>>> +						    struct is31fl319x_chip,
>>> +						    work);
>>> +	unsigned long flags;
>>> +	int i;
>>> +	u8 ctrl1, ctrl2;
>>> +
>>> +	dev_dbg(&is31->client->dev, "work called\n");
>>> +
>>> +	spin_lock_irqsave(&is31->lock, flags);
>>> +	/* make subsequent changes run another schedule_work */
>>> +	is31->work_scheduled = false;
>>> +	spin_unlock_irqrestore(&is31->lock, flags);
>>
>> I believe the LEDS core now handles the workqueues generically for
>> blocking operations, so it's no longer needed in the individual drivers.
>
> We had a lot of trouble with locking and blocking especially if we
> want to indicate CPU or (root) disk activity.

What kind of troubles you had? Could you share more details?
Does it mean that current LED core design doesn't fit for your
use cases?

> So it is implemented in a way that changes can be requested faster
> than the I2C bus can write new values to the chip.
>
> Only after one sequence of I2C writes is done, another work function
> can be scheduled. And each group of writes updates as many LEDs
> in parallel if necessary.

You can serialize the operations in brightness_set_blocking with
a mutex.

>>
>>> +
>>> +	dev_dbg(&is31->client->dev, "write to chip\n");
>>> +
>>> +	ctrl1 = 0;
>>> +	ctrl2 = 0;
>>> +
>>> +	for (i = 0; i < NUM_LEDS; i++) {
>>> +		struct led_classdev *led = &is31->leds[i].led_cdev;
>>> +		bool on;
>>> +
>>> +		if (!is31->leds[i].led_cdev.name)
>>> +			continue;
>>> +
>>> +		dev_dbg(&is31->client->dev, "set brightness %u for led %u\n",
>>> +					    led->brightness, i);
>>> +
>>> +		/* update brightness register */
>>> +		is31fl319x_write(is31, IS31FL319X_PWM1 + i, led->brightness);
>>> +
>>> +		/* update output enable bits */
>>> +		on = led->brightness > LED_OFF;
>>> +		if (i < 3)
>>> +			ctrl1 |= on << i;	/* 0..2 => bit 0..2 */
>>> +		else if (i < 6)
>>> +			ctrl1 |= on << (i+1);	/* 3..5 => bit 4..6 */
>>> +		else
>>> +			ctrl2 |= on << (i-6);	/* 6..8 => bit 0..2 */
>>> +	}
>>
>> Is any locking needed while iterating over is31->leds[]? Is there any
>> opportunity for a race?
>
> No, because our locking mechanism ensures that only one work function
> is running at a time.
>
> Yes there is a small race if a brightness value is updated by an interrupt.
>
> But since the worker is already running, another one will be scheduled that
> will fix the value. So for an invisibly short moment there might be the wrong value.
>
>>
>>> +
>>> +	/* check if any PWM is enabled or all outputs are now off */
>>> +	if (ctrl1 > 0 || ctrl2 > 0) {
>>> +		dev_dbg(&is31->client->dev, "power up\n");
>>> +		is31fl319x_write(is31, IS31FL319X_CTRL1, ctrl1);
>>> +		is31fl319x_write(is31, IS31FL319X_CTRL2, ctrl2);
>>> +		/* update PWMs */
>>> +		is31fl319x_write(is31, IS31FL319X_DATA_UPDATE, 0x00);
>>> +		/* enable chip from shut down */
>>> +		is31fl319x_write(is31, IS31FL319X_SHUTDOWN, 0x01);
>>> +	} else {
>>> +		dev_dbg(&is31->client->dev, "power down\n");
>>> +		/* shut down */
>>> +		is31fl319x_write(is31, IS31FL319X_SHUTDOWN, 0x00);
>>> +	}
>>> +
>>> +	dev_dbg(&is31->client->dev, "work done\n");
>>> +
>>> +}
>>> +
>>> +/* NOTE: this may be called from within irq context, e.g. led_trigger_event */
>>> +
>>> +static int is31fl319x_brightness_get(struct led_classdev *led_cdev)
>>> +{
>>> +	struct is31fl319x_led *led = container_of(led_cdev,
>>> +						  struct is31fl319x_led,
>>> +						  led_cdev);
>>> +	struct is31fl319x_chip *is31 = led->chip;
>>> +
>>> +	/* read PWM register */
>>> +	return is31fl319x_read(is31, IS31FL319X_PWM1 + (led - is31->leds));
>>> +}
>>
>> I believe that the LEDS core remembers the last set brightness for each LED,
>> and will use it if no brightness_get function is implemented. Since all is31fl319x_brightness_get() does is retrieve the saved value from your cache,
>> I think you can just eliminate is31fl319x_brightness_get() altogether.
>
> Well, we do not use it as a real getter because as you say the LEDS core remembers
> it.
>
> But we call it in the setter to determine if there is a change.
>
>>
>>> +
>>> +static void is31fl319x_brightness_set(struct led_classdev *led_cdev,
>>> +				   enum led_brightness brightness)
>>> +{
>>> +	struct is31fl319x_led *led = container_of(led_cdev,
>>> +						  struct is31fl319x_led,
>>> +						  led_cdev);
>>> +	struct is31fl319x_chip *is31 = led->chip;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&is31->lock, flags);
>>> +
>>> +	if (brightness != is31fl319x_brightness_get(led_cdev)) {
>
> Here.
>
> Maybe we could inline the call to is31fl319x_read() and even inline
> is31fl319x_read because that is also the only location where it is used.
>
> But it removes some inherent layering of the code (lowest level = read/write
> chip, get = know which registers to read, set = schedule work only if needed).
>
> I have left it as is for the next version. Let's see if there are more comments.
>
>>> +		if (!is31->work_scheduled) {
>>> +			schedule_work(&is31->work);
>>> +			is31->work_scheduled = true;
>>> +		}
>>> +	}
>>> +
>>> +	spin_unlock_irqrestore(&is31->lock, flags);
>>> +}
>>> +
>>> +static int is31fl319x_blink_set(struct led_classdev *led_cdev,
>>> +			     unsigned long *delay_on,
>>> +			     unsigned long *delay_off)
>>> +{
>>> +	/* use software blink */
>>> +	return 1;
>>
>> The Kconfig entry claims hardware blink support. The comment here
>> says the opposite. I believe this current implementation will result
>> in the LEDS core falling back to software blink, but the same result
>> would be achieved by just not setting the blink_set callback.
>>
>
> Yes, you are right. We wanted to implement HW blinking later.
> So let's remove it here and from Kconfig.
>
>>> +}
>>> +
>>> +#ifdef CONFIG_OF
>>> +static struct is31fl319x_platform_data *
>>> +is31fl319x_led_dt_init(struct i2c_client *client, int num_leds)
>>> +{
>>> +	struct device_node *np = client->dev.of_node, *child;
>>> +	struct is31fl319x_platform_data *pdata;
>>> +	struct led_info *is31_leds;
>>> +	int count;
>>> +
>>> +	count = of_get_child_count(np);
>>> +	dev_dbg(&client->dev, "child count %d\n", count);
>>> +	if (!count || count > NUM_LEDS)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	is31_leds = devm_kzalloc(&client->dev,
>>> +			sizeof(struct led_info) * NUM_LEDS, GFP_KERNEL);
>>> +	if (!is31_leds)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	for_each_child_of_node(np, child) {
>>> +		struct led_info led;
>>> +		u32 reg;
>>> +		int ret;
>>> +
>>> +		led.name =
>>> +			of_get_property(child, "label", NULL) ? : child->name;
>>> +		led.default_trigger =
>>> +			of_get_property(child, "linux,default-trigger", NULL);
>>
>> I believe it is better to use of_property_read_string() for these.
>
> Sounds good, because it does some error checks but makes error handling
> a little more complex (since it is an optional property).
>
>>
>>> +		led.flags = 0;
>>> +		ret = of_property_read_u32(child, "reg", &reg);
>>> +		dev_dbg(&client->dev, "name = %s reg = %d\n", led.name, reg);
>>> +		if (ret != 0 || reg < 0 || reg >= num_leds)
>>> +			continue;
>>> +
>>> +		if (is31_leds[reg].name)
>>> +			dev_err(&client->dev, "duplicate led line %d for %s -> %s\n",
>>> +				reg, is31_leds[reg].name, led.name);
>>
>> There are two errors (invalid DT) detected here, but the driver continues
>> to load. I believe the preference is for errors like this to result in the
>> probe failing outright.
>
> I regard this type of error as a flaw that does not require the driver to probe completely.
> It simply uses the last of the duplicate definitions. By looking into the kernel log
> the error in DT can be easily seen and fixed (instead of wondering why all LEDs
> remain off).

Allowing the probe to continue in case of DT configuration mismatch can
defer in time the moment when one realizes that something went wrong
while probing. I.e. the affected LED can be configured by user space to
be off on init, and effectively the malfunction wouldn't be easily
noticeable at first glance.

That's why I prefer to fail on any problem during DT parsing.

>
>>
>>
>>> +		is31_leds[reg] = led;
>>> +	}
>>> +	pdata = devm_kzalloc(&client->dev,
>>> +			sizeof(struct is31fl319x_platform_data), GFP_KERNEL);
>>> +	if (!pdata)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	pdata->leds.leds = is31_leds;
>>> +	return pdata;
>>> +}
>>> +
>>> +static const struct of_device_id of_is31fl319x_leds_match[] = {
>>> +	{ .compatible = "issi,is31fl3196", (void *) 6 },
>>> +	{ .compatible = "issi,is31fl3199", (void *) 9 },
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, of_is31fl319x_leds_match);
>>> +
>>> +#else
>>> +static struct is31fl319x_platform_data *
>>> +is31fl319x_led_dt_init(struct i2c_client *client)
>>> +{
>>> +	return ERR_PTR(-ENODEV);
>>> +}
>>> +
>>> +#endif
>>> +
>>> +static int is31fl319x_probe(struct i2c_client *client,
>>> +		const struct i2c_device_id *id)
>>> +{
>>> +	struct is31fl319x_chip *is31;
>>> +	struct i2c_adapter *adapter;
>>> +	struct is31fl319x_platform_data *pdata;
>>> +	int err;
>>> +	int i = 0;
>>> +
>>> +	adapter = to_i2c_adapter(client->dev.parent);
>>> +	pdata = dev_get_platdata(&client->dev);
>>> +
>>> +	dev_dbg(&client->dev, "probe\n");
>>> +
>>> +	dev_dbg(&client->dev, "NUM_LEDS = %d num_leds = %d\n",
>>> +		NUM_LEDS, (int) id->driver_data);
>>> +
>>> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>>> +		return -EIO;
>>> +
>>> +	if (!pdata) {
>>> +		pdata = is31fl319x_led_dt_init(client, (int) id->driver_data);
>>> +		if (IS_ERR(pdata)) {
>>> +			dev_err(&client->dev, "DT led error %d\n",
>>> +				(int) PTR_ERR(pdata));
>>> +			return PTR_ERR(pdata);
>>> +		}
>>> +	}
>>> +	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
>>> +	if (!is31)
>>> +		return -ENOMEM;
>>> +
>>> +	is31->client = client;
>>> +	INIT_WORK(&is31->work, is31fl319x_work);
>>> +	spin_lock_init(&is31->lock);
>>> +	i2c_set_clientdata(client, is31);
>>> +
>>> +	/* check for reply from chip (we can't read any registers) */
>>> +	err = is31fl319x_write(is31, IS31FL319X_SHUTDOWN, 0x01);
>>> +	if (err < 0) {
>>> +		dev_err(&client->dev, "no response from chip write: err = %d\n",
>>> +			err);
>>> +		return -EPROBE_DEFER;	/* does not answer (yet) */
>>> +	}
>>> +
>>> +	for (i = 0; i < NUM_LEDS; i++) {
>>> +		struct is31fl319x_led *l = is31->leds + i;
>>> +
>>> +		l->chip = is31;
>>> +		if (pdata->leds.leds[i].name && !pdata->leds.leds[i].flags) {
>>> +			l->led_cdev.name = pdata->leds.leds[i].name;
>>> +			l->led_cdev.default_trigger
>>> +				= pdata->leds.leds[i].default_trigger;
>>> +			l->led_cdev.brightness_set = is31fl319x_brightness_set;
>>> +			l->led_cdev.blink_set = is31fl319x_blink_set;
>>
>> I don't see led_cdev.brightness_get being set here. Although if you do
>> remove is31fl319x_brightness_get(), it obviously won't need to be set.
>
> Well, it is used in our is31fl319x_brightness_set function so we can't
> remove it completely.
>
>>
>>> +			err = led_classdev_register(&client->dev,
>>> +						    &l->led_cdev);
>>
>> I would suggest using devm_led_classdev_register(). Then you can remove
>> all the calls to led_classdev_unregister() in error and cleanup paths.
>
> Ok.
>
>>
>>> +			if (err < 0)
>>> +				goto exit;
>>> +		}
>>> +	}
>>> +
>>> +	if (client->dev.of_node) {
>>> +		u32 val;
>>> +		u8 config2 = 0;
>>> +
>>> +		if (of_property_read_u32(client->dev.of_node, "max-current-ma",
>>> +					 &val)) {
>>> +			if (val > 40)
>>> +				val = 40;
>>> +			if (val < 5)
>>> +				val = 5;
>>> +			config2 |= (((64 - val) / 5) & 0x7) << 4; /* CS */
>>> +		}
>>> +		if (of_property_read_u32(client->dev.of_node, "audio-gain-db",
>>> +					 &val)) {
>>> +			if (val > 21)
>>> +				val = 21;
>>> +			config2 |= val / 3; /* AGS */
>>> +		}
>>> +		if (config2)
>>> +			is31fl319x_write(is31, IS31FL319X_CONFIG2, config2);
>>> +	}
>>> +
>>> +	schedule_work(&is31->work);	/* first update */
>>> +
>>> +	dev_dbg(&client->dev, "probed\n");
>>> +	return 0;
>>> +exit:
>>> +	dev_err(&client->dev, "led error %d\n", err);
>>> +
>>> +	while (i--) {
>>> +		if (is31->leds[i].led_cdev.name)
>>> +			led_classdev_unregister(&is31->leds[i].led_cdev);
>>> +	}
>>> +	return err;
>>> +}
>>> +
>>> +static int is31fl319x_remove(struct i2c_client *client)
>>> +{
>>> +	int i;
>>> +	struct is31fl319x_chip *is31 = i2c_get_clientdata(client);
>>> +	struct is31fl319x_led *is31_leds = is31->leds;
>>> +
>>> +	for (i = 0; i < NUM_LEDS; i++) {
>>> +		if (is31_leds[i].led_cdev.name)
>>> +			led_classdev_unregister(&is31_leds[i].led_cdev);
>>> +	}
>>> +
>>> +	cancel_work_sync(&is31->work);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct i2c_driver is31fl319x_driver = {
>>> +	.driver   = {
>>> +		.name    = "leds-is31fl319x",
>>> +		.of_match_table = of_match_ptr(of_is31fl319x_leds_match),
>>> +	},
>>> +	.probe    = is31fl319x_probe,
>>> +	.remove   = is31fl319x_remove,
>>> +	.id_table = is31fl319x_id,
>>> +};
>>> +
>>> +module_i2c_driver(is31fl319x_driver);
>>> +
>>> +MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
>>> +MODULE_DESCRIPTION("IS31FL319X LED driver");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/include/linux/leds-is31fl319x.h b/include/linux/leds-is31fl319x.h
>>> new file mode 100644
>>> index 0000000..5f55abf
>>> --- /dev/null
>>> +++ b/include/linux/leds-is31fl319x.h
>>> @@ -0,0 +1,24 @@
>>> +/*
>>> + * IS31FL3196 LED chip driver.
>>> + *
>>> + * Copyright (C) 2015 H. Nikolaus Schaller <hns@goldelico.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * version 2 as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful, but
>>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> + * General Public License for more details.
>>> + */
>>> +
>>> +#ifndef __LINUX_IS31FL319X_H
>>> +#define __LINUX_IS31FL319X_H
>>> +#include <linux/leds.h>
>>> +
>>> +struct is31fl319x_platform_data {
>>> +	struct led_platform_data leds;
>>> +};
>>> +
>>> +#endif /* __LINUX_IS31FL319X_H */
>>
>
> In the next days I will debug and test the fixes...
>
> BR and thanks,
> Nikolaus
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Best regards,
Jacek Anaszewski
