From: Tony <tony.makkiel@daqri.com>
Subject: Re: [PATCH v7 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Wed, 29 Jun 2016 11:02:48 +0100
Message-ID: <57739CC8.70704@daqri.com>
References: <1467129919-27641-1-git-send-email-tony.makkiel@daqri.com>
 <3435169.nmqvdouPPq@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38092 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbcF2KCv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 29 Jun 2016 06:02:51 -0400
Received: by mail-wm0-f47.google.com with SMTP id r201so65538590wme.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Jun 2016 03:02:50 -0700 (PDT)
In-Reply-To: <3435169.nmqvdouPPq@vostro.rjw.lan>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, lenb@kernel.org, mika.westerberg@linux.intel.com, linux-acpi@vger.kernel.org

Thank you for the comments Rafael.

On 29/06/16 01:45, Rafael J. Wysocki wrote:
> On Tuesday, June 28, 2016 05:05:19 PM Tony Makkiel wrote:


>> +static int lp3952_probe(struct i2c_client *client,
>> +			const struct i2c_device_id *id)
>> +{
>> +	int status;
>> +	struct lp3952_ctrl_hdl *leds;
>> +	struct lp3952_led_array *priv;
>> +
>> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	leds = devm_kcalloc(&client->dev, LP3952_LED_ALL, sizeof(*leds),
>> +			    GFP_KERNEL);
>> +	if (!leds) {
>> +		devm_kfree(&client->dev, priv);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	priv->leds = leds;
>> +	priv->client = client;
>> +
>> +	priv->enable_gpio = devm_gpiod_get(&client->dev, NULL, GPIOD_OUT_HIGH);
>> +	if (IS_ERR(priv->enable_gpio)) {
>> +		status = PTR_ERR(priv->enable_gpio);
>> +		dev_err(&client->dev, "Failed to enable gpio: %d\n", status);
>> +		return status;
>> +	}
>> +
>> +	priv->regmap = devm_regmap_init_i2c(client, &lp3952_regmap);
>> +	if (IS_ERR(priv->regmap)) {
>> +		int err = PTR_ERR(priv->regmap);
>> +
>> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
>> +			err);
>> +		return err;
>> +	}
>> +
>> +	i2c_set_clientdata(client, priv);
>> +
>> +	status = lp3952_configure(priv);
>> +	if (status) {
>> +		dev_err(&client->dev, "Probe failed. Device not found (%d)\n",
>> +			status);
>> +		return status;
>> +	}
>> +
>> +	status = lp3952_register_led_classdev(priv);
>> +	if (status) {
>> +		dev_err(&client->dev, "Unable to register led_classdev: %d\n",
>> +			status);
>> +		return status;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int lp3952_remove(struct i2c_client *client)
>> +{
>> +	struct lp3952_led_array *priv;
>> +
>> +	priv = i2c_get_clientdata(client);
>> +	lp3952_on_off(priv, LP3952_LED_ALL, 0);
>> +	gpiod_set_value(priv->enable_gpio, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct i2c_device_id lp3952_id[] = {
>> +	{LP3952_NAME, 0},
>> +	{}
>> +};
>> +
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>> +	{LP3952_ACPI_NAME, 0},
>
> No, you can't use "PRP0001" in this list.
>
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>
> And you don't need this for the "PRP0001" thing to work.  The core will
> take care of it for you then.
>
>> +#endif
>
> So the entire ACPI block can be dropped for now.
>
> And the driver doesn't have to depend on CONFIG_ACPI any more, does it?
We need to pass the reset gpio to the driver.

"devm_gpiod_get(&client->dev, NULL, GPIOD_OUT_HIGH);"

in the "lp3952_probe". I shall remove the PRP0001 from the driver and 
check whether the gpio can be still read from ACPI. If it can, removing 
ACPI block shouldn't be a problem.

>
>> +
>> +static struct i2c_driver lp3952_i2c_driver = {
>> +	.driver = {
>> +		   .name = LP3952_NAME,
>> +		   .acpi_match_table = ACPI_PTR(lp3952_acpi_match),
>> +		  },
>> +	.probe = lp3952_probe,
>> +	.remove = lp3952_remove,
>> +	.id_table = lp3952_id,
>> +};
>> +
>> +module_i2c_driver(lp3952_i2c_driver);
>> +
>> +MODULE_AUTHOR("Tony Makkiel <tony.makkiel@daqri.com>");
>> +MODULE_DESCRIPTION("lp3952 I2C LED controller driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.h
>> new file mode 100644
>> index 0000000..9808ab7
>> --- /dev/null
>> +++ b/include/linux/leds-lp3952.h
>> @@ -0,0 +1,128 @@
>> +/*
>> + *	LED driver for TI lp3952 controller
>> + *
>> + *	Copyright (C) 2016, DAQRI, LLC.
>> + *	Author: Tony Makkiel <tony.makkiel@daqri.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#ifndef LEDS_LP3952_H_
>> +#define LEDS_LP3952_H_
>> +
>> +/* ACPI iasl compiler wont take name LP3952,
>> + * "ASL_MSG_HID_LENGTH". Hence the name TLP3952
>> + */
>> +#define LP3952_NAME                         "lp3952"
>> +#define LP3952_ACPI_NAME                    "PRP0001"
>
> This is not necessary.
>
>> +#define LP3952_CMD_REG_COUNT                8
>> +#define LP3952_BRIGHT_MAX                   4
>> +
>> +#define LP3952_REG_LED_CTRL                 0x00
>> +#define LP3952_REG_R1_BLNK_TIME_CTRL        0x01
>> +#define LP3952_REG_R1_BLNK_CYCLE_CTRL       0x02
>> +#define LP3952_REG_G1_BLNK_TIME_CTRL        0x03
>> +#define LP3952_REG_G1_BLNK_CYCLE_CTRL       0x04
>> +#define LP3952_REG_B1_BLNK_TIME_CTRL        0x05
>> +#define LP3952_REG_B1_BLNK_CYCLE_CTRL       0x06
>> +#define LP3952_REG_ENABLES                  0x0B
>> +#define LP3952_REG_PAT_GEN_CTRL             0x11
>> +#define LP3952_REG_RGB1_MAX_I_CTRL          0x12
>> +#define LP3952_REG_RGB2_MAX_I_CTRL          0x13
>> +#define LP3952_REG_CMD_0                    0x50
>> +#define LP3952_REG_RESET                    0x60
>> +#define REG_MAX                             LP3952_REG_RESET
>> +
>> +#define LP3952_PATRN_LOOP                   BIT(1)
>> +#define LP3952_PATRN_GEN_EN                 BIT(2)
>> +#define LP3952_INT_B00ST_LDR                BIT(2)
>> +#define LP3952_ACTIVE_MODE                  BIT(6)
>> +#define LP3952_LED_MASK_ALL                 0x3f
>> +
>> +/* Transition Time in ms */
>> +enum lp3952_tt {
>> +	TT0,
>> +	TT55,
>> +	TT110,
>> +	TT221,
>> +	TT422,
>> +	TT885,
>> +	TT1770,
>> +	TT3539
>> +};
>> +
>> +/* Command Execution Time in ms */
>> +enum lp3952_cet {
>> +	CET197,
>> +	CET393,
>> +	CET590,
>> +	CET786,
>> +	CET1180,
>> +	CET1376,
>> +	CET1573,
>> +	CET1769,
>> +	CET1966,
>> +	CET2163,
>> +	CET2359,
>> +	CET2556,
>> +	CET2763,
>> +	CET2949,
>> +	CET3146
>> +};
>> +
>> +/* Max Current in % */
>> +enum lp3952_colour_I_log_0 {
>> +	I0,
>> +	I7,
>> +	I14,
>> +	I21,
>> +	I32,
>> +	I46,
>> +	I71,
>> +	I100
>> +};
>> +
>> +enum lp3952_leds {
>> +	LP3952_BLUE_2,
>> +	LP3952_GREEN_2,
>> +	LP3952_RED_2,
>> +	LP3952_BLUE_1,
>> +	LP3952_GREEN_1,
>> +	LP3952_RED_1,
>> +	LP3952_LED_ALL
>> +};
>> +
>> +struct lp3952_ctrl_hdl {
>> +	struct led_classdev cdev;
>> +	char name[15];
>> +	enum lp3952_leds channel;
>> +	void *priv;
>> +};
>> +
>> +struct ptrn_gen_cmd {
>> +	union {
>> +		struct {
>> +			u16 tt:3;
>> +			u16 b:3;
>> +			u16 cet:4;
>> +			u16 g:3;
>> +			u16 r:3;
>> +		};
>> +		struct {
>> +			u8 lsb;
>> +			u8 msb;
>> +		} bytes;
>> +	};
>> +} __packed;
>> +
>> +struct lp3952_led_array {
>> +	struct regmap *regmap;
>> +	struct i2c_client *client;
>> +	struct gpio_desc *enable_gpio;
>> +	struct lp3952_ctrl_hdl *leds;
>> +};
>> +
>> +#endif /* LEDS_LP3952_H_ */
>
> Thanks,
> Rafael
>
