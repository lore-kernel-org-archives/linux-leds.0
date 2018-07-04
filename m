From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 22:36:55 +0200
Message-ID: <6a24e147-f2c7-9d82-0ce6-3238adf892b0@gmail.com>
References: <20180703155328.GA18299@arbeit> <20180704065305.GA23509@amd>
 <20180704073443.GA9388@1wt.eu> <20180704181916.GA10785@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704181916.GA10785@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Willy Tarreau <w@1wt.eu>
Cc: Andreas Klinger <ak@it-klinger.de>, ben.whitten@gmail.com, geert+renesas@glider.be, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi All,

On 07/04/2018 08:19 PM, Pavel Machek wrote:
> Hi!
> 
>> On Wed, Jul 04, 2018 at 08:53:05AM +0200, Pavel Machek wrote:
>>> As I stated before, I don't think morse encoder belongs in kernel.
>>
>> On the opposite, I think that the kernel needs to be a bit more autonomous
>> when it comes to reporting its own issues. Being able to report a panic
>> when userland cannot be accessed for example is the reason why we've seen
>> various features such as blinking keyboard LEDs for this.
> 
> Being able to report panics by blinking would be nice... but proposed
> patch does NOT do that.

Actually we do have already drivers/leds/trigger/ledtrig-panic.c.

>>> LED pattern trigger should be merged, instead.
>>
>> Well, just like we have LED and LED triggers in the kernel, I think having
>> a generic way to use patterns could be nice and in this case Morse could be
>> one such pattern, but if that means it's limited to userland to configure
>> it then it sadly voids all of its benefits.
> 
> Proposed patch is already limited to configuration from userland... so
> it does not have any benefits.

We could turn this piece of code into a lib and make it usable by
both kernel/panic.c (similar to panic_blink) as well by
the ledtrig-morse.c.

> If special "panic blinking" mode is wanted -- I guess that would make
> sense.
> 
> But
> 
> a) trigger may not be right infrastructure for that; triggers need
> quite a lot kernel to be working, as they run in separate threads --
> panic blinking probably should be mdelay / brightness set / mdelay,
> and probably limited to LEDs that can be accessed without sleeping.
> 
> b) we may want trigger to be used for something else (Caps lock? HDD
> activity?)  when not panicked. Thus, again, trigger is not exactly
> suitable. (It might make sense to blink many/all LEDs simultaneously
> to make it super obvious to the user).
> 
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
