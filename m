From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: add DT support for LEDs wired to supply and
 default brightness
Date: Thu, 27 Mar 2014 16:36:19 -0700
Message-ID: <CAK5ve-+QU-k2ezKoeAbgb8-htfTBjt9+SsHOXW+D6D28848EkQ@mail.gmail.com>
References: <E1WJUvl-0003wc-0S@rmk-PC.arm.linux.org.uk> <CAK5ve-+K+R=c7Lp+JaTCOcq9LYHTszQQg9Xp1fQHxqcQ2cVHHw@mail.gmail.com>
 <20140327225752.GD15793@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:45275 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755279AbaC0Xgl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Mar 2014 19:36:41 -0400
In-Reply-To: <20140327225752.GD15793@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Mar 27, 2014 at 3:57 PM, Uwe Kleine-K=F6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Mar 27, 2014 at 03:28:32PM -0700, Bryan Wu wrote:
>> On Fri, Feb 28, 2014 at 1:25 PM, Russell King
>> <rmk+kernel@arm.linux.org.uk> wrote:
>> > Some PWM outputs are wired such that the LED they're controlling i=
s
>> > connected to supply rather than ground.  Therefore, the duty cycle
>> > needs to be inverted to make the LED behave as it should do.
>> >
>> > We also provide a way to specify the default brightness when a
>> > trigger is not specified.
>> >
>> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>> > ---
>> >  Documentation/devicetree/bindings/leds/leds-pwm.txt |  3 +++
>> >  drivers/leds/leds-pwm.c                             | 15 ++++++++=
+++----
>> >  2 files changed, 14 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b=
/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> > index 7297107cf832..ffcb74ab61fd 100644
>> > --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> > +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> > @@ -13,6 +13,9 @@ node's name represents the name of the correspon=
ding LED.
>> >    For the pwms and pwm-names property please refer to:
>> >    Documentation/devicetree/bindings/pwm/pwm.txt
>> >  - max-brightness : Maximum brightness possible for the LED
>> > +- default-brightness : (optional) Default brightness for the LED
>> > +- active-low : (optional) For PWMs where the LED is wired to supp=
ly
>> > +  rather than ground.
>> >  - label :  (optional)
>> >    see Documentation/devicetree/bindings/leds/common.txt
>> >  - linux,default-trigger :  (optional)
>>
>> Why remove "max-brightness", "label" and "linux,default-trigger" her=
e?
> They are not removed, they are just unchanged list items after litera=
l
> '-'s in the context of the patch.
>

Sorry, my bad. please ignore my question then.

Thanks,
-Bryan
