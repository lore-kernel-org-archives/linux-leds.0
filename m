From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 5/5] leds: lm3697: Introduce the lm3697 driver
Date: Mon, 15 Apr 2019 07:49:46 -0500
Message-ID: <f47fff9b-bca1-6412-c423-acf01baabc9f@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-6-dmurphy@ti.com> <20190413200605.GA3013@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190413200605.GA3013@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 4/13/19 3:06 PM, Pavel Machek wrote:
> On Mon 2019-03-25 09:24:03, Dan Murphy wrote:
>> Introduce the lm3697 LED driver for
>> backlighting and display.
>>
>> Datasheet location:
>> http://www.ti.com/lit/ds/symlink/lm3697.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/Kconfig       |   8 +-
>>  drivers/leds/Makefile      |   1 +
>>  drivers/leds/leds-lm3697.c | 401 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 409 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/leds/leds-lm3697.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 735009e73414..688bb9a6f275 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -776,9 +776,15 @@ config LEDS_NIC78BX
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called leds-nic78bx.
>>  
>> +config LEDS_LM3697
>> +	tristate "LED driver for LM3697"
>> +	depends on LEDS_TI_LMU_COMMON
>> +	help
>> +	  Say Y to enable the LM3697 LED driver for TI LMU devices.
>> +	  This supports the LED device LM3697.
>> +
>>  config LEDS_TI_LMU_COMMON
>>  	tristate "LED driver for TI LMU"
>> -	depends on REGMAP
>>  	help
>>            Say Y to enable the LED driver for TI LMU devices.
>>            This supports common features between the TI LM3532, LM3631, LM3632,
> 
> Is deleting "depends on REGMAP" intentional? AFAICT you are using it.
> 

Thanks for pointing that out.  I don't know how that was in there.

> Plus we'd normally expect "COMMON" first and then specific driver. Not
> sure if Kconfig can handle it out-of-order...
> 
> 

OK.  Should I rename the ti_lmu file to leds-common-ti-lmu?

This keeps the naming convention the same in the leds directory as well.

FYI I will not add your acked-by on the LMU patch that introduced the code unless you approve.
Since you found issues with the kconfig

Refererence
https://lore.kernel.org/patchwork/patch/1054500/

>> +static int lm3697_init(struct lm3697 *priv)
>> +{
>> +	struct lm3697_led *led;
>> +	int i, ret;
>> +
>> +	if (priv->enable_gpio) {
>> +		gpiod_direction_output(priv->enable_gpio, 1);
>> +	} else {
>> +		ret = regmap_write(priv->regmap, LM3697_RESET, LM3697_SW_RESET);
>> +		if (ret) {
>> +			dev_err(&priv->client->dev, "Cannot reset the device\n");
>> +			goto out;
>> +		}
>> +	}
>> +
>> +	ret = regmap_write(priv->regmap, LM3697_CTRL_ENABLE, 0x0);
>> +	if (ret) {
>> +		dev_err(&priv->client->dev, "Cannot write ctrl enable\n");
>> +		goto out;
>> +	}
>> +
>> +	ret = regmap_write(priv->regmap, LM3697_OUTPUT_CONFIG, priv->bank_cfg);
>> +	if (ret)
>> +		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
> 
> Missing goto out?

Ack

> 
>> +	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
>> +		led = &priv->leds[i];
>> +		ret = ti_lmu_common_set_ramp(&led->lmu_data);
>> +		if (ret)
>> +			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
>> +	}
>> +out:
>> +	return ret;
>> +}
> 									Pavel
> 
