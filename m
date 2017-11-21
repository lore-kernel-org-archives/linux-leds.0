From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/3] leds: Add driver for Qualcomm LPG
Date: Tue, 21 Nov 2017 23:00:42 +0100
Message-ID: <5fac62f1-4324-b488-736b-7fe66afc4f01@gmail.com>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-3-bjorn.andersson@linaro.org>
 <19018aa2-c460-1d5e-8dd2-1cfa557be2f2@gmail.com>
 <20171120211033.GZ28761@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171120211033.GZ28761@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On 11/20/2017 10:10 PM, Bjorn Andersson wrote:
> On Sun 19 Nov 13:36 PST 2017, Jacek Anaszewski wrote:
> 
>> Hi Bjorn,
>>
>> Thanks for the patch. Please refer to my comments in the code.
>>
>> On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
> [..]
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 52ea34e337cd..ccc3aa4b2474 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -651,6 +651,13 @@ config LEDS_POWERNV
>>>  	  To compile this driver as a module, choose 'm' here: the module
>>>  	  will be called leds-powernv.
>>>  
>>> +config LEDS_QCOM_LPG
>>> +	tristate "LED support for Qualcomm LPG"
>>> +	depends on LEDS_CLASS
>>
>> You were mentioning that this driver is for a MFD child block,
>> so we should probably depend on the parent MFD driver?
>>
> 
> There's no build time dependency between the two, so it's not strictly
> necessary.
> 
> Adding a dependency on MFD_SPMI_PMIC would indirectly add a dependency
> on ARCH_QCOM, which limit build testing and stop some static code
> checkers to check the driver.
> 
> So, unless you strongly object I would prefer not to mention the MFD.
> 
>>> +	help
>>> +	  This option enables support for the Light Pulse Generator found in a
>>> +	  wide variety of Qualcomm PMICs.
>>> +
> [..]
>>> diff --git a/drivers/leds/leds-qcom-lpg.c b/drivers/leds/leds-qcom-lpg.c
> [..]
>>> +#define LPG_PATTERN_CONFIG_REG	0x40
>>> +#define LPG_SIZE_CLK_REG	0x41
>>> +#define LPG_PREDIV_CLK_REG	0x42
>>> +#define PWM_TYPE_CONFIG_REG	0x43
>>> +#define PWM_VALUE_REG		0x44
>>> +#define PWM_ENABLE_CONTROL_REG	0x46
>>> +#define PWM_SYNC_REG		0x47
>>> +#define LPG_RAMP_DURATION_REG	0x50
>>> +#define LPG_HI_PAUSE_REG	0x52
>>> +#define LPG_LO_PAUSE_REG	0x54
>>> +#define LPG_HI_IDX_REG		0x56
>>> +#define LPG_LO_IDX_REG		0x57
>>> +#define PWM_SEC_ACCESS_REG	0xd0
>>> +#define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
>>> +
>>> +#define TRI_LED_SRC_SEL		0x45
>>> +#define TRI_LED_EN_CTL		0x46
>>> +#define TRI_LED_ATC_CTL		0x47
>>> +
>>> +#define LPG_LUT_REG(x)		(0x40 + (x) * 2)
>>> +#define RAMP_CONTROL_REG	0xc8
>>
>> Please add QCOM_ namespacing prefix to the macros.
>> At least PWM prefix is reserved for pwm subsystem.
>>
> 
> Will fix.
> 
> [..]
>>> +static void lpg_calc_freq(struct lpg_channel *chan, unsigned int period_us)
>>> +{
>>> +	int             n, m, clk, div;
>>> +	int             best_m, best_div, best_clk;
>>> +	unsigned int    last_err, cur_err, min_err;
>>> +	unsigned int    tmp_p, period_n;
>>> +
>>> +	if (period_us == chan->period_us)
>>> +		return;
>>> +
>>> +	/* PWM Period / N */
>>> +	if (period_us < ((unsigned int)(-1) / NSEC_PER_USEC)) {
>>> +		period_n = (period_us * NSEC_PER_USEC) >> 6;
>>> +		n = 6;
>>> +	} else {
>>> +		period_n = (period_us >> 9) * NSEC_PER_USEC;
>>> +		n = 9;
>>> +	}
>>
>> Please provide macros for 6 and 9 magic numbers.
>>
> 
> They really aren't magic numbers, they represent the number of bits of
> resolution, referred to as "size" in the rest of the driver.
> 
> I'll replace "n" with "pwm_size" to clarify this. Ok?

OK.

> [..]
>>> +static void lpg_apply_freq(struct lpg_channel *chan)
>>> +{
>>> +	unsigned long val;
>>> +	struct lpg *lpg = chan->lpg;
>>> +
>>> +	if (!chan->enabled)
>>> +		return;
>>> +
>>> +	/* Clock register values are off-by-one from lpg_clk_table */
>>> +	val = chan->clk + 1;
>>> +
>>> +	if (chan->pwm_size == 9)
>>> +		val |= lpg->data->pwm_9bit_mask;
>>> +
>>> +	regmap_write(lpg->map, chan->base + LPG_SIZE_CLK_REG, val);
>>> +
>>> +	val = chan->pre_div << 5 | chan->pre_div_exp;
>>> +	regmap_write(lpg->map, chan->base + LPG_PREDIV_CLK_REG, val);
>>
>> Please provide macros for 5 and 9.
>>
> 
> 5 definitely deserves a macro.
> 
> 9 is, as above, the number of bits of resolution (or "size of the pwm").
> Is there a name different than "pwm_size" that would make this more
> obvious?

pwm_res_bits or maybe you could use directly the register bit field
name from the documentation?

> [..]
>>> +static void lpg_brightness_set(struct led_classdev *cdev,
>>> +			      enum led_brightness value)
>>> +{
> [..]
>>> +	/* Trigger start of ramp generator(s) */
>>> +	if (lut_mask)
>>> +		lpg_lut_sync(lpg, lut_mask);
>>
>> We need some synchronization while changing device state in
>> few steps, to prevent troubles when we are preempted by other
>> process in the middle. spin_lock() in this case since it seems
>> that we are not going to sleep while accessing device registers.
>>
> 
> You're right, we need to protect the TRILED during the read-modify-write
> of the enable bits and we also need a lock around the allocation of bits
> in the LUT block. Will fix this.
> 
> As far as I can see the framework is expected to protect me from
> concurrent accesses on the same LED though.

Access from sysfs is synchronized but LED subsystem API can be
called from atomic context (e.g. from hard/soft irqs), which
entails issues for drivers that sleep while setting brightness -
proper locking method has to be chosen in the driver (mutex or
spin_lock).

That's why brightness_set_blocking op was provided for drivers
sleeping on brightness setting - they can safely use mutex_lock
and the rest using spin_lock implement old brightness_set.

Before introduction of brightness_set_blocking op drivers had
to use workqueue on their own, now this is handled by the LED core.

The mutex protection in LED class sysfs interface accessors was
introduced rather to allow for locking LED subsystem sysfs interface
when v4l2-flash device controls a flash LED.

> [..]
>>> +static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>>> +{
>>> +	struct lpg_led *led;
>>> +	const char *state;
>>> +	int sources;
>>> +	int size;
>>> +	u32 chan;
>>> +	int ret;
>>> +	int i;
>>> +
>>> +	sources = of_property_count_u32_elems(np, "led-sources");
>>> +	if (sources <= 0) {
>>> +		dev_err(lpg->dev, "invalid led-sources of %s\n",
>>> +			np->name);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	size = sizeof(*led) + sources * sizeof(struct lpg_channel*);
>>
>> To fix checkpatch.pl complaint:
>>
>> s/lpg_channel*/lpg_channel */
>>
> 
> Sorry, will fix.
> 
>>> +	led = devm_kzalloc(lpg->dev, size, GFP_KERNEL);
>>> +	if (!led)
>>> +		return -ENOMEM;
>>> +
>>> +	led->lpg = lpg;
>>> +	led->num_channels = sources;
>>> +
>>> +	for (i = 0; i < sources; i++) {
>>> +		ret = of_property_read_u32_index(np, "led-sources",
>>> +						 i, &chan);
>>> +		if (ret || !chan || chan > lpg->num_channels) {
>>> +			dev_err(lpg->dev,
>>> +				"invalid led-sources of %s\n",
>>> +				np->name);
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		led->channels[i] = &lpg->channels[chan - 1];
>>> +
>>> +		led->channels[i]->in_use = true;
>>> +	}
>>> +
>>> +	/* Use label else node name */
>>> +	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
>>
>> Documentation/leds/leds-class.txt states that LED class device name
>> pattern is devicename:colour:function.
>>
>> This is not explicitly stated in the common LED DT bindings, but label
>> should be prepended with devicename by the driver.
> 
> I was under the impression that "devicename" referred to the board name,
> but I presume then that this refer to the name of the "LED hardware"?


Right.

> 
>> Not all LED class drivers adhere to this rule and we have some mess in
>> this area currently, but we will fix it soon I hope.
>>
> 
> I presume the default name should be built on the form of
> dev_name(dev)::of_node->name then?
> 
> Unfortunately I can't find a single driver that does this, so please
> let me know the format you would like and I'll update the driver with
> this.

Currently the best approach is shown in the drivers/leds/leds-as3645a.c
I believe, i.e. in case label is absent, devicename is taken from the
parent DT node and function from per-LED child DT node. Please also
refer to the patch [0], which improves the code present in mainline
but has not been applied yet due to some flash LED controller related
decisions to be taken yet.

[0] https://patchwork.linuxtv.org/patch/44275/

-- 
Best regards,
Jacek Anaszewski
