From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt: bindings: lp5024: Introduce the lp5024 and lp5018
 RGB driver
Date: Mon, 14 Jan 2019 14:29:38 -0600
Message-ID: <8f67b130-23d6-d4f3-9732-47661bafc958@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <6c62956e-7789-58ba-5437-f2e033f2825c@gmail.com>
 <366cbf6d-94fa-fea9-be58-07ddb09cff3a@ti.com>
 <df59c10d-7038-cb4a-45f0-7420254c6398@gmail.com>
 <ec0393b7-118e-1f3b-d5af-86ecdf66412a@ti.com>
 <ae700129-7b59-c92b-0c0a-b57a6f230ff7@gmail.com>
 <adcd7987-f7fc-ae1f-9aa4-cebcbf01ad58@ti.com>
 <1702dfd6-b08f-c1ff-e46d-1366618bedb0@gmail.com>
 <72112839-11d4-54be-df94-b2322f77cb0f@ti.com>
 <8b126077-c200-ed34-03b7-6d43a22fb0c9@gmail.com>
 <92cc81dc-7280-8bf0-9536-9c4d990eaf3b@ti.com>
 <459a4d7a-980b-5a46-9bd8-7a7afb37e1c3@gmail.com>
 <76577ad1-8c29-c5f6-e253-a8541a150dc0@ti.com>
 <3674d644-ccf6-d545-fc41-6bdf8960df44@gmail.com>
 <0140ad64-432e-7723-2415-0b3a8ac4d8dc@ti.com>
 <ed78b2fd-7ab8-d7c3-cf28-4d5b06783fb3@gmail.com>
 <1c452daa-d77e-5d31-3694-b9dfda9cc8f3@ti.com>
 <9c129b00-39e6-dd29-c2a7-0506a1780fb8@gmail.com>
 <17752128-5a08-4122-9502-47f2fca9a8bb@ti.com>
 <5204698e-bd20-9989-9c85-09db7984ed28@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5204698e-bd20-9989-9c85-09db7984ed28@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 1/14/19 2:28 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 1/14/19 9:14 PM, Dan Murphy wrote:
> [...]
>>>>>> One last question I am going to add the LP5036 and 30 which have the same technology but slightly different register maps.
>>>>>> Should I rename the driver to LP5036.c as the 30, 24 and 18 would technically be subsets?
>>>>>
>>>>> How about leds-lp50xx.c ? You can also create a library like
>>>>> drivers/leds/leds-lp55xx-common.c if that would simplify the code.
>>>>>
>>>>
>>>> A library would be overkill.
>>>> Is it just the DT that we don't want to use wild cards in naming?
>>>
>>> DT is for concrete board and cpu, so it doesn't make sense to
>>> use wildcards in *.dts file names.
>>>
>>>> leds-lp50xx.c is a fine name to me.
>>>
>>> Apart of that, I've been also mulling over if we shouldn't go for single
>>> "color" sysfs file for setting r,g,b components at one go.
>>> I don't see any downsides. There is no risk that number of elements will
>>> grow, and the benefit will be an atomic way of setting color - the
>>> feature people are looking for. Vesa was mentioning the case where lack
>>> of it had been a real problem [0].
>>>
>>
>> Well thats what I did and have it working.  I was going to submit v2 today after I write the documentation.
>>
>> I basically exposed a "hue" file that takes in a 24 bit R,G,B value and sets the registers accordingly.
>>
>> I figured hue would be good as that may be the same ABI we have when the RGB framework comes in.
>>
>> The change over would be transparent to the past users.
> 
> I'd prefer "color" over "hue". The latter implies HSV color space, which
> was the first thing that came to my mind when reading your message.
> 

Done

Dan
-- 
------------------
Dan Murphy
