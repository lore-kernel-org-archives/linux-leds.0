From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Thu, 20 Dec 2018 07:56:07 -0600
Message-ID: <74cc0ef0-20f8-c422-9a15-af74d0fc0fba@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com> <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com> <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Vesa

On 12/20/2018 06:40 AM, Vesa Jääskeläinen wrote:
> Hi All,
> 
> On 19/12/2018 23.50, Dan Murphy wrote:
>> On 12/19/2018 03:36 PM, Jacek Anaszewski wrote:
>>> Hi Dan and Pavel,
>>> Some time ago we had discussion with Vesa Jääskeläinen about possible
>>> approaches to RGB LEDs [0]. What seemed to be the most suitable
>>> variation of the discussed out-of-tree approach was the "color" property
>>> and array of color triplets defined in Device Tree per each color.
>>>
>>
>> Why does Device tree define the color?
>>
>> Rob indicated that Device tree is supposed to define the hardware.
>> This thread seems to be defining the operation.
>>
>> Shouldn't the color be done via user space and not dt?
>>
>> Especially if they want to change the color real time?
>>
>> Dan
>>
>>> Please refer to [0] for the details.
>>>
>>> [0] https://lkml.org/lkml/2018/11/9/938
>>>
> 
> Idea was to define preset colors in device tree as an example when you are dealing with multi-color LEDs without PWM. In that case you only have GPIOs to control and then have a problem what does those GPIO's mean.
> 
> With preset definitions one can use color names to act as a shortcut to configure GPIO's to proper state for that particular color.
> 
> For more flexible setups where you have PWM or such control you have larger space of available colors. In this case you need to somehow define also meaning of those controls.
> 
> Also we may not have LED with only red, green and blue elements. There might in example be amber, ultraviolet, white elements.
> 
> This is where device tree is concerned. It helps us craft the logical definition for LED so that we can control it from user space in common way.
> 
> Now the next problem then is how does user space work then.
> 
> For multi-color LEDs it it important to change the color atomically so that no wrong colors are being shown as user space got interrupted when controlling it.
> 
> Also we have brightness setting that would be useful for PWM controlled LEDs.
> 
> Setting color is easy when you use preset names then you only need to deal with brightness value (eg. RGB -> HSV * brightness -> RGB). Of course here additional problem is other color elements are they then scaled according to brightness value?.
> 
> Setting color as "raw" values is then next problem. In order to do it atomically it needs to be one atomic activation and could be eg. one write to "color" sysfs entry with combination of all color elements and perhaps additionally also brightness value. Next question is then what is the format for such entry then? What are the value ranges? In here we can utilize device tree definition to help define what kind of LED we do have and what kind of capabilities it does have.
> 
> Additional problem risen also in discussion was non-linearity of some control mechanisms vs. perceived color. So there might be a need for curve mapping similarly what is with backlight control and that would be defined either in device tree and possibly in user space if there is a need for that. I suppose golden curve definition in device tree should be good enough.
> 
> Then there was additional discussion about possible animation support but I would leave that for future design as that would then be utilizing the same framework.
> 
> I suppose color space handling and that kind of stuff should be in some led core functionality and then raw control should be part of physical led driver.
> 
> I was planning to play with it during holiday season but lets see how it goes. Feel free to also experiment with the idea.
> 

Again I don't think device tree should be used to set color policy.
This is to restricting it may be good for GPIO fixed current RGB LEDs but for variable RGB LEDs it would be very restricting.

I believe this needs to be part of the LED framework and leave the device tree to define the HW and not define the product.

Maybe a new devm_rgb_register call that exposes the color palette and can consolidate the 3 LEDs into a single sysfs node.

Dan


> Thanks,
> Vesa Jääskeläinen


-- 
------------------
Dan Murphy
