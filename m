From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Wed, 26 Apr 2017 21:49:36 +0200
Message-ID: <2008d3ad-672f-7d57-74fb-22f0319f6f08@gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com>
 <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
 <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com>
 <20170425223455.GA24467@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36662 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967121AbdDZTuW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Apr 2017 15:50:22 -0400
In-Reply-To: <20170425223455.GA24467@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, David Lin <dtwlin@google.com>
Cc: rpurdie@rpsys.net, robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/26/2017 12:34 AM, Pavel Machek wrote:
> On Mon 2017-04-24 20:05:59, David Lin wrote:
>> Hi Jacek,
>>
>> On Mon, Apr 24, 2017 at 12:59 PM, Jacek Anaszewski
>> <jacek.anaszewski@gmail.com> wrote:
>>>
>>> Hi David,
>>>
>>> Thanks for the patch.
>>>
>>> Unfortunately we cannot switch to using hr timers just like that
>>> without introducing side effects for many devices. We had similar
>>> attempt of increasing timer tirgger accuracy two years ago [0].
>>>
>>> In short words, for drivers that can sleep while setting brightness
>>> and/or are using a bus like I2C you will not be able to enforce
>>> 1ms delay period.
>>>
>>> I recommend you to go through the thread [0] so that we had
>>> a well defined ground for the discussion on how to address this
>>> issue properly.
>>>
>>
>> I think I understand the background now, and would agree that not all
>> the LED driver require hrtimer as human eye can't probably tell
>> there's a 10ms variation in a blink. However, there's a need to
>> support hrtimer if the LED subsystem claims support the use case of
>> vibrator (please see Documentation/leds/ledtrig-transient.txt) as even
>> a 5ms of variation is perceivable to the user. I'm thinking if a
> 
> I believe we should fix the documentation. It is LED subsystem,
> requirements are different, and we _already_ have haptic feedback
> subsystem.
> 								Pavel
> 
> IOW, I suggest this: (hmm, and more led->LED is needed, and more
> english fixes. Oh well.)
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/Documentation/leds/ledtrig-transient.txt b/Documentation/leds/ledtrig-transient.txt
> index 3bd38b4..c5cf475 100644
> --- a/Documentation/leds/ledtrig-transient.txt
> +++ b/Documentation/leds/ledtrig-transient.txt
> @@ -16,17 +16,11 @@ set a timer to hold a state, however when user space application crashes or
>  goes away without deactivating the timer, the hardware will be left in that
>  state permanently.
>  
> -As a specific example of this use-case, let's look at vibrate feature on
> -phones. Vibrate function on phones is implemented using PWM pins on SoC or
> -PMIC. There is a need to activate one shot timer to control the vibrate
> -feature, to prevent user space crashes leaving the phone in vibrate mode
> -permanently causing the battery to drain.
> -
>  Transient trigger addresses the need for one shot timer activation. The
>  transient trigger can be enabled and disabled just like the other leds
>  triggers.
>  
> -When an led class device driver registers itself, it can specify all leds
> +When an LED class device driver registers itself, it can specify all leds

Also: s/leds/LEDs/ :-)


>  triggers it supports and a default trigger. During registration, activation
>  routine for the default trigger gets called. During registration of an led
>  class device, the LED state does not change.
> @@ -144,7 +138,6 @@ repeat the following step as needed:
>  	echo none > trigger
>  
>  This trigger is intended to be used for for the following example use cases:
> - - Control of vibrate (phones, tablets etc.) hardware by user space app.
>   - Use of LED by user space app as activity indicator.
>   - Use of LED by user space app as a kind of watchdog indicator -- as
>         long as the app is alive, it can keep the LED illuminated, if it dies
> 
> 

Ack. Will you submit an official patch?

-- 
Best regards,
Jacek Anaszewski
