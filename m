From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Wed, 30 Aug 2017 22:44:00 +0200
Message-ID: <08225c07-9467-c146-98e7-66ccb4265624@gmail.com>
References: <20170828095051.GA19930@amd>
 <991f8a29-75b7-891d-cd33-a1e50f91e67d@gmail.com> <20170829203846.GB21650@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170829203846.GB21650@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On 08/29/2017 10:38 PM, Pavel Machek wrote:
> Hi!
> 
>>> -As a specific example of this use-case, let's look at vibrate feature on
>>> -phones. Vibrate function on phones is implemented using PWM pins on SoC or
>>> -PMIC. There is a need to activate one shot timer to control the vibrate
>>> -feature, to prevent user space crashes leaving the phone in vibrate mode
>>> -permanently causing the battery to drain.
>>
>> I'm not sure if it is a good idea to remove this description. Users will
>> still be able to use transient trigger this way. It has been around for
>> five years already and there are users which employ it in this
>> particular way [0].
> 
> I am. Yes, people were doing that, but no, vibration motor is not a
> LED. PWM behaviour is different, for example, motor is likely to stop
> at low PWM values. We do not want people to do that.

Could you elaborate on how it can be harmful?

I really don't see any merit in removing this from documentation.

You can convince me by collecting some acks from involved people.
I'd like to especially see Rob's opinion. Adding Rob to this thread.

>> Apart from that it's the only documented kernel API for vibrate devices
>> AFAICT.
> 
> Input subsystem has force-feedback protocol, which is very often just
> vibrations. Documentation/input/ff.rst . Nokia N900 phone actually
> uses that API.

Word "vibration" doesn't appear there, so what this patch does
is remove explicit advertisement of kernel support for vibrate
devices without redirecting people to the replacement.

-- 
Best regards,
Jacek Anaszewski
