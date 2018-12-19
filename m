From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Wed, 19 Dec 2018 13:41:18 -0600
Message-ID: <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com> <20181219193455.GA21159@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219193455.GA21159@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the review.

On 12/19/2018 01:34 PM, Pavel Machek wrote:
> Hi!
> 
>> +static DEVICE_ATTR_WO(ctrl_bank_a_mix);
>> +static DEVICE_ATTR_WO(ctrl_bank_b_mix);
>> +static DEVICE_ATTR_WO(ctrl_bank_c_mix);
>> +
>> +static struct attribute *lp5024_ctrl_bank_attrs[] = {
>> +	&dev_attr_ctrl_bank_a_mix.attr,
>> +	&dev_attr_ctrl_bank_b_mix.attr,
>> +	&dev_attr_ctrl_bank_c_mix.attr,
>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(lp5024_ctrl_bank);
> 
> ...
>> +
>> +static DEVICE_ATTR_WO(led1_mix);
>> +static DEVICE_ATTR_WO(led2_mix);
>> +static DEVICE_ATTR_WO(led3_mix);
>> +
>> +static struct attribute *lp5024_led_independent_attrs[] = {
>> +	&dev_attr_led1_mix.attr,
>> +	&dev_attr_led2_mix.attr,
>> +	&dev_attr_led3_mix.attr,
>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(lp5024_led_independent);
> 
> Ok, so you are adding new sysfs files. Are they _really_ neccessary?
> We'd like to have uniform interfaces for the leds.

Yes I am adding these for this driver.
They adjust the individual brightness of each LED connected (what the HW guys called mixing).

The standard brightness sysfs adjusts all 3 LEDs simultaneously so that all 3 LEDs brightness are
uniform.

I did not think these belonged in the dt as they should be user space configurable

> 
> If they are neccessary, we need documentation for them.

Sure I have no problem documenting them but where do I do that?
I am assuming Documentation/leds/leds-lp5024.txt

This looks to be where Milo did this before.

Dan

> 
> Thanks,
> 									Pavel
> 


-- 
------------------
Dan Murphy
