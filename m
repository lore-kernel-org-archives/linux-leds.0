From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 12 Apr 2019 06:50:32 -0500
Message-ID: <5675ac20-6db2-34ea-938a-01f0076b87e7@ti.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-3-dmurphy@ti.com> <20190412000707.70f8319f@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412000707.70f8319f@nic.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Marek

On 4/11/19 5:07 PM, Marek Behun wrote:
> Hi Dan,
> this probaly was discussed, but I did not follow brightness model
> discussions:
> what will happen if I set yellow by writing into yellow mode
> brightness, and then orange by writing orange model brightness?
> Will the resulting color be a mix of yellow and orange, or will the
> orange overwrite the yellow setting?
> 

This was not discussed and is a good question.  If you write the yellow mode for a group of
LEDs then yellow would be produced for the brightness requested.

If orange is then requested then orange should be displayed at the brightness level requested.
So yes the orange will over write the yellow.

The next question is if the absolute colors are written does it produce the same behavior?

So if you have yellow and write to the red should the red LED brightness be modified or should the
color switch to red?
And if the red LED is on and the blue LED is written should the color switch to blue or should the blue and red LEDs be mixed together?

This is tricky as the user space can write the individual absolute colors and mix the LEDs to produce varying
colors.  But the behavior writing the brightness models are different.

I would almost prefer that the user space reads the available absolute LED colors and creates the devices supported color palette and write the absolute LED colors only.  But this violates the requirements asked for.

Dan

> Marek
> 
