From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about vibration
Date: Thu, 31 Aug 2017 17:22:37 -0500
Message-ID: <CAL_JsqJ2QSw1tsniTfAMkQU0KW8g+Jwktu+GyS3rjb6xTY2FEQ@mail.gmail.com>
References: <20170828095051.GA19930@amd> <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com>
 <20170829203846.GB21650@amd> <08225c07-9467-c146-98e7-66ccb4265624@gmail.com>
 <20170831080911.GA9597@amd> <da09e1eb-cf91-d001-f37e-53c8d571db07@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <da09e1eb-cf91-d001-f37e-53c8d571db07@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@osdl.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Aug 31, 2017 at 3:17 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi,
>
> On 08/31/2017 10:09 AM, Pavel Machek wrote:
>> On Wed 2017-08-30 22:44:00, Jacek Anaszewski wrote:
>>> Hi,
>>>
>>> On 08/29/2017 10:38 PM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>>> -As a specific example of this use-case, let's look at vibrate feature on
>>>>>> -phones. Vibrate function on phones is implemented using PWM pins on SoC or
>>>>>> -PMIC. There is a need to activate one shot timer to control the vibrate
>>>>>> -feature, to prevent user space crashes leaving the phone in vibrate mode
>>>>>> -permanently causing the battery to drain.
>>>>>
>>>>> I'm not sure if it is a good idea to remove this description. Users will
>>>>> still be able to use transient trigger this way. It has been around for
>>>>> five years already and there are users which employ it in this
>>>>> particular way [0].
>>
>> Actually, I checked, and no ARM mainline board does that.
>
> There might be user space clients like the Android one [0].

I don't think there is much to worry about there. Unfortunately,
Android is still pretty detached from mainline. Or to put it another
way, this is the least of the problems. We removed timed-gpio which if
anyone had a fixed Android userspace (and tracked mainline) that would
have broken them.

And you're not going to break me, because in fact I have no h/w with a
vibrator and tested all this with an LED and hacks to the DT.

>>>> I am. Yes, people were doing that, but no, vibration motor is not a
>>>> LED. PWM behaviour is different, for example, motor is likely to stop
>>>> at low PWM values. We do not want people to do that.
>>>
>>> Could you elaborate on how it can be harmful?
>>
>> Well, you can safely route low current to the LEDs. What will it to do
>> vibration motor, if you leave it on forever? Can the motor safely be
>> run forever on high current? Not sure.
>
> It's actually one of the main advantages of the "transient" trigger -
> you have to re-activate it after the end of each transition cycle,
>
> If you execute the following sequence of commands, then you're getting
> 1s blink every 3s as long as the while loop is iterating. If you break
> the loop the LED output state will be always brought down after the
> duration period, No risk that output will be left in the high state
> unless transient state was deliberately set to 0.
>
> # echo 1 > state
> # echo 1000 > duration
> # while [ 1 ] ;do echo 1 > activate ; sleep 3; done
>
>
>>> I really don't see any merit in removing this from documentation.
>>
>> There's right API to use for vibrations, and that's force-feedback
>> support in input/. Not here.
>
> Is is as easy to use as this one? It seems that it requires an application
> to call ioctl's.
>
>>> You can convince me by collecting some acks from involved people.
>>> I'd like to especially see Rob's opinion. Adding Rob to this thread.
>>
>> Rob is device tree maintainer. This has little to do with device tree.

Is that all I'm known for? My path of destruction is much wider.

It does affect DT though as we're changing the binding based on what
subsystem we use. Or more accurately, describing as an LED was a
shortcut using an existing binding and perhaps the wrong choice.

> I added him because his is the author of the Android patch [0], that
> mentions using transient trigger for the LED device named "vibrator".

IIRC, the transient trigger was added in the first place for the
vibrator usecase.

>>>>> Apart from that it's the only documented kernel API for vibrate devices
>>>>> AFAICT.
>>>>
>>>> Input subsystem has force-feedback protocol, which is very often just
>>>> vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
>>>> uses that API.
>>>
>>> Word "vibration" doesn't appear there, so what this patch does
>>> is remove explicit advertisement of kernel support for vibrate
>>> devices without redirecting people to the replacement.
>>
>> Well... this is LED documentation. If there's other documentation
>> missing somewhere else... we can fix it :-).
>
> We can fix it, but not necessarily remove the valuable information
> from this one :-)

Beyond documentation, using a GPIO or PWM (or GPIO as a PWM) works
today for at least simple vibrator control (in particular, anyone that
used the timed-gpio Android driver). The force-feedback protocol
should at least support that h/w before we steer folks away from it.

Rob
