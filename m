From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Wed, 19 Dec 2018 15:50:36 -0600
Message-ID: <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com> <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com> <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 12/19/2018 03:36 PM, Jacek Anaszewski wrote:
> Hi Dan and Pavel,
> 
> On 12/19/18 9:41 PM, Dan Murphy wrote:
>> Pavel
>>
>> On 12/19/2018 02:10 PM, Pavel Machek wrote:
>>> On Wed 2018-12-19 13:41:18, Dan Murphy wrote:
>>>> Pavel
>>>>
>>>> Thanks for the review.
>>>>
>>>> On 12/19/2018 01:34 PM, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> +static DEVICE_ATTR_WO(ctrl_bank_a_mix);
>>>>>> +static DEVICE_ATTR_WO(ctrl_bank_b_mix);
>>>>>> +static DEVICE_ATTR_WO(ctrl_bank_c_mix);
>>>>>> +
>>>>>> +static struct attribute *lp5024_ctrl_bank_attrs[] = {
>>>>>> +    &dev_attr_ctrl_bank_a_mix.attr,
>>>>>> +    &dev_attr_ctrl_bank_b_mix.attr,
>>>>>> +    &dev_attr_ctrl_bank_c_mix.attr,
>>>>>> +    NULL
>>>>>> +};
>>>>>> +ATTRIBUTE_GROUPS(lp5024_ctrl_bank);
>>>>>
>>>>> ...
>>>>>> +
>>>>>> +static DEVICE_ATTR_WO(led1_mix);
>>>>>> +static DEVICE_ATTR_WO(led2_mix);
>>>>>> +static DEVICE_ATTR_WO(led3_mix);
>>>>>> +
>>>>>> +static struct attribute *lp5024_led_independent_attrs[] = {
>>>>>> +    &dev_attr_led1_mix.attr,
>>>>>> +    &dev_attr_led2_mix.attr,
>>>>>> +    &dev_attr_led3_mix.attr,
>>>>>> +    NULL
>>>>>> +};
>>>>>> +ATTRIBUTE_GROUPS(lp5024_led_independent);
>>>>>
>>>>> Ok, so you are adding new sysfs files. Are they _really_ neccessary?
>>>>> We'd like to have uniform interfaces for the leds.
>>>>
>>>> Yes I am adding these for this driver.
>>>> They adjust the individual brightness of each LED connected (what the HW guys called mixing).
>>>>
>>>> The standard brightness sysfs adjusts all 3 LEDs simultaneously so that all 3 LEDs brightness are
>>>> uniform.
>>>
>>> 1 LED, 1 brightness file... that's what we do. Why should this one be different?
>>>
>>
>> Yes I understand this and 1 DT child node per LED out but...
>>
>> This device has a single register to control 3 LEDs brightness as a group and individual brightness
>> registers to control the LEDs independently to mix the LEDs to a specific color.
>>
>> There needs to be a way to control both so that developers can mix and adjust the individual RGB and
>> then control the brightness of the group during run time without touching the "mixing" value.
>>
>> I don't think a user needs nor would want to have 24 different LED nodes with 24 different brightness files.
>> Or with the LP5036 that would have 36 LED nodes.
>>
>> Table 1 in the data sheet shows how the outputs map to the control banks to the LED registers.
> 
> Some time ago we had discussion with Vesa Jääskeläinen about possible
> approaches to RGB LEDs [0]. What seemed to be the most suitable
> variation of the discussed out-of-tree approach was the "color" property
> and array of color triplets defined in Device Tree per each color.
> 

Why does Device tree define the color?

Rob indicated that Device tree is supposed to define the hardware.
This thread seems to be defining the operation.

Shouldn't the color be done via user space and not dt?

Especially if they want to change the color real time?

Dan

> Please refer to [0] for the details.
> 
> [0] https://lkml.org/lkml/2018/11/9/938
> 


-- 
------------------
Dan Murphy
