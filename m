From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] leds: leds-mc13783: Add devicetree support
Date: Sat, 07 Dec 2013 13:14:19 +0100
Message-ID: <1579629.IvjYnzNUAW@flatron>
References: <1386397464-31033-1-git-send-email-shc_work@mail.ru> <4531338.dvjMOzW3sA@flatron> <1386418121.30063489@f424.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:48264 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753190Ab3LGMOZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 7 Dec 2013 07:14:25 -0500
In-Reply-To: <1386418121.30063489@f424.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Philippe =?ISO-8859-1?Q?R=E9tornaz?= <philippe.retornaz@epfl.ch>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>

On Saturday 07 of December 2013 16:08:41 Alexander Shiyan wrote:
> > Hi Alexander,
> > 
> > Please see my comments inline.
> > 
> > On Saturday 07 of December 2013 10:24:24 Alexander Shiyan wrote:
> > > This patch adds devicetree support for the MC13XXX LED driver.
> > > 
> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/mc13xxx.txt |  38 +++++
> > >  drivers/leds/leds-mc13783.c                       | 161 ++++++++++++++--------
> > >  2 files changed, 143 insertions(+), 56 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> > > index abd9e3c..bdf31e8 100644
> > > --- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> > > @@ -10,9 +10,37 @@ Optional properties:
> > >  - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
> > >  
> > >  Sub-nodes:
> > > +- leds : Contain the led nodes and initial register values in property
> > > +  "led_control". Number of register depends of used IC, for MC13783 is 6,
> > > +  for MC13892 is 4. See datasheet for bits definitions of these register.
> > 
> > Can't the driver somehow derive correct register values from LEDs listed
> > as subnodes of this node? If not, I'd say that more fine grained
> > properties should be used instead. What kind of configuration do these
> > register control?
> 
> Registers contain the basic state for LED (high current mode, current,
> duty cycle, ramp etc.). Presence and bit position for each LED is individually.
> So I decided that the use of a simple initial setup is better, especially since
> these will not be changed during operation.
> 
> > > +  Each led node should contain "reg", which used as LED ID (described below).
> > > +  Optional properties "label" and "linux,default-trigger" is described in
> > > +  Documentation/devicetree/bindings/leds/common.txt.
> > >  - regulators : Contain the regulator nodes. The regulators are bound using
> > >    their names as listed below with their registers and bits for enabling.
> > >  
> > > +MC13783 LED IDs:
> > > +    0  : Main display
> > > +    1  : AUX display
> > > +    2  : Keypad
> > > +    3  : Red 1
> > > +    4  : Green 1
> > > +    5  : Blue 1
> > > +    6  : Red 2
> > > +    7  : Green 2
> > > +    8  : Blue 2
> > > +    9  : Red 3
> > > +    10 : Green 3
> > > +    11 : Blue 3
> > > +
> > > +MC13892 LED IDs:
> > > +    12 : Main display
> > > +    13 : AUX display
> > > +    14 : Keypad
> > > +    15 : Red
> > > +    16 : Green
> > > +    17 : Blue
> > 
> > This looks a bit strange. Does the numbering relate to hardware design
> > in any way? From what I can see, those are just enums values from Linux
> > driver, which doesn't seem the right namespace to export to DT.
> 
> Which a better solution here? Make names as well as for regulators?
> Thanks.

I don't have anything against using simple numbers, but they should be
somehow related to hardware layout. If such relation does not exist, then
using the <0, number_of_leds_in_the_chip - 1> namespace should be fine.

Best regards,
Tomasz
