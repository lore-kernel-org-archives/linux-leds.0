From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lm3697: Introduce the lm3697 driver
Date: Tue, 14 Aug 2018 08:54:24 -0500
Message-ID: <d76cb536-7ac0-6616-4979-8706ef22e9f3@ti.com>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180807160442.8937-2-dmurphy@ti.com> <20180808195909.GC20912@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808195909.GC20912@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the review

On 08/08/2018 02:59 PM, Pavel Machek wrote:
> Hi!
> 
>> Introduce the lm3697 LED driver for
>> backlighting and display.
>>
>> Datasheet location:
>> http://www.ti.com/lit/ds/symlink/lm3697.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> 
>> +
>> +#define LM3697_HVLED1_2_3_A		0
>> +#define LM3697_HVLED1_B_HVLED2_3_A	1
>> +#define LM3697_HVLED2_B_HVLED1_3_A	2
>> +#define LM3697_HVLED1_2_B_HVLED3_A	3
>> +#define LM3697_HVLED3_B_HVLED1_2_A	4
>> +#define LM3697_HVLED1_3_B_HVLED2_A	5
>> +#define LM3697_HVLED1_A_HVLED2_3_B	6
>> +#define LM3697_HVLED1_2_3_B		7
> 
> That's rather long and verbose way to describe a bitmap, right?

It will be removed with v3

> 
>> +static const struct regmap_config lm3697_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = LM3697_CTRL_ENABLE,
>> +	.reg_defaults = lm3697_reg_defs,
>> +	.num_reg_defaults = ARRAY_SIZE(lm3697_reg_defs),
>> +	.cache_type = REGCACHE_RBTREE,
>> +};
> 
> Is rbtree good idea? You don't have that many registers.

ack

> 
>> +static int lm3697_init(struct lm3697 *priv)
>> +{
>> +	int ret;
>> +
> ....
>> +		regmap_write(priv->regmap, LM3697_RESET, LM3697_SW_RESET);
> 
> No error checking required here?

Ack

> 
>> +	if (priv->control_bank_config < LM3697_HVLED1_2_3_A ||
>> +	    priv->control_bank_config > LM3697_HVLED1_2_3_B) {
>> +		dev_err(&priv->client->dev, "Control bank configuration is out of range\n");
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	device_for_each_child_node(priv->dev, child) {
>> +		led = &priv->leds[i];
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &led->control_bank);
>> +		if (ret) {
>> +			dev_err(&priv->client->dev, "reg DT property missing\n");
>> +			goto child_out;
>> +		}
>> +
>> +		fwnode_property_read_string(child, "linux,default-trigger",
>> +					    &led->led_dev.default_trigger);
>> +
>> +		ret = fwnode_property_read_string(child, "label", &name);
>> +		if (ret)
>> +			snprintf(led->label, sizeof(led->label),
>> +				"%s::", priv->client->name);
>> +		else
>> +			snprintf(led->label, sizeof(led->label),
>> +				 "%s:%s", priv->client->name, name);
>> +
>> +
>> +		led->priv = priv;
>> +		led->led_dev.name = led->label;
>> +		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
>> +
>> +		ret = devm_led_classdev_register(priv->dev, &led->led_dev);
>> +		if (ret) {
>> +			dev_err(&priv->client->dev, "led register err: %d\n", ret);
>> +			goto child_out;
>> +		}
>> +
>> +		if (priv->control_bank_config == LM3697_HVLED1_2_3_A ||
>> +		    priv->control_bank_config == LM3697_HVLED1_2_3_B)
>> +			goto child_out;
> 
> This checks if we have just one bank, I see it. Should it also check
> the led actually uses the correct bank?

It will be removed with v3

> 
>> +		i++;
>> +		fwnode_handle_put(child);
>> +	}
>> +
>> +child_out:
>> +	fwnode_handle_put(child);
> 
> Is not the fwnode_handle_put() done twice for non-error case?

Ack

> 
>> +	ret = lm3697_init(led);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ret;
>> +}
> 
> The if is not needed here.
> 

Ack

>> +static int lm3697_remove(struct i2c_client *client)
>> +{
>> +	struct lm3697 *led = i2c_get_clientdata(client);
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(led->regmap, LM3697_CTRL_ENABLE,
>> +				 LM3697_CTRL_A_B_EN, 0);
>> +	if (ret) {
>> +		dev_err(&led->client->dev, "Failed to disable regulator\n");
>> +		return ret;
> 
> Misleading, this does nothing with regulators.

Ack

> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
