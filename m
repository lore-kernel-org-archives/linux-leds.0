From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Thu, 7 Sep 2017 11:04:22 -0700
Message-ID: <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org> <000001d32664$db62b2a0$922817e0$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000001d32664$db62b2a0$922817e0$@gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Tue, Sep 5, 2017 at 9:34 AM, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tuesday, September 5, 2017 7:06 AM, Daniel Thompson wrote:
>>
>> On 04/09/17 16:35, Enric Balletbo i Serra wrote:
>> > Dear all,
>> >
>> > This patch series is a first RFC to know your opinion about implement
>> > support to create brightness levels tables dinamically. I tried to argue
>> > in every patch the specific reasons we think this can be interesting, to
>> > sumup, the idea behind these patches is be able to pass via device tree
>> > two parameters to the driver so it can calculate the brightness levels
>> > based on the CIE 1931 lightness formula, which is what actually
>> describes
>> > how we perceive light.
>> >
>> > I think that at least the maths involved can be improved, and I've still
>> > some doubts. With current code if you create a table with a max PWM
>> > value of 255 and 127 steps, the first numbers are repeated so I'm
>> thinking > that maybe we should skip/remove the repeated values. i.e. have
>> a table
>> > like this,
>> >
>> > [0, 1, 2, 3  ...  235, 240, 245, 250, 255]
>> >
>> > instead of
>> >
>> > [0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3  ...  235, 240, 245, 250, 255]
>> >
>> > Well, I know there are things to improve but lets see your feedback
>> first
>> > before dedicate more time on it. The patches were tested on a couple of
>> > devices but I'll test on more devices meanwhile we discuss about it.
>>
>> I'm not fully decided on this one but my initial reaction isn't to
>> question the concept so much as to ask why the number of levels should
>> go in the devicetree at all! We could just make brightness-levels
>> optional and get the driver to pick sane curves by default.
>>
>> I'm sure we can debate what "sane" means for a couple of e-mails yet but
>> in principle, given it knows the PWM max counter value, the driver
>> should be able to calculate the "right" number of steps too. If we have
>> that your core code remains but we don't have to complexify the device
>>
>> <strawman>
>> Basically we prefer X (?100 like some of the Intel DRM drivers do for
>> connector properties?) steps but we reduce the number of steps if the
>> PWM is rather course and we can't get sufficiently different steps.
>> </strawman>
>>
>> I guess the summary of what I'm saying is that if we can
>> programmatically derive brightness curves then the number of steps is
>> not really a property of the hardware and doesn't belong in devicetree.
>
> Yep, I agree with Daniel's opinion. I cannot find the reason
> this feature can be added to the device tree.
>
> In my opinion, this feature can be handled by upper user level layer,
> not backlight framework level. However, we can discuss this topic to
> find how to handle it.

Warning ahead of time: I'm not an expert.  If something I'm saying is
blatantly wrong (or even a little wrong), please correct me.

--

I'd agree that I don't think we should land Enric's series as-is.
...but I think something has been missing from the discussion so far:
the fact that the backlight driver doesn't necessarily increase light
output (in Watts) linearly in response to a linear increase in PWM
duty cycle.

I think that we can all agree that the end result is to be able to
have a backlight that is easy to scale linearly with the human
perception of brightness (aka in Lumens).  Right?  So how do we get
there?

For PWM backlight, there are two inputs to the system:

1. PWM Frequency

2. PWM Duty Cycle

I think we all know that in (almost?) all cases scaling PWM Duty Cycle
linearly doesn't result in a linear increase of perceived brightness
in Lumens.


So far in these discussions folks have been assuming that if we just
apply cie1931 to the PWM Duty Cycle then we're done and we have
perceived brightness in Lumens.  ...but I think that's not quite
right.  There are more factors.  Let's use the datasheet for a random
backlight driver, like RT8561A.  There appears to be a public
datasheet at <http://www.richtek.com/assets/product_file/RT8561A/DS8561A-02.pdf>.

A) There may be a non-linear curve between PWM Duty Cycle and LED
Current (mA).  The particular curve is different based on mode
(Digital Ctrl vs. Analog Ctrl) and also PWM Frequency.  Sometimes this
curve is nearly linear for large parts of the curve but not the whole
curve.  Sometimes even though the curve is nearly linear there is an
offset (AKA 10% duty cycle could still produce nearly zero light
output).

B) There may be a non-linear curve between LED current and light
output in Watts (I think?).

C) The human perception model means there is a non-linear curve
between light output in Watts and human perceived brightness in
Lumens.


So A and B are hardware dependent and _do_ belong in the device tree (IMHO).


...then the question is whether the device tree should specify the
curve so that the Watts scales linearly (and then the kernel adjust
for human perception) or so that Lumens scales linearly (which is
already adjusted for human perception).

Historically I believe the device tree has always wanted it so that
Lumens scales linearly.  So I guess the "we don't do anything" answer
is that the device tree should help account for for A + B + C.


If someone can show that it's useful (for some reason) to specify "A +
B" and have the cie1931 transformation happen in the kernel then we
can look at that.  I don't personally know if this is a savings or
not.  It depends on whether "A + B" is somehow easier to find (from
datasheets?) or is somehow more likely to be more linear.

--

So you could say: the current device tree already says that we want to
define a table that accounts for A + B + C, so why do we need to do
anything?

...we need to do something because currently the only way to specify
the curve in the device tree is to specify every single point in the
curve.  Then you're only allows to set the backlight to one of those
exact points.  That's bad because:

1. Specifying every point is a big waste of space.  Specifying 256
points in the device tree wastes 1K.

2. Ideally you'd want to specify more than 256 points.  If you bump a
backlight up by 1 / 256 you can notice it and it seems jerky.  If you
change the software to instead do 16 increases each by 1 / 4096 then
it is a much smoother transition.  ...but specifying 4096 points in
the device tree would waste 16 K (!).


...one proposal to fix this is to add some way to specify
piecewise-linear in the device tree.  Using piecewise linear you can
specify a nearly arbitrary curve with not too many points.  The idea
here is that you're not limiting yourself to only selecting the points
on the curve.

Hopefully Enric can try prototyping this up...

--

One last note is that it would be nice to find some way to make it
easier for people to get this right.  I will take responsibility and
admit that I've been involved in device trees that just specified a
linear curve from 1 to 256.  That's not quite right, but it's never
been terribly easy to measure the correct curve (and never super
critical).  On Chrome OS (where I've been working) historically I
believe that the cie1931 transformation has historically happened in
userspace, so effectively above I've asserted that "A + B" was linear
enough and then we've done "C" programmatically.

I'm not saying what we've done in the past is terribly correct, but I
am saying that we should definitely take into account making this very
easy for people to get right.  Possibly this could be as simple as
documenting a good / cheap light meter and how exactly to generate a
table...


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
