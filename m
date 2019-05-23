From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Thu, 23 May 2019 08:50:20 -0500
Message-ID: <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523130311.GA17245@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Mark

On 5/23/19 8:03 AM, Mark Brown wrote:
> On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
>> The use of and enablement of the GPIO can be used across devices.
>> Use the enable_reg in the regulator descriptor for the register to
>> write.
> 
>> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
>>  
>>  	if (gpiod) {
>>  		cfg.ena_gpiod = gpiod;
>> -
>> -		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
>> +		ret = regmap_update_bits(regmap,
>> +					 lm363x_regulator_desc[id].enable_reg,
>>  					 LM3632_EXT_EN_MASK,
>>  					 LM3632_EXT_EN_MASK);
>>  		if (ret) {
> 
> Is it guaranteed that the bitmask for enabling the use of the GPIO is
> going to be the same for all regulators?  The bitmasks for the regulator
> enable look to be different, and it also looks like this setting might
> affect multiple regulators since it seems there are multiple enable bits
> in the same register.  If this affects multiple regulators then how's
> that working at the minute?
> 

Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
If it is then the developer implemented the DT wrong.

LM3631 - No LCM GPIO control

LM36274 reg 0x09 bit 0 7.6.9 of the data sheet
LM3632 reg 0x0c bit 0 7.6.12 of the data sheet

Dan
