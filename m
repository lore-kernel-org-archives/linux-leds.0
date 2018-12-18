From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: leds: Add pattern initialization from
 Device Tree
Date: Tue, 18 Dec 2018 10:06:14 +0100
Message-ID: <CAJKOXPd_icrPUQJhbcHkovQ7DFYM5mVZmXG_qbHv3KKjxVEdbg@mail.gmail.com>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
 <1544613406-27026-2-git-send-email-krzk@kernel.org> <20181217224029.GA16132@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217224029.GA16132@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 17 Dec 2018 at 23:40, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 12, 2018 at 12:16:42PM +0100, Krzysztof Kozlowski wrote:
> > Document new linux,trigger-pattern property for initialization of LED
> > pattern trigger.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/leds/common.txt | 36 +++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > index aa1399814a2a..3daccd4ea8a3 100644
> > --- a/Documentation/devicetree/bindings/leds/common.txt
> > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > @@ -37,6 +37,42 @@ Optional properties for child nodes:
> >       "ide-disk" - LED indicates IDE disk activity (deprecated),
> >                    in new implementations use "disk-activity"
> >       "timer" - LED flashes at a fixed, configurable rate
> > +     "pattern" - LED alters the brightness for the specified duration with one
> > +                 software timer (requires "led-pattern" property)
> > +
> > +- led-pattern : String with default pattern for certain triggers. Each trigger
> > +                may parse this string differently:
> > +                - one-shot : two numbers specifying delay on and delay off,
> > +                - timer : two numbers specifying delay on and delay off,
>
> I misunderstood that these triggers applied to this. Is there any point
> to supporting these modes?

I am not sure whether I explained this clearly enough, so let me be
more specific. The "led-pattern" is a string with pattern which will
be interpreted differently, based on LED trigger. One-shot and timer
triggers expect two numbers. Pattern trigger expects full pattern.

> Aren't they just a subset or simplification
> of a pattern?

Yes, they are.

>
> Can we control the timer frequency from DT? The pattern could address
> that limitation.

No, currently we cannot. This patch with pattern solves that issue.

>
> > +                - pattern : The pattern is given by a series of tuples, of
>
> Don't you need one-shot vs. repeat modes for patterns too?

Repeat mode is defined by trigger. One-shot is one time. Timer and
patter triggers are repeating.

>
> I could imagine you'd want a pattern for any trigger.

In general I think that only these three triggers require such
initialization through pattern. Other triggers - like heartbeat or
activity - have they own bindings (or do not need any).

Following Pavel's suggestion, I could convert it to array of integers
which still should be suitable for these and any future triggers
operating on numbers.

Best regards,
Krzysztof
