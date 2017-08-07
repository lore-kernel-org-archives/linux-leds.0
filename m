From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 1/4] leds: pca955x: add device tree support
Date: Mon, 7 Aug 2017 11:03:27 +0200
Message-ID: <6c38e7cc-303b-c606-72ff-56083a46f32f@kaod.org>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
 <1501589349-5681-2-git-send-email-clg@kaod.org>
 <83142a40-1aba-6f8f-57a2-6542e7e91ecf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]:51232 "EHLO
        3.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752858AbdHGKS6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Aug 2017 06:18:58 -0400
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id A56D012AC9D
        for <linux-leds@vger.kernel.org>; Mon,  7 Aug 2017 11:03:37 +0200 (CEST)
In-Reply-To: <83142a40-1aba-6f8f-57a2-6542e7e91ecf@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

On 08/06/2017 11:42 PM, Jacek Anaszewski wrote:
> Hi Cedric,
> 
> Thanks for the updated patch set.
> Please refer below to my comments.
> 
> On 08/01/2017 02:09 PM, Cédric Le Goater wrote:
>> It will be used in a following patch to define different operation
>> modes for each pin.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/leds/leds-pca955x.c | 89 ++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 84 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index 9a873118ea5f..3afd481a760f 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -41,14 +41,17 @@
>>   */
>>  
>>  #include <linux/acpi.h>
>> -#include <linux/module.h>
>> -#include <linux/delay.h>
>> -#include <linux/string.h>
>>  #include <linux/ctype.h>
>> -#include <linux/leds.h>
>> +#include <linux/delay.h>
>>  #include <linux/err.h>
>> +#include <linux/gpio.h>
>>  #include <linux/i2c.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of.h>
>>  #include <linux/slab.h>
>> +#include <linux/string.h>
>>  
>>  /* LED select registers determine the source that drives LED outputs */
>>  #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
>> @@ -122,6 +125,12 @@ struct pca955x_led {
>>  	struct led_classdev	led_cdev;
>>  	int			led_num;	/* 0 .. 15 potentially */
>>  	char			name[32];
>> +	const char		*default_trigger;
>> +};
>> +
>> +struct pca955x_platform_data {
>> +	struct pca955x_led	*leds;
>> +	int			num_leds;
>>  };
>>  
>>  /* 8 bits per input register */
>> @@ -250,6 +259,70 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>>  	return 0;
>>  }
>>  
>> +#if IS_ENABLED(CONFIG_OF)
>> +static struct pca955x_platform_data *
>> +pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
>> +{
>> +	struct device_node *np = client->dev.of_node;
>> +	struct device_node *child;
>> +	struct pca955x_platform_data *pdata;
>> +	int count;
>> +
>> +	count = of_get_child_count(np);
>> +	if (!count || count > chip->bits)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>> +	if (!pdata)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	pdata->leds = devm_kzalloc(&client->dev,
>> +				   sizeof(struct pca955x_led) * chip->bits,
>> +				   GFP_KERNEL);
>> +	if (!pdata->leds)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for_each_child_of_node(np, child) {
>> +		const char *name;
>> +		u32 reg;
>> +		int res;
>> +
>> +		res = of_property_read_u32(child, "reg", &reg);
>> +		if ((res != 0) || (reg >= chip->bits))
>> +			continue;
>> +
>> +		if (of_property_read_string(child, "label", &name))
>> +			name = child->name;
>> +
>> +		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
>> +			 "%s", name);
>> +
>> +		of_property_read_string(child, "linux,default-trigger",
>> +					&pdata->leds[reg].default_trigger);
>> +	}
>> +
>> +	pdata->num_leds = chip->bits;
>> +
>> +	return pdata;
>> +}
>> +
>> +static const struct of_device_id of_pca955x_match[] = {
>> +	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
>> +	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
>> +	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
>> +	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, of_pca955x_match);
>> +#else
>> +static struct pca955x_platform_data *
>> +pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
>> +{
>> +	return ERR_PTR(-ENODEV);
>> +}
>> +#endif
>> +
>>  static int pca955x_probe(struct i2c_client *client,
>>  					const struct i2c_device_id *id)
>>  {
>> @@ -257,8 +330,8 @@ static int pca955x_probe(struct i2c_client *client,
>>  	struct pca955x_led *pca955x_led;
>>  	struct pca955x_chipdef *chip;
>>  	struct i2c_adapter *adapter;
>> -	struct led_platform_data *pdata;
>>  	int i, err;
>> +	struct pca955x_platform_data *pdata;
>>  
>>  	if (id) {
>>  		chip = &pca955x_chipdefs[id->driver_data];
>> @@ -272,6 +345,11 @@ static int pca955x_probe(struct i2c_client *client,
>>  	}
>>  	adapter = to_i2c_adapter(client->dev.parent);
>>  	pdata = dev_get_platdata(&client->dev);
>> +	if (!pdata) {
>> +		pdata =	pca955x_pdata_of_init(client, chip);
>> +		if (IS_ERR(pdata))
>> +			return PTR_ERR(pdata);
>> +	}
> 
> Since from this moment pdata should be in every case available you
> could get rid of "if (pdata) check" right after
> 
> "if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))".

Sure. Will do.

Thanks,

C. 

> 
> 
>>  	/* Make sure the slave address / chip type combo given is possible */
>>  	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
>> @@ -378,6 +456,7 @@ static struct i2c_driver pca955x_driver = {
>>  	.driver = {
>>  		.name	= "leds-pca955x",
>>  		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
>> +		.of_match_table = of_match_ptr(of_pca955x_match),
>>  	},
>>  	.probe	= pca955x_probe,
>>  	.remove	= pca955x_remove,
>>
> 
