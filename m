From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 2/2] leds: lm3697: Introduce the lm3697 driver
Date: Wed, 5 Sep 2018 13:18:08 -0500
Message-ID: <a0651696-2cea-a96f-d1f1-b02c39ae187c@ti.com>
References: <20180817151528.21623-1-dmurphy@ti.com>
 <20180817151528.21623-2-dmurphy@ti.com> <20180824100549.GC4045@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824100549.GC4045@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 08/24/2018 05:05 AM, Pavel Machek wrote:
> Hi!
> 

I am going to go ahead and update this code anyway and if we get the ti-lmu
code in then we can adapt this code to use that framework

>> +/**
>> + * struct lm3697 -
>> + * @enable_gpio - Hardware enable gpio
>> + * @regulator - LED supply regulator pointer
>> + * @client - Pointer to the I2C client
>> + * @regmap - Devices register map
>> + * @dev - Pointer to the devices device struct
>> + * @lock - Lock for reading/writing the device
>> + * @leds - Array of LED strings.
>> + */
> 
> extra .

ACK

> 
>> +	ret = regmap_write(led->priv->regmap, brt_msb_reg, brt_val);
>> +	if (ret) {
>> +		dev_err(&led->priv->client->dev, "Cannot write MSB\n");
>> +		goto out;
>> +	}
>> +out:
> 
> I'd avoid this goto.

Ack

> 
>> +static int lm3697_set_control_bank(struct lm3697 *priv)
>> +{
>> +	u8 control_bank_config = 0;
>> +	struct lm3697_led *led;
>> +	int ret, i;
>> +
>> +	led = &priv->leds[0];
>> +	if (led->control_bank == LM3697_CONTROL_A)
>> +		led = &priv->leds[1];
> 
> I'd expect CONTROL_A to correspond to leds[0]...?

Not always there can be a situation where all HVLEDs can be configured
for control bank B

> 
>> +	for (i = 0; i < LM3697_MAX_LED_STRINGS; i++) {
>> +		if (led->hvled_strings[i] == LM3697_HVLED_ASSIGNMENT)
>> +			control_bank_config |= 1 << i;
>> +	}
> 
> Extra {}s.

Ack

> 
>> +	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
>> +	if (IS_ERR(priv->regulator))
>> +		priv->regulator = NULL;
> 
> If vled regulator is specified in dt and _get fails, is it worth a
> warning?

Hmmm.  That would be annoying on boot to have a warning on an optional
parameter.  But if we need it I can add it.

Dan

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
