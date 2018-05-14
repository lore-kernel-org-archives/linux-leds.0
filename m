From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 2/2] leds: lm3601x: Introduce the lm3601x LED driver
Date: Mon, 14 May 2018 15:31:04 -0500
Message-ID: <fedc86a5-35ad-03f4-9739-8f995c96b097@ti.com>
References: <20180510174717.26540-1-dmurphy@ti.com>
 <20180510174717.26540-2-dmurphy@ti.com>
 <41267191-1308-6b9b-78fa-2893a525b49a@gmail.com>
 <17630aca-1225-df61-7a5d-a921ecd9c78c@ti.com>
 <86c2bc2f-e622-9447-e4bb-b4ee37e2d44a@ti.com> <20180514200503.GB3276@amd>
 <4a631a8e-18ba-0886-039e-004980ae0cc3@ti.com> <20180514201631.GC3276@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514201631.GC3276@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, afd@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 05/14/2018 03:16 PM, Pavel Machek wrote:
> On Mon 2018-05-14 15:13:34, Dan Murphy wrote:
>> Pavel
>>
>> On 05/14/2018 03:05 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> OK.
>>>>
>>>> OK I looked at the max776973 driver and well if the flash-max-microamp and
>>>> flash-max-timeout-us nodes are missing it sets a default value for each if the
>>>> node is not present.
>>>>
>>>> So should we remove this code from the Max77693 driver too and fail probe as being asked
>>>> in this driver?
>>>
>>> Well, modifying driver without access to the hardware is tricky
>>> :-(. If it does something stupid (like using other than minimum values
>>> for the flash-max-microamp/flash-max-timeout-us), it needs to be
>>> fixed.
>>
>> Well we should be able to test the probe/parse dt node and reject the probe if the node is not
>> present.  That can be done without HW the setup is done pretty early in the probe without even attempting to communicate
>> with the hardware.
>>
> 
> Well, yes, you can do that.
> 
> But if someone is actively using board with DT w/o flash-max-microamp,
> you'll make them unhappy.
> 

I grepped the dt directories and I did not find any upstream dt files configuring the max77693
with a flash led source.  Unless Jacek can point out an upstream file I may have over looked.

Unhappiness will come from not upstreaming your code ;)

Dan

> Best regards,
> 									Pavel
> 


-- 
------------------
Dan Murphy
