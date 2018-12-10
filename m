From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] leds: trigger: Add pattern initialization from Device Tree
Date: Mon, 10 Dec 2018 09:34:44 +0100
Message-ID: <CAJKOXPfGFUBsaUixth4T3qzDu_mdvZ9XQNhEUExWogv_5mfySg@mail.gmail.com>
References: <1544185974-5932-1-git-send-email-krzk@kernel.org>
 <1544185974-5932-4-git-send-email-krzk@kernel.org> <20181209081722.GB7561@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209081722.GB7561@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: pavel@ucw.cz
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, baolin.wang@linaro.org, rteysseyre@gmail.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sun, 9 Dec 2018 at 09:17, Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2018-12-07 13:32:54, Krzysztof Kozlowski wrote:
> > Allow initialization of pattern used in pattern trigger from Device Tree
> > property.
> >
> > This is especially useful for embedded systems where the pattern trigger
> > would be used to indicate the process of boot status in a nice,
> > user-friendly blinking way.  This initialization pattern will be used
> > till user-space is brought up and sets its own pattern, indicating the
> > boot status is for example finished.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/leds/trigger/ledtrig-pattern.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
> > index 1870cf87afe1..96309d3bc43c 100644
> > --- a/drivers/leds/trigger/ledtrig-pattern.c
> > +++ b/drivers/leds/trigger/ledtrig-pattern.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of.h>
> >  #include <linux/slab.h>
> >  #include <linux/timer.h>
> >
> > @@ -331,6 +332,21 @@ static const struct attribute_group *pattern_trig_groups[] = {
> >       NULL,
> >  };
> >
> > +static void pattern_init(struct led_classdev *led_cdev)
> > +{
> > +     struct device_node *np = dev_of_node(led_cdev->dev);
> > +     const char *pattern;
> > +
> > +     if (!np)
> > +             return;
> > +
> > +     if (!of_property_read_string(np, "linux,trigger-pattern", &pattern)) {
> > +             if (strlen(pattern))
> > +                     pattern_trig_store_patterns(led_cdev, pattern,
> > +                                                 strlen(pattern), false);
> > +     }
> > +}
>
> "  if (of_...())
>       return;
>
>    if (!strlen())
>        return"

Sure.

>
> Check return value of pattern_trig_store_patterns().

i can add printing of error in such case but I am not sure whether it
is worth to fail entire pattern_trig_activate().

Best regards,
Krzysztof
