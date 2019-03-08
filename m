From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Fri, 8 Mar 2019 15:08:16 -0600
Message-ID: <9e0a5485-d338-e4e8-5333-cac873158a93@ti.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
 <20190307220947.20057-2-dmurphy@ti.com> <20190308151422.GA10378@amd>
 <6d9a5821-a634-8ea2-4fe3-0603af757668@ti.com> <20190308210649.GC17626@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308210649.GC17626@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 3/8/19 3:06 PM, Pavel Machek wrote:
> 
>>>> +		led@1 {
>>>> +			reg = <1>;
>>>> +			led-sources = <1>;
>>>> +			ti,led-mode = <LM3532_BL_MODE_MANUAL>;
>>>> +			label = "keypad";
>>>
>>> I guess best variant would be inputX::backlight here, but that might
>>> be tricky to implement.
>>>
>>
>> Yeah because we don't know what input the keyboard would be on.
>> Unless there are APIs to retrieve that info.  I have not looked at the input
>> framework in a while.
> 
> Lets just make it "platform::kbd_backlight". *:kbd_backlight is
> already used by quite a few drivers.
> 

Sounds fine to me.  I will update in v3 as I posted v2 with a lot of deltas

Dan

> 									Pavel
> 


-- 
------------------
Dan Murphy
