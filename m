From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 1/2] drivers: led: is31fl319x: 1/3/6/9-channel light effect led driver
Date: Fri, 15 Jul 2016 10:08:33 +0200
Message-ID: <71F3BE12-FFC9-4771-BF48-ABAC3ACEF4AD@goldelico.com>
References: <cover.1468007377.git.hns@goldelico.com> <524f16ecba240bacf57924f43ec38404cfdcde8f.1468007377.git.hns@goldelico.com> <57854FB0.1080605@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57854FB0.1080605@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, David Rivshin <drivshin@allworx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

> Am 12.07.2016 um 22:14 schrieb Jacek Anaszewski <jacek.anaszewski@gmail.com>:
> 
>> 
>> +
>> +/*
>> + * regmap is used as a cache of chip's register space,
>> + * to avoid reading back brightness values from chip,
>> + * which is known to hang.
>> + */
>> +struct is31fl319x_chip {
>> +	struct i2c_client       *client;
>> +	struct regmap           *regmap;
>> +	struct mutex            lock;
>> +	u32                     audio_gain_db;
>> +
>> +	struct is31fl319x_led {
>> +		struct is31fl319x_chip  *chip;
>> +		struct led_classdev     cdev;
>> +		u32                     max_microamp;
>> +		bool                    configured;
>> +	} leds[NUM_LEDS];
>> +};
>> +
>> +static const struct i2c_device_id is31fl319x_id[] = {
>> +	{ "is31fl3190", 1 },
>> +	{ "is31fl3191", 1 },
>> +	{ "is31fl3193", 3 },
>> +	{ "is31fl3196", 6 },
>> +	{ "is31fl3199", 9 },
>> +	{ "sn3199", 9 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, is31fl319x_id);
> 
> This is redundant - you have this info in of_is31fl319x_leds_match,
> and you can obtain it with of_match_device().
> Please compare drivers/leds/leds-is31fl32xx.c.

we have tried like is31fl32xx.c but it does not automatically load the driver
if compiled as module (like all other I2C clients do). Reason seems to
be that there is no i2c information in modalias database any more.

So perhaps the i31fl32 approach is also incomplete. Has it been tested
with loadable modules?

And, there is a bug/typo in the fl32 driver:

http://lxr.free-electrons.com/source/drivers/leds/leds-is31fl32xx.c#L425

static const struct i2c_device_id is31fl31xx_id[] = {

s/fl31/fl32/ is31fl32xx.c

BR and thanks,
Nikolaus
