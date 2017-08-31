From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about vibration
Date: Thu, 31 Aug 2017 10:52:13 +0300
Message-ID: <87k21k898y.fsf@intel.com>
References: <20170828095051.GA19930@amd> <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com> <20170829203846.GB21650@amd>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170829203846.GB21650@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 29 Aug 2017, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > -As a specific example of this use-case, let's look at vibrate feature on
>> > -phones. Vibrate function on phones is implemented using PWM pins on SoC or
>> > -PMIC. There is a need to activate one shot timer to control the vibrate
>> > -feature, to prevent user space crashes leaving the phone in vibrate mode
>> > -permanently causing the battery to drain.
>> 
>> I'm not sure if it is a good idea to remove this description. Users will
>> still be able to use transient trigger this way. It has been around for
>> five years already and there are users which employ it in this
>> particular way [0].
>
> I am. Yes, people were doing that, but no, vibration motor is not a
> LED. PWM behaviour is different, for example, motor is likely to stop
> at low PWM values. We do not want people to do that.
>
>> Apart from that it's the only documented kernel API for vibrate devices
>> AFAICT.
>
> Input subsystem has force-feedback protocol, which is very often just
> vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
> uses that API.

N900 as shipped by Nokia used an ad hoc sysfs interface. Because that
sucked, I advocated using the force feedback API for N950 and
N9. Because what is vibration but force feedback? It's a much more
versatile API for vibration than a simple trigger. You get to upload
effects and have the kernel play them for you, also stopping them in a
timely manner regardless of the userspace dying and whatnot. I didn't
double check now, but IIRC you could also link the input to force
feedback, e.g. for touch vibrations.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
