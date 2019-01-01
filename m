From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Tue, 1 Jan 2019 15:26:44 +0100
Message-ID: <16b9d4ce-d99c-fd86-139c-6e7b5cfecf55@gmail.com>
References: <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <71d3ac12-5beb-0a26-71e1-5eae798e7b9f@gmail.com>
 <2bca210b-76ad-d5a9-906c-4151695050c3@gmail.com>
 <45ce01f0-af6e-1cc6-5126-fb557c7d2a82@ti.com>
 <b7c69135-1641-48cb-1770-c4c77a989efe@gmail.com> <20181229190726.GA29851@amd>
 <4b5a89ed-0c0b-3103-ca57-a0f97aa5ace9@gmail.com> <20181230173505.GA19593@amd>
 <7763a3ae-343c-0fbe-da88-afce8459e4c2@gmail.com> <20181231162828.GA8846@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181231162828.GA8846@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 12/31/18 5:28 PM, Pavel Machek wrote:
> Hi!
> 
>>>>>> There is still HSV approach [0] in store. One problem with proposed
>>>>>> implementation is fixed algorithm of RGB <-> HSV color space conversion.
>>>>>> Maybe allowing for some board specific adjustments in DT would add
>>>>>> more flexibility.
>>>>>>
>>>>>> [0] https://lkml.org/lkml/2017/8/31/255
>>>>>
>>>>> Yes we could do HSV. Problem is that that we do not really have RGB
>>>>> available. We do have integers for red, green and blue, but they do
>>>>> not correspond to RGB colorspace.
>>>>
>>>> OK, so conversion from HSV to RGB would only increase the aberration.
>>>> So, let's stick to RGB - we've got to have some stable ground and this
>>>> is something that the hardware at least pretends to be compliant
>>>> with.
>>>
>>> I'm not saying that we should stick to RGB. I'm just saying that
>>> problem is complex.
>>>
>>> And no, hardware does not even pretend to be compliant with RGB color
>>> model ( https://en.wikipedia.org/wiki/RGB_color_model ). In
>>> particular, in RGB there is non-linear brightness curve.
>>
>> Quotation from the wiki page you referred to:
>>
>> "RGB is a device-dependent color model: different devices detect or
>> reproduce a given RGB value differently, since the color elements (such
>> as phosphors or dyes) and their response to the individual R, G, and B
>> levels vary from manufacturer to manufacturer, or even in the same
>> device over time. Thus an RGB value does not define the same color
>> across devices without some kind of color management"
>>
>> This claim alone leaves much room for the manufacturers to pretend that
>> their devices are compliant with RGB model.
> 
> Much room, but everyone agrees that R=G=B=255 should be some kind of
> white, and what other colors "approximately" mean.
> 
> I have two monitors, and no, colors don't match.
> 
> Do you have access to RGB led? Try to compare two monitors, and then
> RGB led with monitor. RGB led will be _way_ off.
> 
> This chart makes sense:
> 
> https://www.rapidtables.com/web/color/RGB_Color.html
> 
> Try it on your LED device...
> 
>>> I believe problem to start with is the "white" problem. Setting
>>> R=G=B=255 will _not_ result in anything close to white light on
>>> hardware I have.
>>
>> RGBW LED controllers solve this problem. For the devices without
>> white/amber we cannot do more than the hardware allows for.
> 
> But the hardware can do some kind of white. It is just that R=G=B=255
> will result in green-ish-blue and something like R=255, G=50, B=10 is
> neccessary to get approximation of white.
> 
> IMO good start would be to specify what kind of intensities are
> neccessary to approximate white. And then try converting from RGB to
> led intensities, and see if it somehow works.

I don't have access to RGB LED, and unfortunately have lack of time
currently to play with it even if I had one.

In order to gain a full understanding of your idea of RGB to LED
intensity conversion, we'd need to see the full algorithm.

It feels like imposing some restrictions on user regarding
the available scope of colors to set.

-- 
Best regards,
Jacek Anaszewski
