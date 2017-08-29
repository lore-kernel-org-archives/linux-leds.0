From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Tue, 29 Aug 2017 21:47:14 +0200
Message-ID: <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
References: <20170828095051.GA19930@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170828095051.GA19930@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the patch.

On 08/28/2017 11:50 AM, Pavel Machek wrote:
> 
> Spell "LED" consistently with uppercase.
> 
> We do not want people to use LED subsystem for vibrations; there's
> already support for that in input subsystem. Remove notes about
> vibrations not to confuse people.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> 
> diff --git a/Documentation/leds/ledtrig-transient.txt b/Documentation/leds/ledtrig-transient.txt
> index 3bd38b4..f412603 100644
> --- a/Documentation/leds/ledtrig-transient.txt
> +++ b/Documentation/leds/ledtrig-transient.txt
> @@ -1,7 +1,7 @@
>  LED Transient Trigger
>  =====================
>  
> -The leds timer trigger does not currently have an interface to activate
> +The LED timer trigger does not currently have an interface to activate
>  a one shot timer. The current support allows for setting two timers, one for
>  specifying how long a state to be on, and the second for how long the state
>  to be off. The delay_on value specifies the time period an LED should stay
> @@ -16,17 +16,11 @@ set a timer to hold a state, however when user space application crashes or
>  goes away without deactivating the timer, the hardware will be left in that
>  state permanently.
>  
> -As a specific example of this use-case, let's look at vibrate feature on
> -phones. Vibrate function on phones is implemented using PWM pins on SoC or
> -PMIC. There is a need to activate one shot timer to control the vibrate
> -feature, to prevent user space crashes leaving the phone in vibrate mode
> -permanently causing the battery to drain.

I'm not sure if it is a good idea to remove this description. Users will
still be able to use transient trigger this way. It has been around for
five years already and there are users which employ it in this
particular way [0].

Apart from that it's the only documented kernel API for vibrate devices
AFAICT.

>  Transient trigger addresses the need for one shot timer activation. The
> -transient trigger can be enabled and disabled just like the other leds
> +transient trigger can be enabled and disabled just like the other LED
>  triggers.
>  
> -When an led class device driver registers itself, it can specify all leds
> +When an LED class device driver registers itself, it can specify all LED
>  triggers it supports and a default trigger. During registration, activation
>  routine for the default trigger gets called. During registration of an led
>  class device, the LED state does not change.
> @@ -42,12 +36,12 @@ that are active at the time driver gets suspended, continue to run, without
>  being able to actually change the LED state. Once driver is resumed, triggers
>  start functioning again.
>  
> -LED state changes are controlled using brightness which is a common led
> +LED state changes are controlled using brightness which is a common LED
>  class device property. When brightness is set to 0 from user space via
>  echo 0 > brightness, it will result in deactivating the current trigger.
>  
>  Transient trigger uses standard register and unregister interfaces. During
> -trigger registration, for each led class device that specifies this trigger
> +trigger registration, for each LED class device that specifies this trigger
>  as its default trigger, trigger activation routine will get called. During
>  registration, the LED state does not change, unless there is another trigger
>  active, in which case LED state changes to LED_OFF.
> @@ -56,12 +50,12 @@ During trigger unregistration, LED state gets changed to LED_OFF.
>  
>  Transient trigger activation routine doesn't change the LED state. It
>  creates its properties and does its initialization. Transient trigger
> -deactivation routine, will cancel any timer that is active before it cleans
> +deactivation routine will cancel any timer that is active before it cleans
>  up and removes the properties it created. It will restore the LED state to
>  non-transient state. When driver gets suspended, irrespective of the transient
>  state, the LED state changes to LED_OFF.
>  
> -Transient trigger can be enabled and disabled from user space on led class
> +Transient trigger can be enabled and disabled from user space on LED class
>  devices, that support this trigger as shown below:
>  
>  echo transient > trigger
> @@ -144,7 +138,6 @@ repeat the following step as needed:
>  	echo none > trigger
>  
>  This trigger is intended to be used for for the following example use cases:
> - - Control of vibrate (phones, tablets etc.) hardware by user space app.
>   - Use of LED by user space app as activity indicator.
>   - Use of LED by user space app as a kind of watchdog indicator -- as
>         long as the app is alive, it can keep the LED illuminated, if it dies
> 

[0]
https://android.googlesource.com/platform%2Fhardware%2Flibhardware/+/61701df363310a5cbd95e3e1638baa9526e42c9

-- 
Best regards,
Jacek Anaszewski
