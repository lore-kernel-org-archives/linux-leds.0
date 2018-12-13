From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Thu, 13 Dec 2018 09:21:16 +0100
Message-ID: <CAJKOXPcka9qc7CgXhA0jbEFUurAYO=GZP0utiuYcNee4AmnMNg@mail.gmail.com>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
 <1544613406-27026-3-git-send-email-krzk@kernel.org> <20181212122227.GB11088@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212122227.GB11088@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: pavel@ucw.cz
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, baolin.wang@linaro.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, 12 Dec 2018 at 13:22, Pavel Machek <pavel@ucw.cz> wrote:
>
> On Wed 2018-12-12 12:16:43, Krzysztof Kozlowski wrote:
> > Multiple LED triggers might need to access default pattern so add a
> > helper for that.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> >
> > New patch in the series
> >
> > ---
> >  drivers/leds/led-class.c | 25 +++++++++++++++++++++++++
> >  include/linux/leds.h     |  3 +++
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 3c7e3487b373..44b95e6480f6 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/leds.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/timer.h>
> > @@ -244,6 +245,30 @@ static int led_classdev_next_name(const char *init_name, char *name,
> >  }
> >
> >  /**
> > + * led_classdev_get_default_pattern - return default pattern
> > + *
> > + * @led_cdev: the led_classdev structure for this device
> > + *
> > + * Return: Null terminated string with default pattern from DeviceTree or NULL
> > + */
>
> Is it valid kerneldoc?

Yes, maybe kind a short but in general it follows style.
https://www.kernel.org/doc/Documentation/kernel-doc-nano-HOWTO.txt

> Note that core still owns the string so that
> caller is not expected to free it?

That should be obvious by returning "const char *". The
of_property_string() does not mention such case neither... I  can
document it but really "const char *" is self-documenting code.

> > +const char *led_classdev_get_default_pattern(struct led_classdev *led_cdev)
> > +{
> > +     struct device_node *np = dev_of_node(led_cdev->dev);
> > +     const char *pattern;
> > +
> > +     if (!np)
> > +             return NULL;
> > +
> > +     if (of_property_read_string(np, "led-pattern", &pattern))
> > +             return NULL;
> > +
> > +     if (!strlen(pattern))
> > +             return NULL;
> > +
> > +     return pattern;
> > +}

I missed here EXPORT_SYMBOL_GPL.

Best regards,
Krzysztof

> > +
> > +/**
> >   * of_led_classdev_register - register a new object of led_classdev class.
> >   *
> >   * @parent: parent of LED device
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 5263f87e1d2c..9da2bfa183ea 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -129,6 +129,9 @@ struct led_classdev {
> >       struct mutex            led_access;
> >  };
> >
> > +extern const char *
> > +led_classdev_get_default_pattern(struct led_classdev *led_cdev);
> > +
> >  extern int of_led_classdev_register(struct device *parent,
> >                                   struct device_node *np,
> >                                   struct led_classdev *led_cdev);
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
